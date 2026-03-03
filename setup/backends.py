from ldap3 import Server, Connection, NTLM, ALL
from django.contrib.auth import get_user_model
from django.contrib.auth.backends import BaseBackend
from django.contrib.auth.models import Group
from setup.models.entidad import Entidad
import requests
import re

 
User = get_user_model()


class ActiveDirectoryBackend(BaseBackend):

    def authenticate(self, request, username=None, password=None):
        if not username or not password:
            return None

        server = Server("10.0.0.14", get_info=ALL)
        dominio = "DIRISLC"

        try:
            conn = Connection(
                server,
                user=f"{dominio}\\{username}",
                password=password,
                authentication=NTLM,
                auto_bind=True
            )
        except Exception as e:
            print("Error autenticando contra AD:", e)
            return None

        if not conn.bound:
            return None

        # -----------------------------
        # Buscar datos en AD
        # -----------------------------
        search_base = "DC=dirislc,DC=gob,DC=pe"
        search_filter = f"(sAMAccountName={username})"

        conn.search(
            search_base=search_base,
            search_filter=search_filter,
            attributes=["givenName", "sn", "description"]
        )

        first_name = ""
        last_name = ""
        document = ""

        if conn.entries:
            entry = conn.entries[0]

            if entry.givenName:
                first_name = str(entry.givenName)

            if entry.sn:
                last_name = str(entry.sn)

            if entry.description:
                desc = str(entry.description)
                numeros = re.findall(r'\d+', desc)
                if numeros:
                    document = numeros[-1][-8:]

        # -----------------------------
        # Crear o actualizar usuario
        # -----------------------------
        user, created = User.objects.get_or_create(username=username)

        user.first_name = first_name
        user.last_name = last_name
        user.document = document
        user.is_active = True

        # -----------------------------
        # CONSUMIR API INTERNA
        # -----------------------------
        if document:
            try:
                url = f"http://10.0.5.64/HelpdeskApi/Helpdesk/obtenerPersona/{document}"
                response = requests.get(url, timeout=5)

                if response.status_code == 200:
                    data = response.json()

                    # Guardar datos laborales
                    user.id_cargo = data.get("id_cargo")
                    user.cargo = data.get("cargo")
                    user.id_dependencia = data.get("id_dependencia")
                    user.dependencia = data.get("dependencia")
                    user.email = data.get("correo")
                    user.usuario_service = data.get("id_persona")


                    # -------------------------------------------------
                    # COMPARAR id_dependencia CON codigo DE Entidad
                    # -------------------------------------------------
                    id_dependencia_api = str(data.get("id_dependencia"))

                    if id_dependencia_api:
                        entidad = Entidad.objects.filter(
                            codigo=id_dependencia_api
                        ).first()

                        if entidad:
                            user.entidad = entidad   # <-- ForeignKey
                            print("Entidad asignada correctamente")
                        else:
                            print("No se encontró entidad con código:",
                                  id_dependencia_api)

                else:
                    print("API respondió con error:", response.status_code)

            except Exception as e:
                print("Error consultando API interna:", e)

        # Si es nuevo usuario
        if created:
            user.set_unusable_password()

            try:
                grupo = Group.objects.get(id=3)
                user.groups.add(grupo)
            except Group.DoesNotExist:
                print("El grupo con id=3 no existe")

        user.save()

        return user

    def get_user(self, user_id):
        try:
            return User.objects.get(pk=user_id)
        except User.DoesNotExist:
            return None
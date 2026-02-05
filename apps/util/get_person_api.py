import json
from json import JSONDecodeError
import socket


from django.http import HttpRequest
import requests
from setup.models.usuario import Usuario
from apps.reclamo.models.entidad_reclamo import ApiRequestLog

 

def get_person_api(dni):
    headers = {
        'Content-Type': 'application/json',
        'Authorization': 'token fc062659199a099fade617ceaebfa803308472bb'
    }
    r = requests.get('https://dni.optimizeperu.com/api/prod/persons/' + dni, headers=headers)
    try:
        response_dict = json.loads(r.text)
        return response_dict
    except JSONDecodeError:
        return {"dni": "xxxxx", "name": "xxxxx", "first_name": "xxxxx", "last_name": "xxxxx", "cui": "xxxxx"}



 

def get_person_api_reniec(dni, request):
    headers = {
        'Content-Type': 'application/json',
        'Authorization': 'token eed63ab26117dacf4986f37ca1e61c4ccafc2aea'
    }

    try:
        # Obtén la IP local verdadera
        ip_local = socket.gethostbyname(socket.gethostname())  # Obtiene la IP local de la máquina ejecutando el código

        # Obtén el nombre de usuario y user_id del usuario autenticado
        if request:
            if request.user.is_authenticated:
                username = request.user.username
                user_id = request.user.id  # ID del usuario autenticado
            else:
                username = 'Anonimo'
                user_id = None  # Valor para usuarios no autenticados

            # Obtén el nombre de la PC desde un encabezado personalizado
            nombre_pc = request.META.get('HTTP_X_COMPUTER_NAME', 'Desconocido')
        else:
            # Valores por defecto para cuando no hay request
            username = 'Sistema'
            user_id = None
            nombre_pc = 'Desconocido'

        # Obtén la IP pública consultando un servicio externo
        ip_publica = requests.get('https://api.ipify.org').text

        # Realiza la consulta a la API
        r = requests.get(
            f'http://192.168.1.4/api/web-service/person-complete/{dni}',
            headers=headers,
            verify=False,
            stream=True,
            timeout=10
        )

        if r.status_code == 200:
            response_dict = json.loads(r.text)

            # Concatenar nombres completos si los campos existen
            nombres = response_dict.get('nombres', '')
            apellido_paterno = response_dict.get('apellido_paterno', '')
            apellido_materno = response_dict.get('apellido_materno', '')

            # Crear el campo nombre_consulta
            nombre_consulta = f"{nombres} {apellido_paterno} {apellido_materno}".strip()

            # Guarda el log en la base de datos, incluyendo nombre_consulta
            ApiRequestLog.objects.create(
                dni_consultado=dni,
                status_code=r.status_code,
                response_data=response_dict,
                ip_local=ip_local,
                ip_publica=ip_publica,
                origen='SISTEMA DE MESA DE AYUDA DIRIS LIMA CENTRO',
                username=username,
                user_id=user_id,
                nombre_pc=nombre_pc,
                nombre_consultado=nombre_consulta  # Nuevo campo de nombre completo
            )

            return response_dict
        else:
            return {"status": "Error"}
    except requests.exceptions.Timeout as e:
        return {"status": "Error"}
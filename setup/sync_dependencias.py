import requests
from setup.models.entidad import Entidad

def sync_dependencias():
    url = "http://10.0.5.64/HelpdeskApi/Helpdesk/listarDependencia"

    try:
        response = requests.get(url, timeout=5)
        data = response.json()

        for item in data:
            Entidad.objects.update_or_create(
                codigo=item['id_dependencia'],  # Si existe lo actualiza
                defaults={
                    'nombre': item['dependencia']
                }
            )

        print("Dependencias sincronizadas correctamente")

    except Exception as e:
        print("Error sincronizando dependencias:", e)
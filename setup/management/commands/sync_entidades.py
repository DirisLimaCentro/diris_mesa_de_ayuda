from django.core.management.base import BaseCommand
from setup.sync_dependencias import sync_dependencias


class Command(BaseCommand):
    help = 'Sincroniza dependencias desde API externa'

    def handle(self, *args, **kwargs):
        sync_dependencias()
        self.stdout.write(self.style.SUCCESS('Sincronización completada'))
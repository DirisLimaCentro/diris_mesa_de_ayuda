from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import Group, Permission
from django.db.models import Q, Count
from django.http import HttpResponse
from django.shortcuts import redirect
from django.template import loader
from django.urls import reverse
from django.views.generic import TemplateView

from apps.reclamo.models.entidad_reclamo import EntidadReclamo
from apps.util.get_type_admin import get_type_admin
from setup.models.entidad import Entidad
from setup.models.menu import Menu, GroupMenu
from setup.models.usuario import Usuario
from django.shortcuts import render
from django.db import connection

ERROR_404_TEMPLATE_NAME = '404.html'
ERROR_403_TEMPLATE_NAME = '403.html'
ERROR_400_TEMPLATE_NAME = '400.html'
ERROR_500_TEMPLATE_NAME = '500.html'


 


class MenuItem(object):
    def __init__(self, id, name, url, icon):
        self.id = id
        self.name = name
        self.url = url
        self.icon = icon

    def serialize(self):
        return self.__dict__


def get_menu(user):
    group_list = list(col["id"] for col in Group.objects.values("id")
                      .filter(Q(user__id=user.id)).distinct())
    permission_list = list(col["id"] for col in Permission.objects
                           .values("id")
                           .filter(Q(group__in=group_list) | Q(user__id=user.id)).distinct())

    if user.is_superuser:
        menu_childrens_t = list(
            col["id"] for col in
            Menu.objects.values("id").all().order_by("id"))
    else:
        menu_childrens_t = list(
            col["menus"] for col in
            GroupMenu.objects.values("menus").filter(Q(group__in=group_list)).order_by("id"))

    menu_parents_parent = Menu.objects.filter(id__in=menu_childrens_t). \
        annotate(childrenss_num=Count('childrens')).filter(childrenss_num=0)

    menu_parents = Menu.objects.filter(
        childrens__in=menu_childrens_t).order_by("id").distinct()

    # list_menu = []
    menu_json = []
    menus_only_childrens = []

    for i in menu_parents:
        # childrens = []
        childrens_json = []

        for j in i.childrens.all():
            if j.id in menu_childrens_t:
                # childrens.append(j)
                childrens_json.append(
                    MenuItem(j.id, j.name, j.url, j.icon).serialize())
                menus_only_childrens.append(j.id)
                menus_only_childrens.append(i.id)
        # list_menu.append({'menu': i, 'childrens': childrens})
        menu_json.append({'menu': MenuItem(
            i.id, i.name, i.url, i.icon).serialize(), 'childrens': childrens_json})

    menu_parents_final = menu_parents_parent.exclude(
        id__in=menus_only_childrens)

    for i in menu_parents_final:
        menu_json.append(
            {'menu': MenuItem(i.id, i.name, i.url, i.icon).serialize(), 'childrens': []})

    return menu_json


class Validate(TemplateView):
    template_name = "validate.html"

    def get_context_data(self, **kwargs):
        # update_project_session(self.request)
        return dict(
            super(Validate, self).get_context_data(**kwargs))


def index(request):
    template = loader.get_template('login.html')
    return HttpResponse(template.render({}, request))


class Dashboard(TemplateView):
    template_name = "dashboard.html"

    def get_context_data(self, **kwargs):
        # update_project_session(self.request)
        return dict(
            super(Dashboard, self).get_context_data(**kwargs))
    

    


def login_view(request):
    if request.method == "POST":

        username = request.POST['username']
        password = request.POST['password']

        user = authenticate(request, username=username, password=password)

        if user is not None:

            if not user.is_active:
                messages.warning(request, "Cuenta suspendida, contacte con el administrador")
                return redirect(reverse('index:index'))

            login(request, user)

            request.session['user_full_name'] = user.first_name or user.username

            messages.success(request, "Bienvenido: " + request.session['user_full_name'])

            # Aquí ya puedes cargar entidad, ris, etc.
            u = user

            if u.entidad:
                entidad = u.entidad
                request.session['entidad_nombre'] = entidad.nombre.upper()
                request.session['entidad_codigo'] = entidad.codigo.upper()
                request.session['entidad_id'] = entidad.id
            else:
                if u.ris:
                    request.session['entidad_nombre'] = "RIS - " + u.get_ris_display()
                else:
                    request.session['entidad_nombre'] = "OFICINA DE GESTIÓN DE TECNOLOGIA DE LA INFORMACIÓN - DIRIS LIMA CENTRO"
                    request.session['entidad_id'] = 0

            request.session["menu"] = get_menu(request.user)
            request.session["menu_manager"] = 'active'
            request.session["menu_patient"] = ''
            request.session['menu_parent'] = 2
            request.session["project"] = 0

            if u.groups.exists():
                request.session["tipo_usuario"] = u.groups.first().name

            return redirect(reverse('index:dashboard'))

        else:
            messages.warning(request, "Datos de acceso incorrectos")
            return redirect(reverse('index:index'))

    else:
        messages.warning(request, "Operación no soportada")
        return redirect(reverse('index:index'))


def logout_view(request):
    if request.user.is_authenticated:
        request.session['menu_children'] = 0
        request.session['menu_parent'] = 0
        logout(request)
    return redirect(reverse('index:index'))






def get_type_admin(request):
    if len(request.user.groups.filter(name="Administrador UGIPRESS")) > 0:
        return "UGIPRESS"
    if len(request.user.groups.filter(name="Administrador IPRESS")) > 0:
        return "IPRESS"
    if len(request.user.groups.filter(name="Administrador RIS")) > 0:
        return "RIS"

    return "NN"

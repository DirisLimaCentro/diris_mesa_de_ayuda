from django.contrib.auth import views as auth_views
from django.contrib.auth.decorators import login_required
from django.urls import path, reverse_lazy

from apps.index import view
from apps.index.recovery_password import PasswordResetViewCustomized
from apps.index.view import index,    login_view, logout_view, Dashboard, Validate 

app_name = 'index'

urlpatterns = [
 
    path('', index, name='index'),
    path('login', login_view, name='login'),
    path('logout', login_required(logout_view), name='logout'),
    path('dashboard', login_required(Dashboard.as_view()), name='dashboard'),
    path('validate', login_required(Validate.as_view()), name='validate'),


    path('password/recovery/', PasswordResetViewCustomized.as_view(
        template_name='auth/password_reset_form.html',
        html_email_template_name='auth/password_reset_email.html',
    ), name='password_reset', ),

    path(
        'password/recovery/done/',
        auth_views.PasswordResetDoneView.as_view(
            template_name='auth/password_reset_done.html',
        ),
        name='password_reset_done',
    ),

    path('password/recovery/<uidb64>/<token>/',
         auth_views.PasswordResetConfirmView.as_view(
             success_url=reverse_lazy('index:login'), post_reset_login=True,
             template_name='auth/password_reset_confirm.html',
             post_reset_login_backend=(
                 'django.contrib.auth.backends.AllowAllUsersModelBackend'
             ),
         ),
         name='password_reset_confirm',
         ),

]

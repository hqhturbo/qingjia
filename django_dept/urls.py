"""django_dept URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.contrib import admin
from django.urls import path

from student import views
urlpatterns = [
    path('admin/', admin.site.urls),
    url(r'^$',views.Login.as_view()),
    path('login/',views.Login.as_view(),name='login'),
    path('empall/',views.Empall.as_view(),name='empall'),
    path('select_all/',views.select_all,name='select_all'),
    path('delall/',views.delall,name='delall'),
    path('add/',views.Add.as_view(),name='add'),
    path('ajaxadd/',views.ajaxadd,name='ajaxadd'),
    path('update/',views.update.as_view(),name='update'),
    path('update1/',views.update1.as_view(),name='update1'),
    path('deptall/',views.deptall.as_view(),name='deptall'),
    path('select_dept_all/',views.select_dept_all,name='select_dept_all'),
    path('dept_update/',views.dept_update.as_view(),name='dept_update'),
    path('dept_update1/',views.dept_update1.as_view(),name='dept_update1'),
]


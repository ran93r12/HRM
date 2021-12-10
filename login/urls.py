from django.urls import path, include
from . import views

urlpatterns=[
    path('', views.page, name='page'),
    path('page', views.index, name='index'),
    path('landlord', views.landlord_index, name='landlord_index'),
    path('login', views.student_login, name='student_login'),
    path('signup',views.student_signup,name='student_signup'),
    path('moderator_signup',views.moderator_signup,name='moderator_signup'),
    path('moderator_login', views.moderator_login, name='moderator_login'),
    path('moderator', views.moderator_index, name='moderator_index'),
]
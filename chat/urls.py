from django.urls import path, include
from . import views

urlpatterns=[ 
    path('query', views.query, name='query'),
    path('ans/<int:id>', views.ans, name='ans'),
    path('chats', views.chats, name='chats'),
   ]
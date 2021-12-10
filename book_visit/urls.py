from django.urls import path, include
from . import views

urlpatterns=[
    path('book_visit/<int:id>', views.book_visit, name='book_visit'),
    path('adverts', views.adverts, name='adverts'),
    path('bookings', views.bookings, name='bookings'),
    ]
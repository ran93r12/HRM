from django.urls import path, include
from . import views

urlpatterns=[ 
    path('lists', views.listings, name='listings'),
    path('listings/new_ad', views.new_ad, name='new_ad'),
    path('listings/<int:id>', views.delete, name='delete'),
    path('listing/<int:id>', views.update_listing, name='update_listing'),
    path('listing/listings/update/<int:id>', views.update, name='update'),
   ]
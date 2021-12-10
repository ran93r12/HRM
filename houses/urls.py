from django.urls import path, include
from . import views

urlpatterns=[ 
    path('new', views.new, name='new'),
    path('new_add', views.new_add, name='new_add'),
    path('individual_advert/<int:id>', views.individual_advert, name='individual_advert'),
    path('advert/individual_advert/<int:id>', views.individual_advert, name='individual_advert'),
    path('approve/<int:id>', views.approve, name='approve_advert'),
    path('reject/<int:id>', views.reject, name='reject_advert'),
    path('reviews', views.reviews, name='review_advert'),
    path('ads', views.adverts, name='ads'),
    path('filter', views.adverts_filter, name='filter'),
    path('Search', views.Search, name='search'),
    path('print', views.GeneratePdf.as_view(), name='print'),
    path('report', views.report, name='report'),
   ]
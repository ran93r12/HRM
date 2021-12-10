from django.shortcuts import render, redirect
from .models import Book
from adverts.models import Advert
from login.models import Student
from django.contrib import messages
import datetime
from django.http import HttpResponse
# Create your views here.
def adverts(request):
    data=Advert.objects.filter(active=True)
    print(data)
    print("ajkhajhf")
    return render(request,"adverts.html",{"adverts":data.reverse()})

def book_visit(request, id):
    if request.session.get('email',None) and request.session.get('type', None)=='student':
        advert=Advert.objects.get(id=id)
        std=request.session['email']
        time=datetime.datetime.now()

        booking=Book(advert=advert, email=std, date=time)
        booking.save()
        messages.info(request,"Booking was succesfull.")
        return HttpResponse("You have booked the room visit successfully")
    else:
        return render(request,'login/index.html',{})

def bookings(request):
    if request.session.get('email',None) and request.session.get('type', None)=='landlord':
        bookings=Book.objects.all()
        return render(request,'visits_bookings.html',{'data':bookings})
    else:
        return render(request,'login/landlord_login/index.html',{})


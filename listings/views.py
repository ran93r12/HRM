from django.shortcuts import render, redirect
from adverts.models import Advert
from django.contrib import messages
from login.models import Landlord

# Create your views here.
def listings(request):
    if request.session.get("email",None) and request.session.get("type",None)=='landlord':
        adverts=Advert.objects.all()
        return render(request, "landlordlisting.html", {'adverts':adverts})

def new_ad(request):
    if request.session.get("email",None) and request.session.get("type",None)=='landlord':
        return render(request,'addhouse.html',{})
    else:
        return render(request,'login/index.html',{})

def update(request, id):
    if not request.session.get('email',None):
      return redirect('landlord_index')
    if request.session.get('email',None) and request.session.get('type',None)=='student':
        return redirect('index')
    if request.method=="GET":
        return render(request,"addhouse.html",{})
    else:
            rent=request.POST['rent']
            area=request.POST['area']
            bond_year=request.POST['year']
            bond_amount=request.POST['amount']
            other_charges=request.POST['charges']
            address=request.POST['address']
            image=request.FILES.get('image',None)
            description=request.POST['desc']
            error=[]
            if(len(rent)<1):
                error.append(1)
                messages.warning(request,"Rent amount must be specified.")
            if(len(area)<1):
                error.append(1)
                messages.warning(request,"Area must be specified.")
            if(len(bond_year)<0):
                error.append(1)
                messages.warning(request,"Year amount must be specified.")
            if(len(bond_amount)<1):
                error.append(1)
                messages.warning(request,"Bond amount must be specified.")
            if(len(other_charges)<1):
                error.append(1)
                messages.warning(request,"Charges amount must be specified.")
            if(len(address)<3):
                error.append(1)
                messages.warning(request,"Address must be specified.")
            if(len(description)<3):
                error.append(1)
                messages.warning(request,"Description must be specified.")
            if(not len(error)):
                advert=Advert.objects.get(id=id)
                manager=request.session['email']
                manager=Landlord.objects.get(email=manager)
                advert.image=image
                advert.manager=manager
                advert.rent=rent
                advert.area=area
                advert.bond_year=bond_year
                advert.bond_amount=bond_amount
                advert.other_charges=other_charges
                advert.address=address
                advert.description=description
                advert.save()
                messages.info(request,"House Details Was Updated Successfully")
                adverts=Advert.objects.all()
                return render(request, "landlordlisting.html", {'adverts':adverts})
            else:
                return redirect('landlord_index')
    

def update_listing(request, id):
    if request.session.get("email",None) and request.session.get("type",None)=='landlord':
        data=Advert.objects.get(id=id)
        return render(request, "update_add/new_addhouse.html", {'data':data})
    else:
        return render(request, "login/index.html", {})

def delete(request, id):
    if request.session.get("email",None) and request.session.get("type",None)=='landlord':
        data=Advert.objects.get(id=id)
        data.delete()
        messages.info(request,"Advert deleted successfully!")
        adverts=Advert.objects.all()
        return render(request, "landlordlisting.html", {'adverts':adverts})

    else:
        return render(request, "login/index.html", {})
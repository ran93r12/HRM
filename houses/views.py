from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Advert
from login.models import Landlord
from chat.models import Question, Answer
from django.http import HttpResponseRedirect
from django.shortcuts import HttpResponse
from django.template.loader import get_template, render_to_string
from fpdf import FPDF, HTMLMixin
from io import BytesIO
from django.http import HttpResponse
from django.template.loader import get_template
from django.views.generic import View
from django.template.loader import get_template
import csv
import datetime
from geopy.geocoders import Nominatim
from xhtml2pdf import pisa  

# Create your views here.
def new(request):
    return render(request,"addhouse.html",{})
def adverts(request):
    data=Advert.objects.filter(active=True)
    return render(request,"adverts.html",{"adverts":data.reverse()})
def adverts_filter(request):
    data=Advert.objects.filter(active=True)
    # print([i.address for i in data])
    return render(request,"filter.html",{"adverts":data.reverse()})


def Search(request):
    location = request.GET.get('Location')
    data=Advert.objects.filter(address__contains=location)
    res = [i.address for i in data]
    print(res)
    output = []
    if res:    
        for i in res:
            locator = Nominatim(user_agent="adverts")
            location = locator.geocode(i,timeout=None)
            print(location.latitude,location.longitude)
            dic = {"latitude":location.latitude,"longitude":location.longitude}
            output.append(dic)
        print(output)
        return render(request,"result.html",{'coordinates':output})
    else:
        return HttpResponse('No Houses Available')

def reviews(request):
    if request.session.get("email",None) and request.session.get("type",None)=='moderator':
        return render(request,'login/moderator_Login/index.html',{})
    else:
        redirect("moderator_index")
def new_add(request):
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
            #image=request.FILES['image'].read()
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
                manager=request.session['email']
                manager=Landlord.objects.get(email=manager)
                advert=Advert(image=image,manager=manager, rent=rent, area=area, bond_year=bond_year, bond_amount=bond_amount, other_charges=other_charges, address=address, description=description)
                advert.save()
                messages.info(request,"New House Added Successfully")
                return redirect('new')
            else:
                return redirect('landlord_index')
def individual_advert(request, id):
    if request.session.get("email",None) and request.session.get("type",None)=='student' or request.session.get("email",None) and request.session.get("type",None)=='moderator' or request.session.get("email",None) and request.session.get("type",None)=='landlord':
        data=Advert.objects.get(id=id)
        request.session['add_id'] = id
        data2=getQueries(id).reverse()
        ans_data=getAnsw().reverse()
        return render(request,'individual_post_page.html',{"data":data, 'questions':data2, 'answers':ans_data})
    else:
        return render(request,'adverts.html',{})
    return render(request,'adverts.html',{})

def getQueries(id):
    queries=Question.objects.filter(advert_id=id)
    #print(queries)
    return queries

def getAnsw():
    ans=Answer.objects.all()
    print(len(ans))
    return ans

def approve(request, id):
    if request.session.get("email",None) and request.session.get("type",None)=='moderator':
        advert=Advert.objects.get(id=id)
        advert.active=True
        advert.save()
        adverts=Advert.objects.all()
        return redirect(request.META['HTTP_REFERER'])        
    else:
        return render(request,'login/moderator_Login/index.html',{})

def reject(request, id):
    if request.session.get("email",None) and request.session.get("type",None)=='moderator':
        advert=Advert.objects.get(id=id)
        if advert.active==True:
            advert.active=False
        else:
            advert.active=False
        advert.save()
        adverts=Advert.objects.all()
        return redirect(request.META['HTTP_REFERER'])   
    else:
        return render(request,'login/moderator_Login/index.html',{})

def render_to_pdf(template_src, context_dict={}):
     template = get_template(template_src)
     html  = template.render(context_dict)
     result = BytesIO()
 
     #This part will create the pdf.
     pdf = pisa.pisaDocument(BytesIO(html.encode("ISO-8859-1")), result)
     if not pdf.err:
         return HttpResponse(result.getvalue(), content_type='application/pdf')
     return None


class GeneratePdf(View):
     def get(self, request, *args, **kwargs):
        
        pdf = pdf = render_to_pdf('review_requests.html')
         
        return HttpResponse(pdf, content_type='application/pdf')

def report(request):
    response=HttpResponse(content_type='text/csv')
    response['Content-Disposition']='attachment; filename="Adverts_Report.csv"'

    writer=csv.writer(response)
    writer.writerow(['ID', 'Owner', 'Area', 'Address', 'Active'])
    adverts=Advert.objects.all()

    for add in adverts:
        writer.writerow([add.id, add.manager.email, add.area, add.address, add.active])

    return response

    
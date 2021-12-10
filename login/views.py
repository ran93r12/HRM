from django.shortcuts import render, redirect
from .models import Student, Landlord, Moderator
from adverts.models import Advert
from django.contrib.auth.hashers import make_password, check_password
from django.contrib import messages
from django.utils.datastructures import MultiValueDictKeyError
import sweetify


# Create your views here.
def page(request):
    return render(request,'homepage.html',{})
    
def index(request):
    return render(request,'login/index.html',{})

def landlord_index(request):
    return render(request,'login/landlord_login/index.html',{})

def moderator_index(request):
    return render(request,'login/moderator_Login/index.html',{})

def student_login(request):    
    if request.method=="POST":
        email=request.POST['email']
        password=request.POST['password']
        if not len(email):
            messages.error(request,"Email field is must not be empty")
            redirect('index')
        elif not len(password):
            messages.error(request,"Password field is empty")
            redirect('index')
        else:
            pass
        if Student.objects.filter(email=email):
            user=Student.objects.filter(email=email)[0]
            password_hash=user.password
            res=check_password(password,password_hash)
            adverts=Advert.objects.filter(active=True)
            if res==1:
                request.session['email'] = email
                request.session['type'] = 'student'
                return render(request,'adverts.html',{"adverts":adverts})
            else:
                messages.warning(request,"Email or password is incorrect")
                redirect('index')

        elif Landlord.objects.filter(email=email):
            user=Landlord.objects.filter(email=email)[0]
            password_hash=user.password
            res=check_password(password,password_hash)
            if res==1:
                request.session['email'] = email
                request.session['type'] = 'landlord'
                return render(request,'addhouse.html',{})
            else:
                messages.warning(request,"Email or password is incorrect")
                redirect('landlord_index')
        else:
            messages.warning(request,"No, Account exist for the given Email")
            redirect('index')
    else:
        redirect('index')
    return render(request,'login/index.html',{})

def student_signup(request):
    if request.method=="POST":
        email=request.POST['email']
        handler = request.POST['role']
        try:
            handler = request.POST['role']
            if (handler == "Tenant"):
                if Student.objects.filter(email=email):
                    messages.warning(request,"Account already exist, please Login to continue")
                else:
                    password=request.POST['password']
                    error=[]           
                    if(len(password)<5):
                        error.append(1)
                        messages.warning(request,"Password Field must be greater than 5 character.")
                    if(len(email)==0):
                        error.append(1)
                        messages.warning(request,"Email field can't be empty")
                    if(len(error)==0):
                        password_hash = make_password(password)
                        student=Student(email=email,password=password_hash)
                        student.save()
                        messages.success(request,"Account Created Successfully, please Login to continue")
                        redirect('index')
                    else:
                        redirect('index')
            elif (handler == "Landlord"):
                if Landlord.objects.filter(email=email):
                    messages.warning(request,"Account already exist, please Login to continue")
                else:
                    password=request.POST['password']
                    error=[]           
                    if(len(password)<5):
                        error.append(1)
                        messages.warning(request,"Password Field must be greater than 5 character.")
                    if(len(email)==0):
                        error.append(1)
                        messages.warning(request,"Email field can't be empty")
                    if(len(error)==0):
                        password_hash = make_password(password)
                        landlord=Landlord(email=email,password=password_hash)
                        landlord.save()
                        messages.success(request,"Account Created Successfully, please Login to continue")
                        redirect('index')
                    else:
                        redirect('index')
        except MultiValueDictKeyError:
            messages.warning(request,"Select either Landlord/Tenant")
            redirect('index')
    else:
        redirect('index')
    return render(request,'login/index.html',{})

def moderator_login(request):
    if request.method=="POST":
        email=request.POST['email']
        password=request.POST['password']
        if not len(email):
            messages.warning(request,"Email field is must not be empty")
            redirect('moderator_index')
        elif not len(password):
            messages.warning(request,"Password field is empty")
            redirect('moderator_index')
        else:
            pass
        if Moderator.objects.filter(email=email):
            user=Moderator.objects.filter(email=email)[0]
            password_hash=user.password
            res=check_password(password,password_hash)
            if res==1:
                request.session['email'] = email
                request.session['type'] = 'moderator'
                adverts=Advert.objects.all()
                return render(request,'review_requests.html',{'adverts':adverts})
            else:
                messages.warning(request,"Email or password is incorrect")
                redirect('moderator_index')
        else:
            messages.warning(request,"No, Account exist for the given Email")
            redirect('moderator_index')
    else:
        redirect('moderator_index')
    return render(request,'login/moderator_Login/index.html',{})
    
def moderator_signup(request):
    if request.method=="POST":
        email=request.POST['email']
        if Moderator.objects.filter(email=email):
           messages.warning(request,"Account already exist, please Login to continue")
           # sweetify.warning(self.request, "Account already exist, please Login to continue")
        else:
            password=request.POST['password']
            error=[]           
            if(len(password)<5):
                error.append(1)
                messages.warning(request,"Password Field must be greater than 5 character.")
            if(len(email)==0):
                error.append(1)
                messages.warning(request,"Email field can't be empty")
            if(len(error)==0):
                password_hash = make_password(password)
                moderator=Moderator(email=email,password=password_hash)
                moderator.save()
                messages.info(request,"Account Created Successfully, please Login to continue")
                return render(request,'login/moderator_Login/index.html',{})
            else:
                return render(request,'login/moderator_Login/index.html',{})
        
    else:
        redirect('moderator_index')
    return render(request,'login/moderator_Login/index.html',{})
    pass
def logout(request):
    pass
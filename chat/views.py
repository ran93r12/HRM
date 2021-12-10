from django.shortcuts import render,redirect
from .models import Question, Answer
from adverts.models import Advert

# Create your views here.

def query(request):
    global advert_id
    if request.session.get("email",None) and request.session.get("type",None)=='student':
        if request.method=="POST":
            query=request.POST['desc']
            advert_id=request.session['add_id']
            add=Advert.objects.get(id=advert_id)            
            query=Question(advert=add, question=query)
            query.save() 
            data=getQueries()
            ans_data=getAnsw()
            return render(request,'individual_post_page.html', {'data':add, 'questions':data, 'answers':ans_data})        

    else:
        redirect('index')

def chats(request):
    if request.session.get("email",None) and request.session.get("type",None)=='landlord':
        queries=Question.objects.all()
        return render(request,'chats.html',{'questions':queries}) 
    else:
        return render(request,'lanlord/index.html',{}) 

def ans(request, id):
    if request.session.get("email",None) and request.session.get("type",None)=='landlord':
        if request.method=="POST":
            query=Question.objects.get(id=id)
            answer=request.POST['ans']
            answ=Answer(query=query, answer=answer)
            answ.save()
            queries=Question.objects.all()
            return render(request,'chats.html',{'questions':queries}) 
        else:
            redirect('index')
    else:
        redirect('index')
        
    
def getQueries():
    queries=Question.objects.filter(advert_id=advert_id)
    #print(queries)
    return queries

def getAnsw():
    ans=Answer.objects.all()
    print(len(ans))
    return ans


    
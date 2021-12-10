from django.db import models
from adverts.models import Advert
from login.models import Student

# Create your models here.
class Book(models.Model):
    advert=models.ForeignKey(Advert, on_delete=models.CASCADE)
    email=models.CharField(max_length=50, default='')
    date=models.DateField(auto_now_add=False)
    
    def __str__(self):
        return "Book a visit"+str(self.advert)
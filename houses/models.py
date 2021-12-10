from django.db import models
from login.models import Landlord

# Create your models here.
class Advert(models.Model):
    manager=models.ForeignKey(Landlord, on_delete=models.CASCADE)
    active=models.BooleanField(default=False)
    rent=models.FloatField(default=1000.00)
    area=models.CharField(max_length=30)
    bond_year=models.CharField(max_length=10)
    bond_amount=models.FloatField(default=1000.00)
    other_charges=models.FloatField(default=0)
    address=models.CharField(max_length=100)
    description=models.CharField(max_length=300)
    image=models.ImageField(upload_to="media", height_field=None, width_field=None, max_length=None,default='0.jpeg')

    def __str__(self):
        return "Advert: "+self.area
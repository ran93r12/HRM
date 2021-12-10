from django.db import models

# Create your models here.
class Student(models.Model):
    email=models.CharField(max_length=50)
    password=models.CharField(max_length=100)

    def __str__(self):
        return "Student: "+self.email

class Landlord(models.Model):
    email=models.CharField(max_length=50)
    password=models.CharField(max_length=100)

    def __str__(self):
        return "Landlord: "+self.email

class Moderator(models.Model):
    email=models.CharField(max_length=50)
    password=models.CharField(max_length=100)

    def __str__(self):
        return "Moderator: "+self.email

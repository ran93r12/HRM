from django.db import models

from adverts.models import Advert

# Create your models here.
class Question(models.Model):
    advert=models.ForeignKey(Advert, on_delete=models.CASCADE, default=None)
    question=models.CharField(max_length=500)

    def __str__(self):
        return "Chat: "+self.question

class Answer(models.Model):
    query=models.ForeignKey(Question, on_delete=models.CASCADE, default=None)
    answer=models.CharField(max_length=500)


    def __str__(self):
        return "Chat: "+self.answer



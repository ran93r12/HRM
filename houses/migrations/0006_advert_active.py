# Generated by Django 3.2 on 2021-04-27 21:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adverts', '0005_remove_advert_active'),
    ]

    operations = [
        migrations.AddField(
            model_name='advert',
            name='active',
            field=models.BooleanField(default=False),
        ),
    ]

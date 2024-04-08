from django.db import models

# Create your models here.
class Customer(models.Model):
    name = models.CharField(max_length=100)
    age = models.IntegerField()

class Product(models.Model):
    customers = models.ManyToManyField(Customer, related_name='products')
    name = models.CharField(max_length=100)
    price = models.IntegerField()
    

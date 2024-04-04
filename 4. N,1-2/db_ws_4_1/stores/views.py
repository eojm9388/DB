from django.shortcuts import render
from .models import Store
from django.contrib.auth.decorators import login_required

# Create your views here.
def index(request):
    stores = Store.objects.all()
    
    context = {
        'stores': stores
    }
    return render(request, 'stores/index.html', context)

@login_required
def detail(request, store_pk):
    store = Store.objects.get(pk=store_pk)
    
    context = {
        'store': store,
    }
    return render(request, 'stores/detail.html', context)
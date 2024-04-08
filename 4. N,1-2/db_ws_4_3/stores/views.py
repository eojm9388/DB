from django.shortcuts import render, redirect
from .models import Store
from django.contrib.auth.decorators import login_required
from .forms import StoreForm, ProductForm

# Create your views here.
def index(request):
    stores = Store.objects.all()
    
    context = {
        'stores': stores,
    }
    return render(request, 'stores/index.html', context)

@login_required
def detail(request, store_pk):
    store = Store.objects.get(pk=store_pk)
    products = store.product_set.all()
    form = ProductForm()
    context = {
        'store' : store,
        'form': form,
        'products': products,
    }
    
    return render(request, 'stores/detail.html', context)

@login_required
def create(request):
    if request.method == 'POST':
        form = StoreForm(request.POST)
        if form.is_valid():
            form.save()
            
            return redirect('stores:index')
    else:
        form = StoreForm()
    
    context = {
        'form': form,
    }
    
    return render(request, 'stores/create.html', context)

@login_required
def create_product(request, store_pk):
    store = Store.objects.get(pk=store_pk)
    form = ProductForm(request.POST)
    if form.is_valid():
        product = form.save(commit=False)
        product.store = store
        product.user = request.user
        product.save()
        return redirect('stores:detail', store.pk) 
    
    context = {
        'store': store,
        'form': form,
    }
    
    return render(request, 'stores:detail', context)
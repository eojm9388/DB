from django.shortcuts import render, redirect
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import login as auth_login
from django.contrib.auth import logout as auth_logout
from .forms import CustomUserCreationForm
from django.contrib.auth.forms import UserCreationForm
from .models import User
from django.contrib.auth.decorators import login_required

# Create your views here.
@login_required
def index(request):
    users = User.objects.all()
    context = {
        'users': users,
    }
    
    return render(request, 'accounts/index.html', context)

def login(request): 
    if request.user.is_authenticated:
        return redirect('stores:index')
    if request.method == 'POST':
        form = AuthenticationForm(request, request.POST)
        if form.is_valid():
            auth_login(request, form.get_user())
            return redirect('stores:index')
    else:
        form = AuthenticationForm()
    context = {
        'form': form,
    }
    return render(request, 'accounts/login.html', context)


def logout(request):
    auth_logout(request)
    return redirect('stores:index')

def signup(request):
    if request.user.is_authenticated:
        return redirect('stores:index')
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            
            return redirect('stores:index') 
    else:
        form = CustomUserCreationForm()
        # form = UserCreationForm()
    context = {
        'form': form,
    }
    return render(request, 'accounts/signup.html', context)
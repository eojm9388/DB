from django.shortcuts import render, redirect
from .forms import CustomUserCreationForm
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import login as auth_login
from django.contrib.auth import logout as auth_logout
from django.contrib.auth import get_user_model
from django.contrib.auth.decorators import login_required

# Create your views here.
def signup(request):
    
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            
            return redirect('accounts:login')
    else:
        form = CustomUserCreationForm()
        
    context = {
        'form': form,
    }

    return render(request, 'accounts/signup.html', context)

def login(request):
    if request.method == 'POST':
        form = AuthenticationForm(request, request.POST)
        if form.is_valid():
            auth_login(request, form.get_user())
            
            return redirect('accounts:profile', form.get_user().username)
    else:
        form = AuthenticationForm()
    
    context = {
        'form': form,
    }
    
    return render(request, 'accounts/login.html', context)

def logout(request):
    auth_logout(request)
    return redirect('accounts:login')


def profile(request, username):
    profile_owner = get_user_model().objects.get(username=username)
    
    context = {
        'profile_owner': profile_owner,
    }
    
    return render(request, 'accounts/profile.html', context)

@login_required
def follow(request, user_pk):
    me = request.user
    you = get_user_model().objects.get(pk=user_pk)
    
    if me != you:
        if me in you.followers.all():
            you.followers.remove(me)
        else:
            you.followers.add(me)
    
    return redirect('accounts:profile', you.username)
    
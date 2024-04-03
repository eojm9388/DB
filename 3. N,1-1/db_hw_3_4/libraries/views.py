from django.shortcuts import render, redirect
from .models import Author
from .forms import BookForm

# Create your views here.
def index(request):
    authors = Author.objects.all()
    
    context = {
        'authors': authors
    }
    return render(request, 'libraries/index.html', context)


def detail(request, author_pk):
    author = Author.objects.get(pk=author_pk)
    book_form = BookForm()
    context = {
        'author': author,
        'book_form': book_form,
    }
    return render(request, 'libraries/detail.html', context)

def book_create(request, author_pk):
    author = Author.objects.get(pk=author_pk)
    book_form = BookForm(request.POST)
    
    if book_form.is_valid():
        book = book_form.save(commit=False)
        book.author = author
        book.save()
        return redirect('libraries:detail', author.pk)
    
    context = {
        'book_form': book_form
    }
    
    return render('libraries/detail.html', context)
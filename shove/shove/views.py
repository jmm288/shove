from django.shortcuts import render
from django.http import HttpResponseRedirect

def index(request):
    return render(request, 'index.html')


def redirect_login(request):
    return HttpResponseRedirect("/login")


def login(request):
    return render(request, 'login.html')
























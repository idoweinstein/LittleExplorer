from django.urls import path
from . import views

urlpatterns = [
    path('kindergartens/', views.get_kindergarten, name='kindergartens'),
    path('', views.index, name='mainPage'),
    path('signup/', views.sign_up, name='register'),
    path('login/', views.log_in, name='login'),
]
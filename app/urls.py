from django.urls import path
from . import views

urlpatterns = [
    path('kindergartens/', views.get_kindergarten, name='kindergartens')
]
from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='mainPage'),
    path('signup/', views.sign_up, name='register'),
    path('login/', views.log_in, name='login'),
    path('kindergarten/<int:kindergarten_id>', views.get_kindergarten_details, name='kindergartenPage'),
    path('search/', views.search, name='search')
]
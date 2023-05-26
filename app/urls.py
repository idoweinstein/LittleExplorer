from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='mainPage'),
    path('parent_sign_up/', views.parent_sign_up, name='register'),
    path('teacher_sign_up/', views.teacher_sign_up, name='teacher_register'),
    path('login/', views.log_in, name='login'),
    path('logout/', views.log_out, name='logout'),
    path('kindergarten/<int:kindergarten_id>', views.get_kindergarten_details, name='kindergartenPage'),
    path('search/', views.search, name='search'),
    path('comment/<int:kindergarten_id>', views.add_comment, name='comment'),
    path('add_kindergarten/', views.add_kindergarten, name='add_kindergarten'),
    path('sign_up_kid_to_kindergarten/<int:kindergarten_id>', views.sign_up_kid_to_kindergarten,
         name='sign_up_kid_to_kindergarten'),
]

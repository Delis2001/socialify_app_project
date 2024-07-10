// ignore_for_file: prefer_final_fields, non_constant_identifier_names

import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  String _userProfile_pic = "https://images.pexels.com/photos/3026283/pexels-photo-3026283.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
String get UserProfile_pic => _userProfile_pic;
String userFirst_name= 'Valetine';
String userLast_name= 'Ekwurummadu';
String get combinedText => '$userFirst_name $userLast_name'; 
String userEmail =  "emeholisaeloka@gmail.com";

void userProfilePics(String value){
  _userProfile_pic = value;
  notifyListeners();
}

void firstText(String value){
    userFirst_name = value;
notifyListeners();
}
void secondText(String value){
   userLast_name = value;
   notifyListeners();

}
void emails(String value){
   userEmail = value;
   notifyListeners();

}
}
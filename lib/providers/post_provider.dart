

// ignore_for_file: prefer_const_constructors, prefer_final_fields, non_constant_identifier_names, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostProvider extends ChangeNotifier{
String _imageURL= "https://testapi.thepivot.ng/storage/images/1719396006_667be6a6ac4de.jpg";
String get imageURL =>_imageURL;
Color PostColors= Colors.brown;
String _avatarImage = 'assets/images/rihanna.png';
String get avatarImage => _avatarImage;
String postFirstTexts= ' my day was fine, and am doing great and we are doing great';
String postSecondTexts = '.Valentine';

void postImage(String newURL){
_imageURL = newURL;
notifyListeners();
}
void postFirstText(){
  
}
void fisrtText(String value){
postFirstTexts = value;
notifyListeners();

}
void secondText(String value){
postSecondTexts = value;
notifyListeners();

}
void postAvatarImage(String newAvatarImage){
_avatarImage = newAvatarImage;
notifyListeners();
}
}
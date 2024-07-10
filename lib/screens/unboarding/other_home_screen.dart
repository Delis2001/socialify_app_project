// ignore_for_file: sort_child_properties_last, non_constant_identifier_names, unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialify_app_project/providers/post_provider.dart';
import 'package:socialify_app_project/providers/user_provider.dart';

class OtherHomeScreen extends StatefulWidget {
  const OtherHomeScreen({super.key});

  @override
  State<OtherHomeScreen> createState() => _OtherHomeScreenState();
}

class _OtherHomeScreenState extends State<OtherHomeScreen> {
  TextStyle textDesign = TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16);
  @override
  Widget build(BuildContext context) {
    // For the Post   Provider
    var postFirstText =
        Provider.of<PostProvider>(context, listen: true).postFirstTexts;
    var postSecondText =
        Provider.of<PostProvider>(context, listen: true).postSecondTexts;
    var postImage = context.watch<PostProvider>().imageURL;
    // For The AppBar CircleAvatar Image
    var avatarImage = context.watch<PostProvider>().avatarImage;
    // For The User Provider
    var UserProfile_pic = context.watch<UserProvider>().UserProfile_pic;
    var UserEmail = context.watch<UserProvider>().userEmail;
    var Userfirst_name$last_name = context.watch<UserProvider>().combinedText;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.network(
                    height: 330,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    UserProfile_pic),
                Positioned(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: Image.network(postImage).image,
                  ),
                  top: 290,
                  left: 150,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                'Valetine Lawrence',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Text('Mobile App Developer'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.facebook,
                  size: 40,color: Colors.blue,
                ),
                Icon(
                  Icons.linked_camera_sharp,
                  size: 40,color: Colors.blue
                ),
                Icon(
                  Icons.bus_alert_rounded,
                  size: 40,color: Colors.blue
                ),
                Icon(
                  Icons.business_center,
                  size: 40,color: Colors.blue
                )
              ],
            ),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                        Column(children: [
                          Text('100',style: textDesign,),
                          Text('Friend request',style: textDesign,)
                        ],),
                        Column(children: [
                           Text('1000',style: textDesign,),
                          Text('Following',style: textDesign,)
                        ],),
                        Column(children: [
                           Text('8000',style: textDesign,),
                          Text('Followers',style: textDesign,)
                        ],)
                      ],),
            ),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
              padding: const EdgeInsets.only(top: 30,),
              child: Text(
                'About',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
             Text('Gender: Male',style: textDesign,),
              Text('RelationShip: Single',style: textDesign,),
               Text('Live: Australia',style: textDesign,),
                Text('Education: Student',style: textDesign,)
           ],)
          ],
        ),
      ),
    );
  }
}

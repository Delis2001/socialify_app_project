// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_local_variable, must_be_immutable, unnecessary_null_comparison, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialify_app_project/providers/user_provider.dart';

class UserContainerWidget extends StatefulWidget {
 String? profile_pic;
   String first_name;
   String last_name;
   String email;
  UserContainerWidget({super.key,this.profile_pic, required this.first_name, required this.last_name, required this.email});

  @override
  State<UserContainerWidget> createState() => _UserContainerWidgetState();
}

class _UserContainerWidgetState extends State<UserContainerWidget> {
  @override
  Widget build(BuildContext context) {
   // My Color
   Color containerColor = Colors.black;
  TextStyle topicTextColor = TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
  TextStyle ConNaTextColor = TextStyle(color: Colors.white);
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: containerColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
      ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child:  (widget.profile_pic == null) ? Container(): Image.network(
          widget.profile_pic!,
           height: 60),
      )
          ),
             Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15,right: 5),
                child:   ('${widget.first_name}, ${widget.last_name}' == null)? Text('Anonymous'): Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                '${widget.first_name} ${widget.last_name}',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email_outlined,
                    color: Colors.green,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                    child:  (widget.email == null)? Text(''): Text(
                      textAlign: TextAlign.center,
                     widget.email,
                      style: ConNaTextColor,
                    ),
                  ),
                  SizedBox(
                    width: 105,
                    height: 30,
                    child: ElevatedButton(
                      clipBehavior: Clip.antiAlias,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(15))),
                                     onPressed: () {},
                                    child: Text(
                                    'Connect',
                                     style: ConNaTextColor,
                        )),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
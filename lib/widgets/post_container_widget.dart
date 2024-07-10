// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, unused_local_variable, must_be_immutable, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:socialify_app_project/providers/post_provider.dart';

class ContainerWidget extends StatefulWidget {
  List<dynamic> images;
  String content;
  String authorName;
  ContainerWidget(
      {super.key,
      this.images = const [],
      required this.content,
      required this.authorName});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    var postFirstText =
        Provider.of<PostProvider>(context, listen: true).postFirstTexts;
    var postSecondText =
        Provider.of<PostProvider>(context, listen: true).postSecondTexts;
    var postImage = context.watch<PostProvider>().imageURL;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 295,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: (widget.images.isEmpty)
                    ? Container()
                    : Image.network(
                        height: 130,
                        width: MediaQuery.of(context).size.width * 0.4,
                        fit: BoxFit.cover,
                        widget.images[0].toString())),
            Spacer(),
            Flexible(
              child: (widget.content == null)
                  ? Text('')
                  : Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      widget.content,
                      style: TextStyle(color: Colors.white),
                    ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 50, bottom: 10),
              child: (widget.authorName == null)
                  ? Text('Anonymous')
                  : Text(widget.authorName,
                      style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_import, non_constant_identifier_names, unused_field, collection_methods_unrelated_type

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:socialify_app_project/datas/post_data.dart';
import 'package:socialify_app_project/datas/user_data.dart';
import 'package:socialify_app_project/providers/post_provider.dart';
import 'package:socialify_app_project/providers/user_provider.dart';
import 'package:socialify_app_project/screens/unboarding/other_home_screen.dart';
import 'package:socialify_app_project/service/post_service.dart';
import 'package:socialify_app_project/service/user_service.dart';
import 'package:socialify_app_project/widgets/post_container_widget.dart';
import 'package:socialify_app_project/widgets/user_container_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Map<String, dynamic>>> _postDataFuture;
   late Future<List<Map<String, dynamic>>> _userDataFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _postDataFuture = PostServices.fetchPosts();
      _userDataFuture = UserServices.fetchPosts();
  }
  //My Widget Colors
  Color containerColor = Colors.black;
  TextStyle topicTextColor = TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
  TextStyle ConNaTextColor = TextStyle(color: Colors.white);
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
    return Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.menu),
            title: Text('Socialify'),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: Image.asset(avatarImage).image,
                ),
              ),
            ],
            bottom: PreferredSize(
                preferredSize: Size(1, 50),
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextField(
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        fillColor: Color(0xffE6E7E9),
                        filled: true,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search'),
                  ),
                )),
          ),
          // Post Datas
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "  Today's Post",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                FutureBuilder<List<Map<String, dynamic>>>(
                  future: _postDataFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: ProgressIndicatorTheme(
                              data: ProgressIndicatorThemeData(
                                  circularTrackColor: Colors.purple),
                              child: CircularProgressIndicator()));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No internet connection'),
                      );
                    } else {
                      return SizedBox(
                        height: 250,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final PostData = snapshot.data![index];
                            return GestureDetector(
                              onTap: () {
                                showDialog(context: context, builder: (context) {
                                  return Container(
                                    color: containerColor,
                                    child: Image.network(
                                    fit: BoxFit.cover,
                                      postImage),
                                  );
                                },);
                              },
                              child: ContainerWidget(
                                  content:
                                  postData[index]['content'].toString() ?? '',
                                  authorName:
                                  postData[index]['author_name'] ?? 'Anonymous',
                                  images: postData[index]['images'] ?? []),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
                // User Datas
                Text('  Explore Friends', style: topicTextColor),
               FutureBuilder<List<Map<String, dynamic>>>(
                  future: _userDataFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: ProgressIndicatorTheme(
                              data: ProgressIndicatorThemeData(
                              circularTrackColor: Colors.purple),
                              child: CircularProgressIndicator()));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No internet connection'),
                      );
                    } else {
                      return  SizedBox(
                  height:200,
                  child: ListView.builder(
                    clipBehavior: Clip.hardEdge,
                    itemCount: snapshot.data!.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                       final userData = snapshot.data![index];
                        return GestureDetector(onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OtherHomeScreen(),));
                        },
                          child: UserContainerWidget(
                            profile_pic: userData[index] ['profile_pic'] ?? [],
                            first_name: userData[index]['first_name'] ?? 'Unkown',
                            last_name: userData[index]['last_name'] ?? 'User',
                            email:  userData[index]['email'] ?? ''),
                        ); 
                    },
                  ),
                );
                   }
                  },
                ),
                
              ],
            ),
          ));
  }
}

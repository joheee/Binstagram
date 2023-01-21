import 'package:binstagram/home.dart';
import 'package:binstagram/login.dart';
import 'package:binstagram/model/comment.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  String title;
  String image;
  String description;
  String username;
  int price;
  DetailPage({super.key, required this.title, required this.image, required this.description, required this.price, required this.username});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var comments = [
    Comment(comment: 'so good', profile: 'assets/profile.jfif'),
    Comment(comment: 'kelasss mann', profile: 'assets/profile.jfif'),
    Comment(comment: 'gilasih kelass', profile: 'assets/profile.jfif'),
    Comment(comment: 'ceilaah keren bet si', profile: 'assets/profile.jfif'),
  ];

  TextEditingController commentController = TextEditingController();

 void errorDialogMessage(String title, String text){
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('ok')
            )],
        );
      });
  }

  void onPressedComment(){
    String comment = commentController.text;
    if(comment.isEmpty) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('comment must not empty!')));
    setState(() {
      comments.add(Comment(comment: comment, profile: 'assets/profile.jfif'));
      print(comments);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('binstagram'),
          bottom: const TabBar(tabs:[
            Tab(
              icon: Icon(Icons.photo),
            ),
            Tab(
              icon: Icon(Icons.comment),
            )
          ]),
          actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb),
            onPressed: () {
              Get.isDarkMode
                  ? Get.changeTheme(ThemeData.light())
                  : Get.changeTheme(ThemeData.dark());
            })
          ],
        ),
        body: TabBarView(children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(widget.image),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      )),
                    Text(widget.description,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300
                    )),
                    Text('post pricing: IDR ${widget.price}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300
                    ))
                    ],
                  )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        onPressedComment();
                      }, 
                      child: const Icon(Icons.comment)
                    ),

                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: TextField(
                        controller: commentController,
                        obscureText: true,
                        decoration: const InputDecoration(  
                          border: OutlineInputBorder(),  
                          labelText: 'comment',  
                          hintText: 'enter comment',  
                    )),
                    )
                  ],
                )
              ],
            ),
          ),Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return Row(
                        
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Image.asset(comments[index].profile,width: 40,height: 40,),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.username,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                comments[index].comment,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    },
                  )
                ),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        onPressedComment();
                      }, 
                      child: const Icon(Icons.comment)
                    ),

                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: TextField(
                        controller: commentController,
                        obscureText: true,
                        decoration: const InputDecoration(  
                          border: OutlineInputBorder(),  
                          labelText: 'comment',  
                          hintText: 'enter comment',  
                    )),
                    )
                  ],
                )
              ],
            ),
          ),
        ],)
      )
    );
  }
}
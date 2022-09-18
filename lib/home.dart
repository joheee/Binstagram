import 'package:binstagram/apptheme.dart';
import 'package:binstagram/detail.dart';
import 'package:binstagram/login.dart';
import 'package:binstagram/model/post.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var posts = [
    Post(title: 'first', image: 'assets/post1.jpg', description: 'apa yang terjadi dengan aku', price: 23000),
    Post(title: 'second', image: 'assets/post2.jpg', description: 'priknya keluar', price: 20000),
    Post(title: 'third', image: 'assets/post3.jpg', description: 'heheheheheheehe hehehe', price: 53000),
    Post(title: 'fourth', image: 'assets/post4.jpg', description: 'aaaaaaaaaaaaaaaaaa', price: 13000),
    Post(title: 'fifth', image: 'assets/post5.jpg', description: 'aaa aku takuttt', price: 13000),
  ];

  var banner = ['assets/banner1.jpg','assets/banner2.jpg','assets/banner3.jpg','assets/banner4.jpg','assets/banner5.jpg'];

  void onTapDetail(String title, String image, String description, int price){
    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(builder: (context) {
        return DetailPage(title: title, image: image, description: description, price: price,username: widget.username,);
      }), 
      (route) => true
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hola ${widget.username}!'),
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
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("navigation on ${widget.username}'s page")),
            ListTile(
              title: const Text('logout'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                  }), 
                  (route) => false
              );
            }),
          ],
        ),
      ),

      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
              CarouselSlider(
                items: banner.map((e) => Image.asset(e)).toList(), 
                options: CarouselOptions(
                  height: 100,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  reverse: true,
                ),
              ),
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () => onTapDetail(posts[index].title, posts[index].image, posts[index].description, posts[index].price),
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0,0,0,15),
                          padding: const EdgeInsets.fromLTRB(0,10,0,0),
                          child: Column(
                            children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0,0,0,10),
                                  child: Text(
                                    posts[index].title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                              ))),
                              Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Image.asset(posts[index].image)
                              )
                            ],
                          ),
                        )
                      )
                    ],
                  );
                },
              )
            )
          ])));
  }
}
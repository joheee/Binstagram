import 'package:binstagram/apptheme.dart';
import 'package:binstagram/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
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

  void onPressedLogin(){
    String username = usernameController.text;
    String password = passwordController.text;
    if(username.isEmpty || password.isEmpty) {
      errorDialogMessage('error', 'all field must be filled!');
      return;
    }
    else {
      if(username.length < 4) {
        errorDialogMessage('error', 'username must be 4 characters minimum');
        return;
      }
      if(password.length < 5) {
        errorDialogMessage('error', 'password must be 5 characters minimum');
        return;
      }
      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(builder: (context) {
         return HomePage(username:usernameController.text);
        }), 
        (route) => false
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Binstagram'),
      ),
      body: Center(
        child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
          children: [
            Image.asset('assets/instagram.png',width: 100),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(  
                  border: OutlineInputBorder(),  
                  labelText: 'username',  
                  hintText: 'enter username',  
            ))),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(  
                  border: OutlineInputBorder(),  
                  labelText: 'password',  
                  hintText: 'enter password',  
            ))),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: ElevatedButton(
              onPressed: () {
                onPressedLogin();
              }, 
              child: const Text('login')
            )),
            
          ],
      )))));
  }
}
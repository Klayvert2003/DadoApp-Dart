import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BackgroundImageWidget(child: RandomImageViewer()),
      ),
    );
  }
}

class RandomImageViewer extends StatefulWidget {
  @override
  _RandomImageViewerState createState() => _RandomImageViewerState();
}

class BackgroundImageWidget extends StatelessWidget {
  final Widget child;

  BackgroundImageWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

class _RandomImageViewerState extends State<RandomImageViewer> {
  final List<String> imageList = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png"
  ];

  void changeImage() {
    final random = Random();
    final randomIndex = random.nextInt(imageList.length);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text("O lado sorteado foi:"),
          ),
          content: Image.asset(
            imageList[randomIndex],
          ),
          backgroundColor: Colors.white54,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                onPrimary: Colors.black
              ),
              child: Text("Fechar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
            ElevatedButton(
              onPressed: changeImage,
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                onPrimary: Colors.black,
              ),
              child: Text("Lançar Dados"),
            ),
          SizedBox(height: 150),
          ],
        ),
      );
  }
}
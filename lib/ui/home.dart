import 'package:flutter/material.dart';
import 'convert.dart';
import 'services.dart';

const Color appBarColor = Colors.blueGrey;
const Color buttonColor = Colors.blue;
const Color buttonTextColor = Colors.white;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Página inicial"),
        centerTitle: true,
        backgroundColor: appBarColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Convert()),
                );
              },
              text: 'Converter Moedas',
            ),
            SizedBox(height: 24),
            CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Services()),
                );
              },
              text: 'Principais Índices',
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomButton({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(200, 60),
        primary: buttonColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: buttonTextColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
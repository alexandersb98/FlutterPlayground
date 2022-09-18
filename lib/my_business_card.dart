import 'package:flutter/material.dart';

void main() => runApp(const MyBusinessCardApp());

class MyBusinessCardApp extends StatelessWidget {

  const MyBusinessCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text("My business card")
            ),
            body: Center(
                child: BusinessCard()
            )
        )
    );
  }
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        height: 150,
        //padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            FirstRow(),
            SizedBox(height: 8.0),
            SecondRow(),
            SizedBox(height: 8.0),
            ThirdRow(),
          ],
        )
    );

    return SizedBox(
        width: 250,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            FirstRow(),
            SecondRow(),
            ThirdRow(),
          ],
        )
    );
  }
}

class FirstRow extends StatelessWidget {
  const FirstRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.account_circle,
              size: 50,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Flutter McFlutter", style: Theme.of(context).textTheme.headline5),
              Text("Experienced App Developer"),
            ],
          )
        ]
    );
  }
}

class SecondRow extends StatelessWidget {
  const SecondRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text("123 Main Street"),
        Text("(415) 555-0198"),
      ],
    );
  }
}

class ThirdRow extends StatelessWidget {
  const ThirdRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.accessibility),
          Icon(Icons.timer),
          Icon(Icons.phone_android),
          Icon(Icons.phone_iphone),
        ]
    );
  }
}

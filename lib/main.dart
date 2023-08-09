import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final widthApp = MediaQuery.of(context).size.width;
    final heightApp = MediaQuery.of(context).size.height;
    final padingTop = MediaQuery.of(context).padding.top;

    final myAppBar = AppBar(
      title: const Text("Layout Builder"),
    );

    final heigthBody = heightApp - padingTop - myAppBar.preferredSize.height;

    return Scaffold(
      appBar: myAppBar,
      body: Container(
        width: widthApp,
        height: heigthBody * 0.9,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyContainer(widthApp, heigthBody),
            MyContainer(widthApp, heigthBody),
            MyContainer(widthApp, heigthBody),
          ],
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  final double widthApp;
  final double heigthBody;

  MyContainer(this.widthApp, this.heigthBody);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: Colors.amber,
          width: widthApp * 0.25,
          height: constraints.maxHeight *
              0.5, //constraint mengambil 20 persen dari tinggi dari parent layout , walau height body diganti2
        );
      },
    );
  }
}

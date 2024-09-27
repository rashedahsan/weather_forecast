import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wether app"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Text("Sun rise"),
          )
        ],
      ),
    );
  }
}

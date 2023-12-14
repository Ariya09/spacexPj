import 'package:flutter/material.dart';

class TestRte extends StatefulWidget {
  const TestRte({super.key});

  @override
  State<TestRte> createState() => _TestRteState();
}

class _TestRteState extends State<TestRte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DDDDD'),
      ),
      body: Container(
        child: Text('data'),
      ),
    );
  }
}

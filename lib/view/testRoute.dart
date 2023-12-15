import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
        leading: IconButton(
            onPressed: () {
              Modular.to.navigate('/');
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        child: Text('data'),
      ),
    );
  }
}

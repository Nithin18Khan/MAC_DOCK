import 'package:flutter/material.dart';
import 'package:mac_dock/view_model/entry_screen.dart';

void main() {
  runApp(const MacDock());
}

class MacDock extends StatelessWidget {
  const MacDock({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: EntryScreen(),
    );
  }
}
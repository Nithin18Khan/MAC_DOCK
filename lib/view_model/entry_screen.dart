import 'package:flutter/material.dart';
import 'package:mac_dock/model/responsive_dock.dart';
import 'package:mac_dock/view/responsivenes.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Text('Main Content Area'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: responsive.scale(16)),
              child: ResponsiveDock(
                items: const [
                  Icons.person,
                  Icons.message,
                  Icons.call,
                  Icons.camera,
                  Icons.photo,
                ],
                responsive: responsive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

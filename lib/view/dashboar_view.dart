import 'package:flutter/material.dart';

class DashboarView extends StatelessWidget {
  const DashboarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
    );
  }
}

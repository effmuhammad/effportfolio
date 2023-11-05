import 'package:flutter/material.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Portfolio Page Now Under Constructions'),
            SizedBox(height: 20),
            Text(
              '🏗️',
              style: TextStyle(fontSize: 80),
            ),
          ],
        ),
      ),
    );
  }
}

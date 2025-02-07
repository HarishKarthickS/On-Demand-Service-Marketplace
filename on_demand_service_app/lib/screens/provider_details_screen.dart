import 'package:flutter/material.dart';
import '../models/provider.dart';
import 'booking_screen.dart';

class ProviderDetailsScreen extends StatelessWidget {
  final ServiceProvider provider;

  ProviderDetailsScreen({required this.provider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(provider.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              provider.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Category: ${provider.category}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Rating: ${provider.rating}★',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              provider.description,
              style: TextStyle(fontSize: 16),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navigate to the booking screen and pass the provider details
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingScreen(provider: provider),
                  ),
                );
              },
              child: Text('Book Service'),
            ),
          ],
        ),
      ),
    );
  }
}

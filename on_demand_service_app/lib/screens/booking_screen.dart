import 'package:flutter/material.dart';
import '../models/provider.dart';
import '../models/booking.dart';
import '../services/api_service.dart';

class BookingScreen extends StatefulWidget {
  final ServiceProvider provider;

  BookingScreen({required this.provider});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  String _userName = '';
  String _scheduledDate = '';

  bool _isLoading = false;

  Future<void> _submitBooking() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Booking newBooking = Booking(
        id: 0, // The backend will assign an ID.
        providerId: widget.provider.id,
        userName: _userName,
        scheduledDate: _scheduledDate,
      );

      setState(() {
        _isLoading = true;
      });

      try {
        await ApiService.bookService(newBooking);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Service booked successfully!')),
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Booking failed: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book ${widget.provider.name}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Your Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _userName = value!;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Scheduled Date (YYYY-MM-DD)'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a scheduled date';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _scheduledDate = value!;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitBooking,
                      child: Text('Confirm Booking'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

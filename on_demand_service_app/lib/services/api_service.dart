import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/provider.dart';
import '../models/booking.dart';

class ApiService {
  // Change the URL to your backend server URL if necessary.
  static const String baseUrl = 'http://localhost:3000';

  // Fetch the list of service providers
  static Future<List<ServiceProvider>> getProviders() async {
    final response = await http.get(Uri.parse('$baseUrl/providers'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => ServiceProvider.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load service providers');
    }
  }

  // Book a service by sending booking details to the backend
  static Future<Booking> bookService(Booking booking) async {
    final response = await http.post(
      Uri.parse('$baseUrl/bookings'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(booking.toJson()),
    );
    if (response.statusCode == 201) {
      return Booking.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to book service');
    }
  }
}

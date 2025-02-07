import 'package:flutter/material.dart';
import '../models/provider.dart';
import '../services/api_service.dart';
import 'provider_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<ServiceProvider>> _providersFuture;

  @override
  void initState() {
    super.initState();
    _providersFuture = ApiService.getProviders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Providers'),
      ),
      body: FutureBuilder<List<ServiceProvider>>(
        future: _providersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching providers'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No providers found'),
            );
          } else {
            List<ServiceProvider> providers = snapshot.data!;
            return ListView.builder(
              itemCount: providers.length,
              itemBuilder: (context, index) {
                final provider = providers[index];
                return ListTile(
                  title: Text(provider.name),
                  subtitle: Text('${provider.category} - ${provider.rating}★'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProviderDetailsScreen(provider: provider),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

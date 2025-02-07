class ServiceProvider {
  final int id;
  final String name;
  final String category;
  final double rating;
  final String description;

  ServiceProvider({
    required this.id,
    required this.name,
    required this.category,
    required this.rating,
    required this.description,
  });

  factory ServiceProvider.fromJson(Map<String, dynamic> json) {
    return ServiceProvider(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      rating: (json['rating'] as num).toDouble(),
      description: json['description'],
    );
  }
}

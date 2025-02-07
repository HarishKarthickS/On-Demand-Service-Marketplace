class Booking {
  final int id;
  final int providerId;
  final String userName;
  final String scheduledDate;

  Booking({
    required this.id,
    required this.providerId,
    required this.userName,
    required this.scheduledDate,
  });

  Map<String, dynamic> toJson() => {
        'providerId': providerId,
        'userName': userName,
        'scheduledDate': scheduledDate,
      };

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      providerId: json['providerId'],
      userName: json['userName'],
      scheduledDate: json['scheduledDate'],
    );
  }
}

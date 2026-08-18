class BookingModel {
  const BookingModel({
    this.id = '',
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.bookDate,
    required this.additionalDetails,
    required this.createdAt,
    this.status = 'pending',
  });

  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String bookDate;
  final String additionalDetails;
  final String createdAt;
  final String status;

  Map<String, dynamic> toJson() => {
    'id': id,
    'fullName': fullName,
    'email': email,
    'phoneNumber': phoneNumber,
    'bookDate': bookDate,
    'additionalDetails': additionalDetails,
    'createdAt': createdAt,
    'status': status,
  };

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    id: (json['id'] ?? '').toString(),
    fullName: (json['fullName'] ?? '').toString(),
    email: (json['email'] ?? '').toString(),
    phoneNumber: (json['phoneNumber'] ?? '').toString(),
    bookDate: (json['bookDate'] ?? '').toString(),
    additionalDetails: (json['additionalDetails'] ?? '').toString(),
    createdAt: (json['createdAt'] ?? '').toString(),
    status: (json['status'] ?? 'pending').toString(),
  );
}

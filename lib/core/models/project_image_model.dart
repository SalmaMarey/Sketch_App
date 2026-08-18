class ProjectImageModel {
  final String id;
  final String imageUrl;

  ProjectImageModel({required this.id, required this.imageUrl});

  factory ProjectImageModel.fromJson(Map<String, dynamic> json) {
    return ProjectImageModel(
      id: json['id'].toString(),
      imageUrl: json['imageUrl']?.toString() ?? json['url']?.toString() ?? '',
    );
  }

  factory ProjectImageModel.fromFirebase(String id, Map<String, dynamic> json) {
    return ProjectImageModel(
      id: id,
      imageUrl: (json['imageUrl'] ?? json['url'] ?? '').toString(),
    );
  }
}

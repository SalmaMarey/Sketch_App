class CategoryModel {
  final String id;
  final String name;

  CategoryModel({required this.id, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
    );
  }

  factory CategoryModel.fromFirebase(String id, dynamic value) {
    if (value is String) {
      return CategoryModel(id: id, name: value);
    }

    final data = Map<String, dynamic>.from(value as Map? ?? const {});
    return CategoryModel(
      id: id,
      name: (data['name'] ?? data['title'] ?? data['label'] ?? id).toString(),
    );
  }
}

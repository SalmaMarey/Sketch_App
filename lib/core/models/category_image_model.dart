class CategoryImageModel {
  const CategoryImageModel({
    required this.id,
    required this.projectId,
    required this.projectTitle,
    required this.imageUrl,
    required this.sortOrder,
  });

  final String id;
  final String projectId;
  final String projectTitle;
  final String imageUrl;
  final int sortOrder;

  factory CategoryImageModel.fromFirebase({
    required String projectId,
    required String projectTitle,
    required String roomId,
    required Map<String, dynamic> room,
  }) {
    return CategoryImageModel(
      id: roomId,
      projectId: projectId,
      projectTitle: projectTitle,
      imageUrl: (room['imageUrl'] ?? room['url'] ?? '').toString(),
      sortOrder: int.tryParse(room['sortOrder']?.toString() ?? '') ?? 0,
    );
  }
}

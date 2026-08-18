class ProjectModel {
  final String id;
  final String title;
  final String info;
  final String projectDate;
  final String projectId;
  final String coverImage;
  final String projectType;
  final bool isFeatured;
  final bool isPublished;

  ProjectModel({
    required this.id,
    required this.title,
    required this.info,
    required this.projectDate,
    required this.projectId,
    this.coverImage = '',
    this.projectType = '',
    this.isFeatured = false,
    this.isPublished = true,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      info: json['info']?.toString() ?? '',
      projectDate: json['project_date']?.toString() ?? '',
      projectId: json['project_id']?.toString() ?? '',
    );
  }

  factory ProjectModel.fromFirebase(String id, Map<String, dynamic> data) {
    return ProjectModel(
      id: id,
      projectId: id,
      title: (data['title'] ?? id).toString(),
      info: (data['description'] ?? data['info'] ?? '').toString(),
      projectDate: (data['createdAt'] ?? data['project_date'] ?? '').toString(),
      coverImage: (data['coverImage'] ?? '').toString(),
      projectType: (data['projectType'] ?? '').toString(),
      isFeatured: data['isFeatured'] == true,
      isPublished: data['isPublished'] != false,
    );
  }
}

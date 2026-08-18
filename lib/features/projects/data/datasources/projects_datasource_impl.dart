/// projects_datasource_impl.dart

import 'package:injectable/injectable.dart';
import 'package:sketch_app/core/models/category_model.dart';
import 'package:sketch_app/core/models/project_image_model.dart';
import 'package:sketch_app/core/models/project_model.dart';
import 'package:sketch_app/core/services/firebase_database_service.dart';
import 'package:sketch_app/features/projects/data/datasources/projects_datasource.dart';

@Injectable(as: ProjectsDatasource)
class ProjectsDatasourceImpl implements ProjectsDatasource {
  final FirebaseDatabaseService databaseService;

  ProjectsDatasourceImpl(this.databaseService);

  @override
  Future<List<ProjectModel>> getProjects() async {
    final projects = await databaseService.projects();
    return _projectsFrom(projects);
  }

  @override
  Future<List<ProjectModel>> getFeaturedProjects() async {
    final projects = await databaseService.projects();
    return _projectsFrom(projects)
        .where((project) => project.isFeatured)
        .take(2)
        .toList();
  }

  @override
  Future<List<CategoryModel>> getCategories({required String projectId}) async {
    final project = await databaseService.project(projectId);
    if (project == null) throw Exception('Project not found.');
    final allCategories = await databaseService.categories();
    final categoryIds = <String>{};
    for (final room in databaseService.sortedRooms(project)) {
      final categoryId = room.value['category']?.toString();
      if (categoryId != null && categoryId.isNotEmpty) categoryIds.add(categoryId);
    }
    return categoryIds
        .map((id) => CategoryModel.fromFirebase(id, allCategories[id] ?? id))
        .toList();
  }

  @override
  Future<List<ProjectImageModel>> getImages({
    required String projectId,
    required String categoryId,
  }) async {
    final project = await databaseService.project(projectId);
    if (project == null) throw Exception('Project not found.');
    return databaseService
        .sortedRooms(project)
        .where((room) => room.value['category']?.toString() == categoryId)
        .map((room) => ProjectImageModel.fromFirebase(room.key, room.value))
        .where((image) => image.imageUrl.isNotEmpty)
        .toList();
  }

  List<ProjectModel> _projectsFrom(Map<String, dynamic> projects) => projects.entries
      .where((entry) => entry.value is Map)
      .map(
        (entry) => ProjectModel.fromFirebase(
          entry.key,
          Map<String, dynamic>.from(entry.value as Map),
        ),
      )
      .where((project) => project.id.isNotEmpty && project.isPublished)
      .toList();
}

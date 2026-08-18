import 'package:injectable/injectable.dart';
import 'package:sketch_app/core/models/media_model.dart';
import 'package:sketch_app/core/models/category_image_model.dart';

import '../../../../core/services/firebase_database_service.dart';
import '../../../../core/models/category_model.dart';
import 'designs_data_source.dart';

@LazySingleton(as: DesignsDataSource)
class DesignsDataSourceImpl implements DesignsDataSource {
  final FirebaseDatabaseService databaseService;

  DesignsDataSourceImpl(this.databaseService);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final categories = await databaseService.categories();
    return categories.entries
        .map((entry) => CategoryModel.fromFirebase(entry.key, entry.value))
        .toList();
  }

  @override
  Future<List<CategoryImageModel>> getCategoryImages({
    required String categoryId,
  }) async {
    final projects = await databaseService.projects();
    final images = projects.entries
        .where((entry) => entry.value is Map)
        .map((entry) => MapEntry(entry.key, Map<String, dynamic>.from(entry.value as Map)))
        .where((entry) => entry.value['isPublished'] != false)
        .expand(
          (project) => databaseService
              .rooms(project.value)
              .where((room) => room.value['category']?.toString() == categoryId)
              .map(
                (room) => CategoryImageModel.fromFirebase(
                  projectId: project.key,
                  projectTitle: (project.value['title'] ?? project.key).toString(),
                  roomId: room.key,
                  room: room.value,
                ),
              ),
        )
        .where((image) => image.imageUrl.isNotEmpty)
        .toList();
    images.sort(
      (a, b) {
        final sortComparison = a.sortOrder.compareTo(b.sortOrder);
        if (sortComparison != 0) return sortComparison;
        final projectComparison = a.projectId.compareTo(b.projectId);
        return projectComparison != 0
            ? projectComparison
            : a.id.compareTo(b.id);
      },
    );
    return images;
  }

  @override
  Future<List<MediaModel>> getMedia({required String projectId}) async {
    final project = await databaseService.project(projectId);
    if (project == null) throw Exception('Project not found.');
    return databaseService
        .sortedRooms(project)
        .map(
          (room) => MediaModel(
            id: room.key,
            url: (room.value['imageUrl'] ?? '').toString(),
          ),
        )
        .where((media) => media.url.isNotEmpty)
        .toList();
  }
}

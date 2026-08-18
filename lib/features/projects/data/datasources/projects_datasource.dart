import 'package:sketch_app/core/models/category_model.dart';
import 'package:sketch_app/core/models/project_image_model.dart';
import 'package:sketch_app/core/models/project_model.dart';

abstract class ProjectsDatasource {
  Future<List<ProjectModel>> getProjects();
  Future<List<ProjectModel>> getFeaturedProjects();
  Future<List<CategoryModel>> getCategories({required String projectId});

  Future<List<ProjectImageModel>> getImages({
    required String projectId,
    required String categoryId,
  });
}

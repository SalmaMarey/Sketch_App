import 'package:injectable/injectable.dart';
import 'package:sketch_app/core/models/category_model.dart';
import 'package:sketch_app/core/models/project_image_model.dart';
import 'package:sketch_app/core/models/project_model.dart';
import 'package:sketch_app/features/projects/data/datasources/projects_datasource.dart';
import 'package:sketch_app/features/projects/data/repos/projects_repo.dart';

@Injectable(as: ProjectsRepo)
class ProjectsRepoImpl implements ProjectsRepo {
  final ProjectsDatasource datasource;

  ProjectsRepoImpl(this.datasource);

  @override
  Future<List<ProjectModel>> getProjects() {
    return datasource.getProjects();
  }

  @override
  Future<List<ProjectModel>> getFeaturedProjects() {
    return datasource.getFeaturedProjects();
  }

  @override
  Future<List<CategoryModel>> getCategories({required String projectId}) {
    return datasource.getCategories(projectId: projectId);
  }

  @override
  Future<List<ProjectImageModel>> getImages({
    required String projectId,
    required String categoryId,
  }) {
    return datasource.getImages(projectId: projectId, categoryId: categoryId);
  }
}

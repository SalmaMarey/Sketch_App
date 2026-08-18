import 'package:sketch_app/core/models/category_model.dart';
import 'package:sketch_app/core/models/project_image_model.dart';
import 'package:sketch_app/core/models/project_model.dart';

abstract class ProjectsState {}

class ProjectsInitial extends ProjectsState {}

class ProjectsLoading extends ProjectsState {}

class ProjectsSuccess extends ProjectsState {
  final List<ProjectModel> projects;

  ProjectsSuccess(this.projects);
}

class ProjectsError extends ProjectsState {
  final String message;

  ProjectsError(this.message);
}

class CategoriesLoading extends ProjectsState {}

class CategoriesSuccess extends ProjectsState {
  final List<CategoryModel> categories;

  CategoriesSuccess(this.categories);
}

class CategoriesError extends ProjectsState {
  final String message;

  CategoriesError(this.message);
}

class ImagesLoading extends ProjectsState {}

class ImagesSuccess extends ProjectsState {
  final List<ProjectImageModel> images;

  ImagesSuccess(this.images);
}

class ImagesError extends ProjectsState {
  final String message;

  ImagesError(this.message);
}

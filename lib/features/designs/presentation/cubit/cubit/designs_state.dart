import 'package:sketch_app/core/models/media_model.dart';
import 'package:sketch_app/core/models/category_image_model.dart';
import 'package:sketch_app/core/models/category_model.dart';

abstract class DesignsState {}

class DesignsInitial extends DesignsState {}

class DesignsLoading extends DesignsState {}

class DesignsSuccess extends DesignsState {
  final List<CategoryModel> categories;

  DesignsSuccess(this.categories);
}

class DesignsError extends DesignsState {
  final String message;

  DesignsError(this.message);
}

class ProjectsLoading extends DesignsState {}

class ProjectsSuccess extends DesignsState {
  final List<CategoryModel> categories;
  final List<CategoryImageModel> images;

  ProjectsSuccess({required this.categories, required this.images});
}

class ProjectsError extends DesignsState {
  final String message;

  ProjectsError(this.message);
}

class MediaLoading extends DesignsState {}

class MediaSuccess extends DesignsState {
  final List<MediaModel> media;

  MediaSuccess(this.media);
}

class MediaError extends DesignsState {
  final String message;

  MediaError(this.message);
}

import 'package:sketch_app/features/designs/datasource/models/category_model.dart';

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

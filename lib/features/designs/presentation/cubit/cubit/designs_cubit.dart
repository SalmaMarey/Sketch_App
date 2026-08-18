import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_app/core/models/category_model.dart' show CategoryModel;
import 'package:sketch_app/core/models/category_image_model.dart';
import 'package:sketch_app/features/designs/data/repo/designs_repo.dart';

import 'designs_state.dart';

@injectable
class DesignsCubit extends Cubit<DesignsState> {
  final DesignsRepo repo;

  DesignsCubit(this.repo) : super(DesignsInitial());
  List<CategoryModel> categories = [];
  List<CategoryImageModel> _images = [];
  String? _selectedCategoryId;
  Future<void> getCategories() async {
    emit(DesignsLoading());

    try {
      categories = await repo.getCategories();
      if (categories.isEmpty) {
        emit(ProjectsSuccess(categories: [], images: []));
        return;
      }

      _selectedCategoryId = categories.first.id;
      _images = await repo.getCategoryImages(categoryId: _selectedCategoryId!);
      emit(ProjectsSuccess(categories: categories, images: _images));
    } catch (e) {
      emit(DesignsError(e.toString()));
    }
  }

  Future<void> getProjects({required String categoryId}) async {
    emit(ProjectsLoading());

    try {
      _selectedCategoryId = categoryId;
      _images = await repo.getCategoryImages(categoryId: categoryId);
      emit(ProjectsSuccess(categories: categories, images: _images));
    } catch (e) {
      emit(ProjectsError(e.toString()));
    }
  }

  Future<void> getMedia({required String projectId}) async {
    emit(MediaLoading());

    try {
      final media = await repo.getMedia(projectId: projectId);

      emit(MediaSuccess(media));
    } catch (e) {
      emit(MediaError(e.toString()));
    }
  }

  Future<void> restoreProjects() async {
    final categoryId = _selectedCategoryId;
    if (categoryId == null) {
      await getCategories();
      return;
    }
    emit(ProjectsSuccess(categories: categories, images: _images));
  }
}

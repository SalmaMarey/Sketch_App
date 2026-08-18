import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_app/features/projects/data/repos/projects_repo.dart';
import 'package:sketch_app/core/models/project_model.dart';
import 'projects_state.dart';

@injectable
class ProjectsCubit extends Cubit<ProjectsState> {
  final ProjectsRepo repo;

  ProjectsCubit(this.repo) : super(ProjectsInitial());

  List<ProjectModel> _projects = [];

  Future<void> getProjects() async {
    emit(ProjectsLoading());

    try {
      _projects = await repo.getProjects();
      emit(ProjectsSuccess(_projects));
    } catch (e) {
      emit(ProjectsError(e.toString()));
    }
  }

  Future<void> getFeaturedProjects() async {
    emit(ProjectsLoading());
    try {
      _projects = await repo.getFeaturedProjects();
      emit(ProjectsSuccess(_projects));
    } catch (e) {
      emit(ProjectsError(e.toString()));
    }
  }

  Future<void> restoreProjects() async {
    if (_projects.isNotEmpty) {
      emit(ProjectsSuccess(_projects));
      return;
    }
    await getProjects();
  }

  List categories = [];

  Future<void> getCategories({required String projectId}) async {
    emit(CategoriesLoading());

    try {
      final result = await repo.getCategories(projectId: projectId);

      categories = result;

      emit(CategoriesSuccess(result));

      if (result.isNotEmpty) {
        getImages(projectId: projectId, categoryId: result.first.id);
      }
    } catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }

  Future<void> getImages({
    required String projectId,
    required String categoryId,
  }) async {
    emit(ImagesLoading());

    try {
      final result = await repo.getImages(
        projectId: projectId,
        categoryId: categoryId,
      );

      emit(ImagesSuccess(result));
    } catch (e) {
      emit(ImagesError(e.toString()));
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sketch_app/features/designs/datasource/repo/designs_repo.dart';

import 'designs_state.dart';

@injectable
class DesignsCubit extends Cubit<DesignsState> {
  final DesignsRepo repo;

  DesignsCubit(this.repo) : super(DesignsInitial());

  Future<void> getCategories() async {
    emit(DesignsLoading());

    try {
      final categories = await repo.getCategories();

      emit(DesignsSuccess(categories));
    } catch (e) {
      emit(DesignsError(e.toString()));
    }
  }
}

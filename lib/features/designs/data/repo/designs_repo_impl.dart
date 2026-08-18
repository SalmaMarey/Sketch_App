import 'package:injectable/injectable.dart';
import 'package:sketch_app/core/models/media_model.dart';
import 'package:sketch_app/core/models/category_image_model.dart';
import 'package:sketch_app/features/designs/data/datasources/designs_data_source.dart';

import '../../../../core/models/category_model.dart';
import 'designs_repo.dart';

@LazySingleton(as: DesignsRepo)
class DesignsRepoImpl implements DesignsRepo {
  final DesignsDataSource dataSource;

  DesignsRepoImpl(this.dataSource);

  @override
  Future<List<CategoryModel>> getCategories() {
    return dataSource.getCategories();
  }

  @override
  Future<List<CategoryImageModel>> getCategoryImages({
    required String categoryId,
  }) {
    return dataSource.getCategoryImages(categoryId: categoryId);
  }

  @override
  Future<List<MediaModel>> getMedia({required String projectId}) {
    return dataSource.getMedia(projectId: projectId);
  }
}

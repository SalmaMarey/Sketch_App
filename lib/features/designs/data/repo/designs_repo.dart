import 'package:sketch_app/core/models/media_model.dart';
import 'package:sketch_app/core/models/category_image_model.dart';

import '../../../../core/models/category_model.dart';

abstract class DesignsRepo {
  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryImageModel>> getCategoryImages({
    required String categoryId,
  });
  Future<List<MediaModel>> getMedia({required String projectId});
}

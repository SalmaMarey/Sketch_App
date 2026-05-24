import '../models/category_model.dart';

abstract class DesignsDataSource {
  Future<List<CategoryModel>> getCategories();
}

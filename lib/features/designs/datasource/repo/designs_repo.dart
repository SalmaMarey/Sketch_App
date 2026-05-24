import '../models/category_model.dart';

abstract class DesignsRepo {
  Future<List<CategoryModel>> getCategories();
}

import 'package:injectable/injectable.dart';

import '../../../../core/services/api_service.dart';
import '../models/category_model.dart';
import 'designs_data_source.dart';

@LazySingleton(as: DesignsDataSource)
class DesignsDataSourceImpl implements DesignsDataSource {
  final ApiService apiService;

  DesignsDataSourceImpl(this.apiService);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await apiService.get(
      endPoint: 'categories.php',
      queryParameters: {'request': 'get_categories'},
    );

    final data = response['data'] as List;

    return data.map((e) => CategoryModel.fromJson(e)).toList();
  }
}

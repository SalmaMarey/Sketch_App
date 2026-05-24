import 'package:injectable/injectable.dart';
import 'package:sketch_app/features/designs/datasource/data/designs_data_source.dart';

import '../models/category_model.dart';
import 'designs_repo.dart';

@LazySingleton(as: DesignsRepo)
class DesignsRepoImpl implements DesignsRepo {
  final DesignsDataSource dataSource;

  DesignsRepoImpl(this.dataSource);

  @override
  Future<List<CategoryModel>> getCategories() {
    return dataSource.getCategories();
  }
}

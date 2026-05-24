// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/designs/datasource/data/designs_data_source.dart'
    as _i303;
import '../../features/designs/datasource/data/designs_data_source_impl.dart'
    as _i866;
import '../../features/designs/datasource/repo/designs_repo.dart' as _i414;
import '../../features/designs/datasource/repo/designs_repo_impl.dart' as _i163;
import '../../features/designs/presentation/cubit/cubit/designs_cubit.dart'
    as _i65;
import '../../features/onboarding/cubit/on_boarding_cubit.dart' as _i437;
import '../services/api_service.dart' as _i137;
import '../services/shared_preferences_service.dart' as _i29;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i137.ApiService>(() => _i137.ApiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i303.DesignsDataSource>(
        () => _i866.DesignsDataSourceImpl(gh<_i137.ApiService>()));
    gh.lazySingleton<_i29.SharedPreferencesService>(
        () => _i29.SharedPreferencesService(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i414.DesignsRepo>(
        () => _i163.DesignsRepoImpl(gh<_i303.DesignsDataSource>()));
    gh.factory<_i437.OnBoardingCubit>(
        () => _i437.OnBoardingCubit(gh<_i29.SharedPreferencesService>()));
    gh.factory<_i65.DesignsCubit>(
        () => _i65.DesignsCubit(gh<_i414.DesignsRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}

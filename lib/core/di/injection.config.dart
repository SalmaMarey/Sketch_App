// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/book/data/datasources/bookings_datasource.dart' as _i610;
import '../../features/book/data/datasources/bookings_datasource_impl.dart'
    as _i429;
import '../../features/book/data/repos/bookings_repo.dart' as _i922;
import '../../features/book/data/repos/bookings_repo_impl.dart' as _i748;
import '../../features/book/presentation/cubit/book_cubit.dart' as _i534;
import '../../features/designs/data/datasources/designs_data_source.dart'
    as _i136;
import '../../features/designs/data/datasources/designs_data_source_impl.dart'
    as _i865;
import '../../features/designs/data/repo/designs_repo.dart' as _i377;
import '../../features/designs/data/repo/designs_repo_impl.dart' as _i552;
import '../../features/designs/presentation/cubit/cubit/designs_cubit.dart'
    as _i65;
import '../../features/onboarding/cubit/on_boarding_cubit.dart' as _i437;
import '../../features/projects/data/datasources/projects_datasource.dart'
    as _i757;
import '../../features/projects/data/datasources/projects_datasource_impl.dart'
    as _i238;
import '../../features/projects/data/repos/projects_repo.dart' as _i234;
import '../../features/projects/data/repos/projects_repo_impl.dart' as _i296;
import '../../features/projects/presentation/cubit/cubit/projects_cubit.dart'
    as _i193;
import '../services/firebase_database_service.dart' as _i137;
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
    gh.lazySingleton<_i137.FirebaseDatabaseService>(
        _i137.FirebaseDatabaseService.new);
    gh.lazySingleton<_i29.SharedPreferencesService>(
        () => _i29.SharedPreferencesService(gh<_i460.SharedPreferences>()));
    gh.factory<_i757.ProjectsDatasource>(
        () => _i238.ProjectsDatasourceImpl(gh<_i137.FirebaseDatabaseService>()));
    gh.factory<_i610.BookingsDatasource>(
        () => _i429.BookingsDatasourceImpl(gh<_i137.FirebaseDatabaseService>()));
    gh.lazySingleton<_i136.DesignsDataSource>(
        () => _i865.DesignsDataSourceImpl(gh<_i137.FirebaseDatabaseService>()));
    gh.factory<_i437.OnBoardingCubit>(
        () => _i437.OnBoardingCubit(gh<_i29.SharedPreferencesService>()));
    gh.lazySingleton<_i377.DesignsRepo>(
        () => _i552.DesignsRepoImpl(gh<_i136.DesignsDataSource>()));
    gh.factory<_i234.ProjectsRepo>(
        () => _i296.ProjectsRepoImpl(gh<_i757.ProjectsDatasource>()));
    gh.factory<_i922.BookingsRepo>(
        () => _i748.BookingsRepoImpl(gh<_i610.BookingsDatasource>()));
    gh.factory<_i193.ProjectsCubit>(
        () => _i193.ProjectsCubit(gh<_i234.ProjectsRepo>()));
    gh.factory<_i65.DesignsCubit>(
        () => _i65.DesignsCubit(gh<_i377.DesignsRepo>()));
    gh.factory<_i534.BookCubit>(
        () => _i534.BookCubit(gh<_i922.BookingsRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}

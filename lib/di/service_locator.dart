import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:hw9_dio/data/network/api/company_api.dart';
import 'package:hw9_dio/data/network/dio_client.dart';
import 'package:hw9_dio/data/repository/company_repository.dart';
import 'package:hw9_dio/ui/home/controller.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(CompanyApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(CompanyRepository(getIt.get<CompanyApi>()));

  getIt.registerSingleton(HomeController());
}

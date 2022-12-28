import 'package:dio/dio.dart';

import '../dio_client.dart';
import 'constant/endpoints.dart';

class CompanyApi {
  final DioClient dioClient;

  CompanyApi({required this.dioClient});

  Future<Response> addCompanyApi(
      String name, String description, String industry) async {
    try {
      final Response response = await dioClient.post(
        Endpoints.companies,
        data: {
          'name': name,
          'description': description,
          'industry': industry,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getCompanyApi() async {
    try {
      final Response response = await dioClient.get(Endpoints.companies);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateCompanyApi(
      int id, String name, String description, String industry) async {
    try {
      final Response response = await dioClient.put(
        Endpoints.companies + '/$id',
        data: {
          'name': name,
          'description': description,
          'industry': industry,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteCompanyApi(int id) async {
    try {
      await dioClient.delete(Endpoints.companies + '/$id');
    } catch (e) {
      rethrow;
    }
  }
}

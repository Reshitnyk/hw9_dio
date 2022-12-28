import 'package:dio/dio.dart';
import 'package:hw9_dio/data/models/company_model.dart';
import 'package:hw9_dio/data/models/new_company_model.dart';
import 'package:hw9_dio/data/network/api/company_api.dart';
import 'package:hw9_dio/data/network/dio_exception.dart';

class CompanyRepository {
  final CompanyApi companyApi;

  CompanyRepository(this.companyApi);

  Future<List<CompanyModel>> getCompanyRequested() async {
    try {
      final response = await companyApi.getCompanyApi();
      final companies = ((response.data!['data'] ?? []) as List<dynamic>)
          .map((e) => CompanyModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return companies;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<NewCompany> addNewCompanyRequested(
      String name, String description, String industry) async {
    try {
      final response =
          await companyApi.addCompanyApi(name, description, industry);
      return NewCompany.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<NewCompany> updateUserRequested(
      int id, String name, String description, String industry) async {
    try {
      final response =
          await companyApi.updateCompanyApi(id, name, description, industry);
      return NewCompany.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<void> deleteNewUserRequested(int id) async {
    try {
      await companyApi.deleteCompanyApi(id);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}

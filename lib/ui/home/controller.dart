import 'package:flutter/material.dart';
import 'package:hw9_dio/data/models/company_model.dart';
import 'package:hw9_dio/data/models/new_company_model.dart';
import 'package:hw9_dio/data/repository/company_repository.dart';
import 'package:hw9_dio/di/service_locator.dart';

class HomeController {
  // --------------- Repository -------------
  final companyRepository = getIt.get<CompanyRepository>();

  // -------------- Textfield Controller ---------------
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final industryController = TextEditingController();
  // -------------- Local Variables ---------------
  final List<NewCompany> newCompanies = [];

  // -------------- Methods ---------------

  Future<List<CompanyModel>> getCompany() async {
    final companies = await companyRepository.getCompanyRequested();
    return companies;
  }

  Future<NewCompany> addNewCompany() async {
    final newlyAddedCompany = await companyRepository.addNewCompanyRequested(
      nameController.text,
      descriptionController.text,
      industryController.text,
    );
    newCompanies.add(newlyAddedCompany);
    return newlyAddedCompany;
  }

  Future<NewCompany> updateUser(
      int id, String name, String description, String industry) async {
    final updatedCompany = await companyRepository.updateUserRequested(
      id,
      name,
      description,
      industry,
    );
    newCompanies[id] = updatedCompany;
    return updatedCompany;
  }

  Future<void> deleteNewUser(int id) async {
    await companyRepository.deleteNewUserRequested(id);
    newCompanies.removeAt(id);
  }
}

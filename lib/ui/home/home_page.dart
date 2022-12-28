import 'package:flutter/material.dart';
import 'package:hw9_dio/data/models/company_model.dart';
import 'package:hw9_dio/di/service_locator.dart';
import 'package:hw9_dio/ui/home/controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final homeController = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<CompanyModel>>(
        future: homeController.getCompany(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            final error = snapshot.error;
            return Center(
              child: Text(
                "Error: " + error.toString(),
              ),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No data'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final company = snapshot.data![index];
                return ListTile(
                  leading: Text(company.name ?? ''),
                  title: Text(company.description ?? ''),
                  subtitle: Text(company.industry ?? ''),
                  // trailing: Text(company.id.toString()),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

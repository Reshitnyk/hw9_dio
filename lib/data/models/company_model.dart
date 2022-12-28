class CompanyModel {
  int? id;
  String? name;
  String? description;
  String? industry;

  CompanyModel(int id, String name, String description, String industry);

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    industry = json['industry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['industry'] = industry;
    return data;
  }
}

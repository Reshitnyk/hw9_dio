class NewCompany {
  String? name;
  String? description;
  String? industry;
  String? createdAt;
  String? updatedAt;

  NewCompany(
      {this.name,
      this.description,
      this.industry,
      this.createdAt,
      this.updatedAt});

  NewCompany.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    industry = json['industry'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['industry'] = industry;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

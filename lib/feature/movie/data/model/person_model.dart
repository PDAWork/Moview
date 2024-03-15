base class PersonModel {
  final int id;
  final String name;
  final String photo;

  PersonModel({
    required this.id,
    required this.name,
    required this.photo,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
    );
  }
}

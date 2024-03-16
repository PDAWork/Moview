base class ItemModel {
  final int id;
  final String name;
  final String shortDescription;
  final String? urlImage;
  final num ratingKP;

  ItemModel({
    required this.id,
    required this.name,
    required this.shortDescription,
     this.urlImage,
    required this.ratingKP,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['name'],
      shortDescription: json['shortDescription'],
      urlImage: json['poster']['previewUrl'],
      ratingKP: json['rating']['kp'],
    );
  }
}

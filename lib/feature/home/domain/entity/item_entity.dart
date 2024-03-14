final class ItemEntity {
  final int id;
  final String name;
  final String shortDescription;
  final String? urlImage;
  final dynamic ratingKP;

  ItemEntity({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.ratingKP,
    this.urlImage,
  });
}

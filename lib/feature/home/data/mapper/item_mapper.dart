import 'package:movie/feature/home/data/model/item_model.dart';
import 'package:movie/feature/home/domain/entity/item_entity.dart';

extension ItemMapper on ItemModel {
  ItemEntity toEntity() {
    return ItemEntity(
      id: id,
      name: name,
      shortDescription: shortDescription,
      urlImage: urlImage,
      ratingKP: ratingKP,
    );
  }
}

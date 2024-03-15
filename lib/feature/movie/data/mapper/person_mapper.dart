import 'package:movie/feature/movie/data/model/person_model.dart';
import 'package:movie/feature/movie/domain/entity/persont_entity.dart';

extension PersonMapper on PersonModel {
  PersonEntity toEntity() {
    return PersonEntity(
      id: id,
      name: name,
      photo: photo,
    );
  }
}

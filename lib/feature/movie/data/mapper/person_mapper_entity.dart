import 'package:movie/feature/movie/data/model/person_model.dart';
import 'package:movie/feature/movie/domain/entity/persont_entity.dart';

extension PersonMapper on PersonEntity {
  PersonModel toModel() {
    return PersonModel(
      id: id,
      name: name,
      photo: photo,
    );
  }
}

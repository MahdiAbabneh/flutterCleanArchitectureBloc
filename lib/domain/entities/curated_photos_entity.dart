import 'package:equatable/equatable.dart';
import 'package:error_handler_project/domain/entities/photo_entity.dart';

class CuratedPhotosEntity extends Equatable {
  final int page;
  final int perPage;
  final List<PhotoEntity> photos;
  final String nextPage;

  const CuratedPhotosEntity({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.nextPage,
  });

  @override
  List<Object?> get props => [page, perPage, photos, nextPage];
}



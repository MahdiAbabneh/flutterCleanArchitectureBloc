import 'package:equatable/equatable.dart';
import 'package:error_handler_project/domain/entities/src_entity.dart';

class PhotoEntity extends Equatable {
  final int id;
  final int width;
  final int height;
  final String url;
  final String photographer;
  final String photographerUrl;
  final int photographerId;
  final String avgColor;
  final SrcEntity src;
  final bool liked;
  final String alt;

  const PhotoEntity({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });

  @override
  List<Object?> get props => [
    id,
    width,
    height,
    url,
    photographer,
    photographerUrl,
    photographerId,
    avgColor,
    src,
    liked,
    alt,
  ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'url': url,
      'photographer': photographer,
      'photographer_url': photographerUrl,
      'photographer_id': photographerId,
      'avg_color': avgColor,
      'src':  src.toJson(),
      'liked': liked,
      'alt_description': alt,
    };
  }


}

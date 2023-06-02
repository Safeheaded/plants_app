import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'book.g.dart';

enum BookState {
  @JsonValue('reading')
  reading,
  @JsonValue('read')
  read,
  @JsonValue('wantToRead')
  wantToRead
}

@JsonSerializable()
class GeoPoint extends Equatable {
  final double latitude;
  final double longitude;

  const GeoPoint(this.latitude, this.longitude);

  factory GeoPoint.fromJson(Map<String, dynamic> json) =>
      _$GeoPointFromJson(json);

  Map<String, dynamic> toJson() => _$GeoPointToJson(this);

  @override
  List<Object?> get props => [latitude, longitude];
}

@JsonSerializable()
class Book extends Equatable {
  final String title;
  final String author;
  final DateTime createdAt;
  final String userId;
  final int id;
  final String coverUrl;
  final BookState state;
  final GeoPoint? location;
  final String? photoUrl;

  const Book(this.title, this.author, this.createdAt, this.userId, this.id,
      this.coverUrl, this.state, this.location, this.photoUrl);

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);

  @override
  List<Object?> get props => [
        title,
        author,
        createdAt,
        userId,
        id,
        coverUrl,
        state,
        location,
        photoUrl
      ];
}

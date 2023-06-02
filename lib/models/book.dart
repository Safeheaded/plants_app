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
class Book extends Equatable {
  final String title;
  final String author;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'user_id')
  final String userId;
  final int id;
  @JsonKey(name: 'cover_url')
  final String coverUrl;
  final BookState state;
  final double? longitude;
  final double? latitude;
  @JsonKey(name: 'photo_url')
  final String? photoUrl;

  const Book(this.title, this.author, this.createdAt, this.userId, this.id,
      this.coverUrl, this.state, this.longitude, this.latitude, this.photoUrl);

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
        longitude,
        latitude,
        photoUrl
      ];
}

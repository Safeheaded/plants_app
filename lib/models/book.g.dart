// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      json['title'] as String,
      json['author'] as String,
      DateTime.parse(json['created_at'] as String),
      json['user_id'] as String,
      json['id'] as int,
      json['cover_url'] as String,
      $enumDecode(_$BookStateEnumMap, json['state']),
      (json['longitude'] as num?)?.toDouble(),
      (json['latitude'] as num?)?.toDouble(),
      json['photo_url'] as String?,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'created_at': instance.createdAt.toIso8601String(),
      'user_id': instance.userId,
      'id': instance.id,
      'cover_url': instance.coverUrl,
      'state': _$BookStateEnumMap[instance.state]!,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'photo_url': instance.photoUrl,
    };

const _$BookStateEnumMap = {
  BookState.reading: 'reading',
  BookState.read: 'read',
  BookState.wantToRead: 'wantToRead',
};

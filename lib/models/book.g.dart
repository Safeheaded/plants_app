// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoPoint _$GeoPointFromJson(Map<String, dynamic> json) => GeoPoint(
      (json['latitude'] as num).toDouble(),
      (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$GeoPointToJson(GeoPoint instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      json['title'] as String,
      json['author'] as String,
      DateTime.parse(json['createdAt'] as String),
      json['userId'] as String,
      json['id'] as int,
      json['coverUrl'] as String,
      $enumDecode(_$BookStateEnumMap, json['state']),
      json['location'] == null
          ? null
          : GeoPoint.fromJson(json['location'] as Map<String, dynamic>),
      json['photoUrl'] as String?,
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'createdAt': instance.createdAt.toIso8601String(),
      'userId': instance.userId,
      'id': instance.id,
      'coverUrl': instance.coverUrl,
      'state': _$BookStateEnumMap[instance.state]!,
      'location': instance.location,
      'photoUrl': instance.photoUrl,
    };

const _$BookStateEnumMap = {
  BookState.reading: 'reading',
  BookState.read: 'read',
  BookState.wantToRead: 'wantToRead',
};

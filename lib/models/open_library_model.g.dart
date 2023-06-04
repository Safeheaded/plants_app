// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_library_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookDoc _$BookDocFromJson(Map<String, dynamic> json) => BookDoc(
      json['title'] as String,
      json['cover_i'] as int?,
    );

Map<String, dynamic> _$BookDocToJson(BookDoc instance) => <String, dynamic>{
      'title': instance.title,
      'cover_i': instance.coverI,
    };

OpenLibraryModel _$OpenLibraryModelFromJson(Map<String, dynamic> json) =>
    OpenLibraryModel(
      json['numFound'] as int,
      json['start'] as int,
      (json['docs'] as List<dynamic>)
          .map((e) => BookDoc.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OpenLibraryModelToJson(OpenLibraryModel instance) =>
    <String, dynamic>{
      'numFound': instance.numFound,
      'start': instance.start,
      'docs': instance.docs,
    };

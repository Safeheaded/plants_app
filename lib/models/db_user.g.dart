// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DBUser _$DBUserFromJson(Map<String, dynamic> json) => DBUser(
      json['email'] as String,
      json['id'] as int,
      json['user_id'] as String,
      $enumDecode(_$LanguageEnumMap, json['language']),
    );

Map<String, dynamic> _$DBUserToJson(DBUser instance) => <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'user_id': instance.uuid,
      'language': _$LanguageEnumMap[instance.language]!,
    };

const _$LanguageEnumMap = {
  Language.en: 'en',
  Language.pl: 'pl',
};

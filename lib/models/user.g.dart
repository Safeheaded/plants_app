// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['email'] as String,
      json['id'] as int,
      json['uuid'] as String,
      $enumDecode(_$LanguageEnumMap, json['language']),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'uuid': instance.uuid,
      'language': _$LanguageEnumMap[instance.language]!,
    };

const _$LanguageEnumMap = {
  Language.en: 'en',
  Language.pl: 'pl',
};

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'db_user.g.dart';

enum Language {
  @JsonValue('en')
  en,
  @JsonValue('pl')
  pl
}

@JsonSerializable()
class DBUser extends Equatable {
  final String email;
  final int id;
  @JsonKey(name: 'user_id')
  final String uuid;
  final Language language;

  const DBUser(this.email, this.id, this.uuid, this.language);

  factory DBUser.fromJson(Map<String, dynamic> json) => _$DBUserFromJson(json);

  Map<String, dynamic> toJson() => _$DBUserToJson(this);

  @override
  List<Object?> get props => [email, id, uuid, language];
}

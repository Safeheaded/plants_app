import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

enum Language {
  @JsonValue('en')
  en,
  @JsonValue('pl')
  pl
}

@JsonSerializable()
class User extends Equatable {
  final String email;
  final int id;
  final String uuid;
  final Language language;

  const User(this.email, this.id, this.uuid, this.language);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [email, id, uuid, language];
}

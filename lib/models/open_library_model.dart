import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'open_library_model.g.dart';

class AuthorListToStringConverter
    implements JsonConverter<String, List<dynamic>> {
  const AuthorListToStringConverter();
  @override
  String fromJson(List<dynamic> json) {
    return json.first.toString();
  }

  @override
  List<String> toJson(String object) {
    return [object];
  }
}

@JsonSerializable()
class BookDoc extends Equatable {
  final String title;
  @JsonKey(name: 'cover_i')
  final int? coverI;
  @JsonKey(name: 'author_name')
  @AuthorListToStringConverter()
  final String author;

  const BookDoc(this.title, this.coverI, this.author);

  factory BookDoc.fromJson(Map<String, dynamic> json) =>
      _$BookDocFromJson(json);

  Map<String, dynamic> toJson() => _$BookDocToJson(this);

  @override
  List<Object?> get props => [title, coverI, author];
}

@JsonSerializable()
class OpenLibraryModel extends Equatable {
  final int numFound;
  final int start;
  final List<BookDoc> docs;

  const OpenLibraryModel(this.numFound, this.start, this.docs);

  factory OpenLibraryModel.fromJson(Map<String, dynamic> json) =>
      _$OpenLibraryModelFromJson(json);

  Map<String, dynamic> toJson() => _$OpenLibraryModelToJson(this);

  @override
  List<Object?> get props => [numFound, start, docs];
}

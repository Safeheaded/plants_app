import 'package:equatable/equatable.dart';

class ShallowBook extends Equatable {
  final String title;
  final String author;
  final String coverUrl;

  const ShallowBook(this.title, this.author, this.coverUrl);

  @override
  List<Object?> get props => [title, author, coverUrl];
}

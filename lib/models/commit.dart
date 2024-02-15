import 'package:history_github/models/commit_author.dart';

class Commit {
  final String message;
  final CommitAuthor author;

  Commit({
    required this.message,
    required this.author,
  });

  factory Commit.fromJson(Map<String, dynamic> json) {
    return Commit(
      message: json["message"],
      author: CommitAuthor.fromJson(json["author"]),
    );
  }
}

import 'package:history_github/models/author.dart';
import 'package:history_github/models/commit.dart';

class Item {
  final String sha;
  final Commit commit;
  final Author author;

  Item({
    required this.sha,
    required this.commit,
    required this.author,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      sha: json["sha"],
      commit: Commit.fromJson(json["commit"]),
      author: Author.fromJson(json["author"]),
    );
  }
}

import 'package:history_github/models/commit.dart';

class Item {
  final String sha;
  final Commit commit;

  Item({required this.sha, required this.commit});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      sha: json["sha"],
      commit: Commit.fromJson(json["commit"]),
    );
  }
}

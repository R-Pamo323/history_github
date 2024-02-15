class Commit {
  final String message;

  Commit({
    required this.message,
  });

  factory Commit.fromJson(Map<String, dynamic> json) {
    return Commit(
      message: json["message"],
    );
  }
}

class CommitAuthor {
  final String name;
  final DateTime date;

  CommitAuthor({
    required this.name,
    required this.date,
  });

  factory CommitAuthor.fromJson(Map<String, dynamic> json) => CommitAuthor(
        name: json["name"],
        date: DateTime.parse(json["date"]),
      );
}

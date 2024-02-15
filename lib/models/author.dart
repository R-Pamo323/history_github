class Author {
  final String login;
  final String avatarUrl;

  Author({
    required this.login,
    required this.avatarUrl,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        login: json["login"],
        avatarUrl: json["avatar_url"],
      );
}

class Item {
  final String node_id;

  Item({required this.node_id});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      node_id: json["node_id"],
    );
  }
}

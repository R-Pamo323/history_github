import 'package:flutter/material.dart';
import 'package:history_github/models/item.dart';
import 'package:history_github/widgets/commit_widget.dart';

class SuccessData extends StatelessWidget {
  final List<Item>? listdata;

  const SuccessData(this.listdata, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(), //* Trabaja como lista de IOs
      itemCount: listdata?.length ?? 0,
      itemBuilder: (context, index) {
        final item = listdata?[index];
        return CommitWiget(
          item: item,
        );
      },
    );
  }
}

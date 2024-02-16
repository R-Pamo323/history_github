import 'package:flutter/material.dart';
import 'package:history_github/helpers/my_colors.dart';
import 'package:history_github/helpers/my_styles.dart';
import 'package:history_github/models/item.dart';
import 'package:intl/intl.dart';

class CommitDetailsWidget extends StatelessWidget {
  final Item? item;
  const CommitDetailsWidget({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: MyColors.colorWhite,
      collapsedIconColor: MyColors.colorWhite,
      title: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text("${item?.commit.message ?? ''}",
            overflow: TextOverflow.ellipsis, style: MyStyles.poppinsGeneral),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          "${item?.author.avatarUrl ?? ''}",
          fit: BoxFit.fill,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          "${item?.author.login ?? ''} - ${DateFormat("yMMMd").format(item?.commit.author.date ?? DateTime.now())}",
          style: MyStyles.poppinsText,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "${item?.commit.message ?? ''}",
            style: MyStyles.poppinsGeneral,
            textAlign: TextAlign.justify,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              '${DateFormat("yMMMd").add_Hm().format(item?.commit.author.date ?? DateTime.now())}',
              style: MyStyles.poppinsDate,
            ),
          ),
        ),
      ],
    );
  }
}

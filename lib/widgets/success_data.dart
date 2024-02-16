import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:history_github/helpers/my_colors.dart';
import 'package:history_github/helpers/my_styles.dart';
import 'package:history_github/models/item.dart';
import 'package:intl/intl.dart';

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
        return FadeInLeft(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xff6989f5), Color(0xff906ef5)]),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(1.5, 2))
                ]),
            child: Stack(
              children: [
                Positioned(
                  right: -5,
                  child: Transform.rotate(
                    angle: 120,
                    child: Icon(
                      Icons.history,
                      color: Colors.white.withOpacity(.2),
                      size: 150,
                    ),
                  ),
                ),
                ExpansionTile(
                  iconColor: MyColors.colorWhite,
                  collapsedIconColor: MyColors.colorWhite,
                  title: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text("${item?.commit.message ?? ''}",
                        overflow: TextOverflow.ellipsis,
                        style: MyStyles.poppinsGeneral),
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
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

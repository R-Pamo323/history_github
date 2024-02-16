import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:history_github/helpers/my_styles.dart';
import 'package:history_github/models/item.dart';
import 'package:intl/intl.dart';

class SuccessData extends StatelessWidget {
  final List<Item>? listdata;

  const SuccessData(this.listdata, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(), //* Trabaja como lista de IOs
      itemCount: listdata?.length,
      itemBuilder: (context, index) {
        final item = listdata?[index];
        return FadeInLeft(
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            margin: EdgeInsets.symmetric(vertical: 3, horizontal: 14),
            //height: 100,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff6989f5), Color(0xff906ef5)]),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(1.5, 2))
                ]),
            child: Stack(
              children: [
                Positioned(
                  right: -5,
                  //top: 45,
                  child: Icon(
                    Icons.history,
                    color: Colors.white.withOpacity(.2),
                    size: 150,
                  ),
                ),
                ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      "${item!.author.avatarUrl}",
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text("${item.commit.message}",
                        overflow: TextOverflow.ellipsis,
                        style: MyStyles.poppinsGeneral),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      "${item.author.login}",
                      style: MyStyles.poppinsText,
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${DateFormat("yMMMd").format(item.commit.author.date)}',
                        style: MyStyles.poppinsDate,
                      ),
                      Text(
                        '${DateFormat("Hm").format(item.commit.author.date)}',
                        style: MyStyles.poppinsDate,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

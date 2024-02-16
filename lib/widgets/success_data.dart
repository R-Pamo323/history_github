import 'package:flutter/material.dart';
import 'package:history_github/models/item.dart';
import 'package:intl/intl.dart';

class SuccessData extends StatelessWidget {
  final List<Item>? listdata;

  const SuccessData(this.listdata);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //itemExtent: 80,
      itemCount: listdata?.length,
      itemBuilder: (context, index) {
        final item = listdata?[index];
        return Card(
          child: ListTile(
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1))
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("${item!.author.avatarUrl}"),
                  )),
            ),
            title: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                "${item.commit.message} ",
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text("${item.author.login}"),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${DateFormat("yMMMd").format(item.commit.author.date)}'),
                Text('${DateFormat("Hm").format(item.commit.author.date)}'),
              ],
            ),
          ),
        );
      },
    );
  }
}

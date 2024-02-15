import 'package:flutter/material.dart';
import 'package:history_github/models/item.dart';
import 'package:history_github/services/request_commits.dart';
import 'package:intl/intl.dart';

class HistoryCommit extends StatefulWidget {
  final RequestCommits _request;
  const HistoryCommit(this._request);

  @override
  _HistoryCommitState createState() => _HistoryCommitState();
}

class _HistoryCommitState extends State<HistoryCommit> {
  late final Future<List<Item>> futureItem; //* Se recibe la lista de Items

  @override
  void initState() {
    super.initState();
    futureItem = widget._request
        .getData(); //* Obtenemos los datos al iniciar la aplicación
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureItem,
        builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
          if (snapshot.hasError) {
            return Text("Error in the data");
          }
          if (snapshot.hasData) {
            return ListView.builder(
              //itemExtent: 80,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final item = snapshot.data?[index];
                return ListTile(
                  leading: Image.network("${item!.author.avatarUrl}"),
                  title: Text(
                    "${item.commit.message} ",
                  ),
                  subtitle: Text("${item.author.login}"),
                  trailing: Text(
                      '${DateFormat("yMMMd").add_Hm().format(item.commit.author.date)}'),
                );
              },
            );
          }
          return CircularProgressIndicator();
        });
  }
}

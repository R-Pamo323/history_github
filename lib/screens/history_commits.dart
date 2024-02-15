import 'package:flutter/material.dart';
import 'package:history_github/models/item.dart';
import 'package:history_github/services/request_commits.dart';

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
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final item = snapshot.data?[index];
                return ListTile(
                  title: Text(
                    "${item!.sha} ------- ${item!.commit.message}",
                  ),
                );
              },
            );
          }
          return CircularProgressIndicator();
        });
  }
}

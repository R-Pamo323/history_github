import 'package:flutter/material.dart';
import 'package:history_github/models/item.dart';
import 'package:history_github/services/request_commits.dart';
import 'package:history_github/widgets/error_data.dart';
import 'package:history_github/widgets/success_data.dart';
import 'package:intl/intl.dart';

class HistoryCommit extends StatefulWidget {
  final RequestCommits _request;
  const HistoryCommit(this._request);

  @override
  _HistoryCommitState createState() => _HistoryCommitState();
}

class _HistoryCommitState extends State<HistoryCommit> {
  late Future<List<Item>> futureItem; //* Se recibe la lista de Items

  @override
  void initState() {
    super.initState();
    futureItem = widget._request
        .getData(); //* Obtenemos los datos al iniciar la aplicación
  }

  Future refresh() async {
    setState(() {
      futureItem = widget._request
          .getData(); //* Volvemos a actualizar nuestro futureItem despues del Pull To Refresh
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History GitHub"),
      ),
      body: FutureBuilder(
          future: futureItem,
          builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
            if (snapshot.hasError) {
              return ErrorData();
            }
            if (snapshot.hasData) {
              return RefreshIndicator(
                  onRefresh: refresh, child: SuccessData(snapshot.data));
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

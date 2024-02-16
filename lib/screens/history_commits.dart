import 'package:flutter/material.dart';
import 'package:history_github/helpers/my_colors.dart';
import 'package:history_github/helpers/my_styles.dart';
import 'package:history_github/models/item.dart';
import 'package:history_github/services/request_commits.dart';
import 'package:history_github/widgets/error_data.dart';
import 'package:history_github/widgets/success_data.dart';
import 'package:lottie/lottie.dart';

class HistoryCommit extends StatefulWidget {
  final RequestCommits request;
  const HistoryCommit(this.request, {super.key});

  @override
  _HistoryCommitState createState() => _HistoryCommitState();
}

class _HistoryCommitState extends State<HistoryCommit> {
  late Future<List<Item>> futureItem;

  @override
  void initState() {
    super.initState();
    futureItem = widget.request
        .getData(); //* Obtenemos los datos al iniciar la aplicación
  }

  /// Volvemos a actualizar nuestro futureItem despues del Pull To Refresh
  Future refresh() async {
    setState(() {
      futureItem = widget.request.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Lottie.asset('assets/images/robot.json')],
        title: Text(
          "History GitHub",
          style: MyStyles.poppinsAppBar,
        ),
        elevation: 0,
        backgroundColor: MyColors.colorTransparent,
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: futureItem,
          builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
            if (snapshot.hasError) {
              return const ErrorData();
            }
            if (snapshot.hasData) {
              return RefreshIndicator(
                  onRefresh: refresh, child: SuccessData(snapshot.data));
            }
            return Center(
              child: Lottie.asset('assets/images/loading.json'),
            );
          }),
    );
  }
}

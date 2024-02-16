import 'package:flutter/material.dart';
import 'package:history_github/screens/history_commits.dart';
import 'package:history_github/services/request_commits.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final req = const RequestCommits(
      url: 'https://api.github.com/repos/R-Pamo323/history_github/commitsdd');

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("History Commits Github")),
        body: Center(
          child: HistoryCommit(req),
        ),
      ),
    );
  }
}

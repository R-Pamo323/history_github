import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:history_github/models/item.dart';
import 'package:history_github/widgets/commit_details_widget.dart';

class CommitWiget extends StatelessWidget {
  final Item? item;

  const CommitWiget({super.key, this.item});

  @override
  Widget build(BuildContext context) {
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
            CommitDetailsWidget(
              item: item,
            ),
          ],
        ),
      ),
    );
  }
}

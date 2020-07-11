import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.clr, this.child});
  final Color clr;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: clr,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

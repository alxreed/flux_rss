import 'package:flutter/material.dart';
import 'package:flux_rss/widgets/text_alex.dart';

class Chargement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new TexteAlex(
        "Chargment en cours...",
        fontStyle: FontStyle.italic,
        fontSize: 30.0,
      ),
    );
  }
}

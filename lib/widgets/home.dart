import 'package:flutter/material.dart';
import 'package:flux_rss/models/parser.dart';
import 'package:webfeed/webfeed.dart';
import 'package:flux_rss/widgets/chargement.dart';
import 'package:flux_rss/widgets/liste.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RssFeed feed;

  @override
  void initState() {
    super.initState();
    parse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: choixDuBody(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget choixDuBody() {
    if (feed == null) {
      return new Chargement();
    } else {
      Orientation orientation = MediaQuery.of(context).orientation;
      if (orientation == Orientation.portrait) {
        // Liste
        return new Liste(feed);
      } else {
        // Grille
      }
    }
  }

  Future<Null> parse() async {
    RssFeed recu = await Parser().chargerRSS();
    if (recu != null) {
      setState(() {
        feed = recu;
        print(feed.items.length);
        feed.items.forEach((feedItem) {
          RssItem item = feedItem;
          print(item.source);
          // print(item.description);
          // print(item.pubDate);
          // print(item.enclosure.url);
        });
      });
    }
  }
}

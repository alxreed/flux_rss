import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'package:flux_rss/widgets/text_alex.dart';
import 'package:flux_rss/models/date_convertisseur.dart';

class Liste extends StatefulWidget {
  RssFeed feed;

  Liste(RssFeed feed) {
    this.feed = feed;
  }

  @override
  _ListeState createState() => new _ListeState();
}

class _ListeState extends State<Liste> {
  @override
  Widget build(BuildContext context) {
    final taille = MediaQuery.of(context).size.width / 2.5;
    return new ListView.builder(
        itemCount: widget.feed.items.length,
        itemBuilder: (context, i) {
          RssItem item = widget.feed.items[i];
          return new Container(
            child: new Card(
                elevation: 10,
                child: new InkWell(
                  onTap: () {},
                  child: new Column(
                    children: <Widget>[
                      padding(),
                      new Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // new TexteAlex(item.author),
                          new TexteAlex(new DateConvertisseur().convertirDate(item.pubDate), color: Colors.red)
                        ],
                      ),
                      padding(),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Card(
                            child: new Container(
                              width: taille,
                              child: new Image.network(
                                item.enclosure.url,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          new Container(
                            width: taille,
                            child: new TexteAlex(item.title),
                          ),
                        ],
                      ),
                      padding()
                    ],
                  ),
                )),
          );
        });
  }

  Padding padding() {
    return new Padding(
      padding: EdgeInsets.only(top: 10.0),
    );
  }
}

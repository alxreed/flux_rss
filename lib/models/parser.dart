import 'package:html/parser.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart';

class Parser {
  final url = "https://www6.lequipe.fr/rss/actu_rss_Football.xml";
  // final url = "http://www.france24.com/fr/actualites/rss";

  Future chargerRSS() async {
    final reponse = await get(url);
    // print(reponse.body);
    if (reponse.statusCode == 200) {
      final feed = new RssFeed.parse(reponse.body);
      return feed;
    } else {
      print("erreur ${reponse.statusCode}");
    }
  }
}

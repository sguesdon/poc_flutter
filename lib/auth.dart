import 'package:openid_client/openid_client_io.dart';
import 'package:url_launcher/url_launcher.dart';

class Auth {

  authenticate() async {
    // keyclock url : key-clock-url : example : http://localhost:8080
    // my realm : name of your real.m
    var uri = Uri.parse('http://localhost:8081/auth/realms/poc-flutter');
    // your client id
    var clientId = 'poc-flutter-frontend';
    var scopes = List<String>.of(['openid', 'profile']);
    var port = 8081;
    var issuer = await Issuer.discover(uri);
    var client = Client(issuer, clientId);
    print(issuer.metadata);


    urlLauncher(String url) async {
      if (await canLaunch(url)) {
        await launch(url, forceWebView: true);
      } else {
        throw 'Could not launch $url';
      }
    }

    var authenticator =  Authenticator(
      client,
      scopes: scopes,
      port: port,
      urlLancher: urlLauncher,
    );

    var c = await authenticator.authorize();
    closeWebView();
    var token = await c.getTokenResponse();
    var userInformation = await c.getUserInfo();
    print(token);
    print(userInformation);
    return userInformation;

  }

}
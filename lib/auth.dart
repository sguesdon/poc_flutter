import 'package:openid_client/openid_client_browser.dart';
import 'package:url_launcher/url_launcher.dart';

class Auth {

  authenticate() async {
    var uri = Uri.parse('http://localhost:8081/auth/realms/poc-flutter');
    // your client id
    var clientId = 'poc-flutter-frontend';
    var scopes = List<String>.of(['openid', 'profile']);
    var port = 8081;
    var issuer = await Issuer.discover(uri);
    var client = Client(issuer, clientId);

    var authenticator =  Authenticator(
      client,
      scopes: scopes
    );
    authenticator.authorize();

  }

}
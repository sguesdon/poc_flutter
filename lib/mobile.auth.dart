import 'package:openid_client/openid_client_io.dart';
import 'package:url_launcher/url_launcher.dart';

import 'config.dart';

class Auth {

  static List<String> scopes = List<String>.of(['openid', 'profile', 'offline_access']);
  late Authenticator _authenticator;

  Uri _getKeycloakUri(Config config) {
    return Uri.parse('${config.keycloak.url}/realms/${config.keycloak.realm}');
  }

  _getAuthenticator(Config config) async {

    var uri = _getKeycloakUri(config);
    var client = Client(await Issuer.discover(uri), config.keycloak.client);

    urlLauncher(String url) async {
      print(url);
      if (await canLaunch(url)) {
        await launch(url, forceWebView: true);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Authenticator(
        client,
        scopes: scopes,
        port: 8081,
        urlLancher: urlLauncher
    );
  }

  init(Config config) async {
    _authenticator = await _getAuthenticator(config);
  }

  userInfo() async {
    var credentials = await _authenticator.authorize();
    closeWebView();
    return await credentials.getUserInfo();
  }

  authenticate() async {
    _authenticator.authorize();
  }
}

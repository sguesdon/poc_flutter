import 'package:openid_client/openid_client.dart';
import 'package:openid_client/openid_client_browser.dart';

import '../domain/pojo/config.dart';

class Auth {

  static List<String> scopes = List<String>.of(['openid', 'profile']);
  late Authenticator _authenticator;

  Uri _getKeycloakUri(Config config) {
    return Uri.parse('${config.keycloak.url}/realms/${config.keycloak.realm}');
  }

  _getAuthenticator(Config config) async {
    var uri = _getKeycloakUri(config);
    var client = Client(await Issuer.discover(uri), config.keycloak.client);
    return Authenticator(client, scopes: scopes);
  }

  init(Config config) async {
    _authenticator = await _getAuthenticator(config);
  }

  userInfo() async {
    var credentials = await _authenticator.credential;
    return credentials == null ? null : await credentials.getUserInfo();
  }

  authenticate() async {
    _authenticator.authorize();
  }
}

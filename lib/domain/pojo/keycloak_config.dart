import 'package:json_annotation/json_annotation.dart';
part 'keycloak_config.g.dart';

@JsonSerializable()
class KeycloakConfig {

  String realm;
  String url;
  String client;

  KeycloakConfig({
    required this.realm,
    required this.url,
    required this.client
  });

  factory KeycloakConfig.fromJson(Map<String, dynamic> json) => _$KeycloakConfigFromJson(json);
  Map<String, dynamic> toJson() => _$KeycloakConfigToJson(this);
}
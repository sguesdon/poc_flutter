// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keycloak_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KeycloakConfig _$KeycloakConfigFromJson(Map<String, dynamic> json) =>
    KeycloakConfig(
      realm: json['realm'] as String,
      url: json['url'] as String,
      client: json['client'] as String,
    );

Map<String, dynamic> _$KeycloakConfigToJson(KeycloakConfig instance) =>
    <String, dynamic>{
      'realm': instance.realm,
      'url': instance.url,
      'client': instance.client,
    };

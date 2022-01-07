import 'dart:convert';
import 'dart:core';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:json_annotation/json_annotation.dart';
import 'package:poc_flutter/domain/pojo/keycloak_config.dart';
import 'package:http/http.dart' as http;

part 'config.g.dart';

@JsonSerializable()
class Config {

  KeycloakConfig keycloak;

  Config(this.keycloak);

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigToJson(this);

  static Future<Config> forEnvironment(String? env) async {
    env = env ?? 'dev';
    final json = jsonDecode(await (kIsWeb ? _fetchWebConfig(env) : _fetchMobileConfig(env)));
    return Config.fromJson(json);
  }

  static _fetchWebConfig(String env) async {
    http.Response res = await http.get(
        Uri.parse('/assets/assets/config/$env.json'),
        headers : { "Accept" : "application/json" }
    );
    return res.body;
  }

  static _fetchMobileConfig(String env) async {
    return await rootBundle.loadString('assets/config/$env.json');
  }
}
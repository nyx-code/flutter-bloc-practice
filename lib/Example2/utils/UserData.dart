import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserData {
  final storage = new FlutterSecureStorage();
  Future<String> authenticate({
    @required email,
    @required password,
  }) async {
    // ignore: todo
    //TODO: authentication part
    if (email == 'shailesh' && password == 'shailesh') {
      await Future.delayed(Duration(seconds: 1));
      return '$email+$password';
    }
    await Future.delayed(Duration(seconds: 1));
    return null;
  }

  Future<void> deleteToken() async {
    // ignore: todo
    //TODO: delete token from storage
    await storage.delete(key: "userData");
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> addToken(String token) async {
    // ignore: todo
    //TODO: add token to storage
    await storage.write(key: "userData", value: token);
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    // ignore: todo
    //TODO: check does storage have token or not
    String value = await storage.read(key: "userData");
    await Future.delayed(Duration(seconds: 1));
    return value != null ? true : false;
  }
}

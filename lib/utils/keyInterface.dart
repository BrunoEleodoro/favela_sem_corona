import 'dart:convert';
import 'dart:math';
import 'dart:io';

import 'package:bip39/bip39.dart' as bip39;
import 'package:favelasemcorona/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';
import "package:hex/hex.dart";
//import 'package:bitcoin_flutter/bitcoin_flutter.dart';

class KeyInterface{
  static Future<String> generateKey()async {
    var rng = Random.secure();
    Credentials creds = EthPrivateKey.createRandom(rng);
    Wallet wallet = Wallet.createNew(creds, "qwerty", rng);
    var address = await creds.extractAddress();
    print("address:"+address.toString());
    var add = EthereumAddress.fromHex(address.toString());
    print(add);
    String ppk = HEX.encode(wallet.privateKey.privateKey);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(prefAddress, address.toString());
    await prefs.setString(prefPrivateKey, ppk);
    return ppk;
  }
}
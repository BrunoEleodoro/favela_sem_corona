import 'package:favelasemcorona/constants.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
class EthWrapper{
  static final moonRopsten = "0x48b0c1d90c3058ab032c44ec52d98633587ee711";
  static Future<String> checkBalanceRopsten()async{
    double retbal;
    var apiUrl = "https://ropsten.infura.io/v3/311ef590f7e5472a90edfa1316248cff";
    final client = Web3Client(apiUrl, http.Client());
    await rootBundle.loadString('assets/StandardToken.json').then((abi)async{
      await SharedPreferences.getInstance().then((prefs)async {
        String privateKey = prefs.getString(prefPrivateKey);
        Credentials credentials = EthPrivateKey.fromHex(privateKey);
        final address = await credentials.extractAddress();
        print(address);
        final contract  =  DeployedContract(ContractAbi.fromJson(abi, "StandardTOken"),EthereumAddress.fromHex("0x48b0c1d90c3058ab032c44ec52d98633587ee711"));
        var balance = contract.function('balanceOf');
        await client.call(
          contract: contract,
          function: balance ,
          params: [address],
        ).then((balance){
          print(balance);
          print(balance.first);
          BigInt vr = BigInt.from(balance.first/BigInt.from(1000000000000000));

          double bal = vr.toDouble()/1000.0;
          print("bal:"+bal.toString());
          retbal=bal;
        });
      });
    });
    await client.dispose();
    return retbal.toString();

  }
  static Future<String> transferToken(String recipient, double amount)async{
    var apiUrl = "https://ropsten.infura.io/v3/311ef590f7e5472a90edfa1316248cff";
    final client = Web3Client(apiUrl, http.Client());
    String txHash="";
    await rootBundle.loadString("assets/StandardToken.json").then((abi)async{
      await SharedPreferences.getInstance().then((prefs)async {
        String privateKey = prefs.getString(prefPrivateKey);
        Credentials credentials = EthPrivateKey.fromHex(privateKey);
        final address = await credentials.extractAddress();
        print(address);
        final contract  =  DeployedContract(ContractAbi.fromJson(abi, "StandardTOken"),EthereumAddress.fromHex(moonRopsten));
        var transfer = contract.function('transfer');
        await client.sendTransaction(
          credentials,
          Transaction.callContract(
              contract: contract,
              function: transfer,
              parameters: [EthereumAddress.fromHex(recipient),BigInt.from(amount*1000)*BigInt.from(1000000000000000)]
          ),
          chainId: 3,

        ).then((hash){
          print(BigInt.from(amount)*BigInt.from(1000000000000000000));
          print("tx hash: "+ hash);
          txHash = hash;

        });
      });
    });
    //await client.dispose();
    return txHash;
  }
}
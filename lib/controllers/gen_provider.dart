import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maga/controllers/woo_api/woocommerce_api.dart';

const String _url = 'https://www.icomroma.com/vendita/';
const String _chiaveUtente = 'ck_5b8d75d64636f8685b78eab1d453710a6426cfd7';
const String _chiaveSegreta = 'cs_a67030898709d55474dd7b70cbba4344325e5e49';

//const String _url = 'https://www.alealino.com/';
//const String _chiaveUtente = 'ck_780f4b15863a06b663e30712b1cb428a538e7b8d';
//const String _chiaveSegreta = 'cs_e1c06f43f2e5403b2293cde9fb27dcdb3c109ee6';

//chiavi WooCommerce
final wcAPI = StateProvider<WooCommerceAPI>((ref) => WooCommerceAPI(
    url: _url, consumerKey: _chiaveUtente, consumerSecret: _chiaveSegreta));

//bool Theme
final isLightMode = StateProvider<bool>((ref) => true);
//bool Login
final loginProvider = StateProvider<bool>((ref) => false);
//bool Login
final isLoading = StateProvider<bool>((ref) => false);

//ScaffoldMessage
final scaffoldMexKey = Provider((ref) => GlobalKey<ScaffoldMessengerState>());
final scaffoldMex = StateProvider<ScaffoldMessengerState?>(
    (ref) => ref.watch(scaffoldMexKey).currentState);
final snackProvider = StateNotifierProvider<SnackBarNotifier, SnackBar>((ref) {
  return SnackBarNotifier();
});

class SnackBarNotifier extends StateNotifier<SnackBar> {
  SnackBarNotifier()
      : super(const SnackBar(
          content: SizedBox(),
        ));

  mySnackBar(
    Color? bkColor,
    IconData? iconData,
    Color? iconColor,
    String text,
    Color? textColor,
  ) {
    return SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: bkColor,
        duration: const Duration(milliseconds: 1500),
        content: Row(
          children: [
            Icon(
              iconData,
              color: iconColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
                child: Text(
              text,
              style: TextStyle(color: textColor),
            ))
          ],
        ));
  }
}

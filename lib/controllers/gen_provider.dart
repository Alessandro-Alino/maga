import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maga/controllers/woo_api/woocommerce_api.dart';

const String _url = 'https://www.test.com/';
const String _chiaveUtente = '';
const String _chiaveSegreta = '';


//chiavi WooCommerce
final wcAPI = StateProvider<WooCommerceAPI>((ref) => WooCommerceAPI(
    url: _url, consumerKey: _chiaveUtente, consumerSecret: _chiaveSegreta));

//bool Theme
final isLightMode = StateProvider<bool>((ref) => true);
//bool Login
final loginProvider = StateProvider<bool>((ref) => false);
//bool Loading
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

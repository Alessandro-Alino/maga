import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maga/controllers/connectivity_check.dart';
import 'package:maga/controllers/gen_provider.dart';
import 'package:maga/screens/desk_home_page.dart';
import 'package:maga/screens/home_maga.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //MediaQuery
    final deviceScreen =
        StateProvider<double>((ref) => MediaQuery.of(context).size.width);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: ref.watch(scaffoldMexKey),
      theme: ref.watch(isLightMode)
          ? ThemeData.light(
              useMaterial3: true,
            )
          : ThemeData.dark(
              useMaterial3: true,
            ),
      home: GestureDetector(
          //Remove KeyBoard if it's open
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: ref.watch(loginProvider)
              ? ref.watch(deviceScreen) > 500.0 && Platform.isWindows
                  ? const DesktopHomePage()
                  : const HomePageMaga()
              : const LoginPage()),
    );
  }
}

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var connection = ref.watch(connectivityStatusProviders);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TextField Name Login
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nome Utente',
                    ),
                  ),
                ),
                //TextField Password Login
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                    ),
                  ),
                ),
                //Text for password recovery and Login Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Text for password recovery
                      Flexible(
                        flex: 2,
                        child: TextButton(
                            onPressed: () {
                              ref.watch(scaffoldMex)!
                                ..removeCurrentSnackBar()
                                ..showSnackBar(ref
                                    .watch(snackProvider.notifier)
                                    .mySnackBar(
                                        Colors.amber.shade900,
                                        Icons.watch_later,
                                        Colors.white,
                                        'Funzione in Arrivo!',
                                        Colors.white));
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text('Non ricordi la password?')),
                      ),
                      //Login Button
                      Flexible(
                        flex: 1,
                        child: ElevatedButton(
                            onPressed: () {
                              if (connection ==
                                  ConnectivityStatus.isDisonnected) {
                                ref.watch(scaffoldMex)!
                                  ..removeCurrentSnackBar()
                                  ..showSnackBar(ref
                                      .watch(snackProvider.notifier)
                                      .mySnackBar(
                                          Colors.red.shade900,
                                          Icons.wifi_off,
                                          Colors.white,
                                          'Controlla la Connessione',
                                          Colors.white));
                              } else {
                                ref.read(isLoading.notifier).state = true;
                                Future.delayed(const Duration(seconds: 1), () {
                                  ref.read(isLoading.notifier).state = false;
                                  ref.read(loginProvider.notifier).state = true;
                                  ref.watch(scaffoldMex)!
                                    ..removeCurrentSnackBar()
                                    ..showSnackBar(ref
                                        .watch(snackProvider.notifier)
                                        .mySnackBar(
                                            Colors.green.shade700,
                                            Icons.login,
                                            Colors.white,
                                            'Accesso eseguito',
                                            Colors.white));
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(100.0, 30.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: ref.watch(isLoading)
                                ? const SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: CircularProgressIndicator(),
                                  )
                                : const Text('Accedi')),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

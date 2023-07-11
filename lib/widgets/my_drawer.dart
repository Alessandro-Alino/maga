import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maga/controllers/categ_provider.dart';
import 'package:maga/controllers/gen_provider.dart';
import 'package:maga/controllers/prod_provider.dart';
import 'package:maga/screens/man_categ.dart';

class MyDrawer extends ConsumerWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(padding: const EdgeInsets.all(0.0), children: [
        Container(
            padding: const EdgeInsets.only(top: 20.0),
            decoration: BoxDecoration(
              color: ref.watch(isLightMode)
                  ? Colors.blueGrey.shade200
                  : const Color.fromRGBO(28, 27, 31, 1.0),
            ),
            child: Column(
              children: [
                //Icon Switch Theme Light or Dark
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, right: 8.0, left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          ref.read(isLightMode.notifier).state =
                              !ref.read(isLightMode.notifier).state;
                          Navigator.pop(context);
                        },
                        icon: ref.watch(isLightMode)
                            ? const Icon(
                                Icons.dark_mode,
                                color: Colors.white,
                              )
                            : const Icon(
                                Icons.light_mode,
                                color: Colors.yellow,
                              ),
                      )
                    ],
                  ),
                ),
                //Icon User
                const ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                ),
                //Name and Username
                const ListTile(
                  title: Text('User Profile'),
                  subtitle: Text('@username'),
                )
              ],
            )),
        const Divider(
          color: Colors.transparent,
          endIndent: 10.0,
          indent: 10.0,
        ),
        //Home
        ListTile(
          onTap: () {
            if (ref.watch(prodFutureProvider).isLoading) {
              Navigator.pop(context);
            }
            {
              ref.watch(categID) == null
                  ? null
                  : ref.read(categID.notifier).state = null;
              ref.watch(prodProvider.notifier).clearList();
              Navigator.pop(context);
            }
          },
          leading: const Icon(Icons.home),
          title: const Text('Home'),
        ),
        const Divider(
          indent: 15.0,
          endIndent: 60.0,
        ),
        //Categ Manager
        ListTile(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ManagerCateg()));
          },
          leading: const Icon(Icons.category),
          title: const Text('Gestisci Categorie'),
        ),
        const Divider(
          indent: 15.0,
          endIndent: 60.0,
        ),
        //INFO
        ListTile(
          onTap: () {
            Navigator.pop(context);
            Future.delayed(const Duration(milliseconds: 100), () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('I-COM Gestionale'),
                    content: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Tutti i diritti riservati'),
                        Text('by Alino with ❤️'),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Indietro'))
                    ],
                  );
                },
              );
            });
          },
          leading: const Icon(Icons.info),
          title: const Text('Info'),
        ),
        const Divider(
          indent: 15.0,
          endIndent: 60.0,
        ),
        //LogOut
        ListTile(
          onTap: () {
            ref.read(loginProvider.notifier).state = false;
            ref.watch(scaffoldMex)!
              ..removeCurrentSnackBar()
              ..showSnackBar(ref.watch(snackProvider.notifier).mySnackBar(
                  Colors.red.shade700,
                  Icons.login,
                  Colors.white,
                  'LogOut eseguito',
                  Colors.white));
          },
          leading: const Icon(Icons.logout),
          title: const Text('LogOut'),
        ),
        const Divider(
          indent: 15.0,
          endIndent: 60.0,
        ),
      ]),
    );
  }
}

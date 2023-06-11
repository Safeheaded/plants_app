import 'package:am_project/main.dart';
import 'package:am_project/router/root_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Screen'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await supabase.auth.signOut();
                  if (!mounted) return;
                  context.router.replaceAll([const LoginRoute()]);
                },
                child: const Text('Sign out')),
            // Container(
            //   margin: const EdgeInsets.only(top: 20),
            //   child: ElevatedButton(
            //       style: const ButtonStyle().copyWith(
            //           backgroundColor: MaterialStateProperty.all(Colors.red)),
            //       onPressed: () async {
            //         await supabase.auth.admin
            //             .deleteUser(supabase.auth.currentUser!.id);
            //         if (!mounted) return;
            //         context.router.replaceAll([const LoginRoute()]);
            //       },
            //       child: const Text('Delete account')),
            // )
          ],
        ),
      ),
    );
  }
}

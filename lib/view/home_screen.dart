import 'package:flutter/material.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/routes/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: Column(children: [
        Expanded(
            child: Center(
          child: InkWell(
              onTap: () {
                userPreferences.removeUser().then((value) {
                  Navigator.pushNamed(context, RouteName.login);
                });
              },
              child: const Text('Log out ')),
        )),
      ]),
    );
  }
}

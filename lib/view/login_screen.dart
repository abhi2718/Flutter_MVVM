import 'package:flutter/material.dart';
import '../utils/routes/routes_name.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child:InkWell(
              onTap: (){ Navigator.pushNamed(context, RouteName.home);},
              child: const Text('LogIn Screen'),
            ),
          )
        ]
      ),
    );
  }
}

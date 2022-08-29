import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/utils.dart';
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
      body: Column(children: [
        Expanded(
          child: Center(
            child: InkWell(
              onTap: () {
                //Navigator.pushNamed(context, RouteName.home);
                //Utils.toastMessage('No Internet connection available');
                //Utils.flushErrorMessage(
                // 'No Internet connection available', context);
                Utils.snackBar('No Internet connection available', context);
              },
              child: const Text('LogIn Screen'),
            ),
          ),
        )
      ]),
    );
  }
}

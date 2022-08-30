import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mvvm/utils/routes/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import '../utils/routes/routes_name.dart';
import '../res/components/round_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailFocusNode,
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(
                        context, emailFocusNode, passwordFocusNode);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.alternate_email),
                  ),
                ),
                ValueListenableBuilder(
                    valueListenable: _obsecurePassword,
                    builder: (context, value, child) {
                      return TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obsecurePassword.value,
                        obscuringCharacter: '*',
                        focusNode: passwordFocusNode,
                        onFieldSubmitted: (value) {
                          Utils.fieldFocusChange(
                              context, emailFocusNode, passwordFocusNode);
                        },
                        decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: InkWell(
                                onTap: () {
                                  _obsecurePassword.value =
                                      !_obsecurePassword.value;
                                },
                                child: _obsecurePassword.value
                                    ? const Icon(Icons.visibility_off_outlined)
                                    : const Icon(Icons.visibility_outlined))),
                      );
                    }),
                SizedBox(
                  height: height * 0.02,
                ),
                RoundButton(
                  title: 'Sign up',
                  loading: authViewModel.signUpLoading,
                  onPress: () {
                    if (_emailController.text.isEmpty) {
                      Utils.flushErrorMessage('Please enter email', context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushErrorMessage('Please enter password', context);
                    } else if (_passwordController.text.length < 6) {
                      Utils.flushErrorMessage(
                          'Password should be at least 6 characters', context);
                    } else {
                      Map data = {
                        "email":_emailController.text.toString(),
                        "password":_passwordController.text.toString(),
                      };
                      authViewModel.signupApi(data, context);
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, RouteName.login);
                  },
                  child:const Text('Have an account ? Sign in')
                )
              ],
            )),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton({
    Key? key,
    required this.title,
    this.loading = false,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10)
        ),
      height: 60,
      width: 200,
      child: Center(
        child: loading?const CircularProgressIndicator(color: Colors.white):Text(
          title,
          style: const TextStyle(color: AppColors.whiteColor),
        ),
      ),
    ),
    );
  }
}

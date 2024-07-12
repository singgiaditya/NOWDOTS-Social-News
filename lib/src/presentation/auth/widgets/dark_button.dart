import 'package:flutter/material.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';

class DarkButton extends StatelessWidget {
  final void Function()? onTap;
  final String label;

  const DarkButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll<Color>(primaryColor)),
        onPressed: onTap,
        child: Text(label,
            style: subtitleProximaNovaTextStyle.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:happy_luna/app/utils/fancy_button.dart';
import 'package:happy_luna/game/utils/dialogue.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DialogChoice {
  Future<bool?> show(
    BuildContext context,
    Color firstColor,
    String firstText,
    VoidCallback firstFunction,
    Color secondColor,
    String secondText,
    VoidCallback secondFunction,
  ) {
    return Alert(
        context: context,
        type: AlertType.none,
        title: "",
        style: const AlertStyle(
          animationType: AnimationType.fromTop,
          alertBorder: RoundedRectangleBorder(),
          isCloseButton: false,
          isOverlayTapDismiss: false,
          overlayColor: Colors.black26,
          backgroundColor: Colors.transparent,
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            option(firstColor, firstText, firstFunction),
            const SizedBox(width: 10.0),
            option(secondColor, secondText, secondFunction)
          ],
        )).show();
  }

  FancyButton option(Color color, String text, VoidCallback function) {
    return FancyButton(
      color: color,
      onPressed: function,
      size: 32.0,
      child: Text(
        text,
        style: Dialogue.choiceTextStyle,
      ),
    );
  }
}

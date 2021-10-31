import 'package:flutter/material.dart';
import 'package:happy_luna/app/utils/fancy_button.dart';

class DialogBase extends StatefulWidget {
  final Widget child;

  const DialogBase({Key? key, required this.child}) : super(key: key);

  static show(BuildContext context, WidgetBuilder builder,
      {bool barrierDismissible = false}) {
    showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) => DialogBase(
        child: builder(context),
      ),
    );
  }

  @override
  _DialogBaseState createState() => _DialogBaseState();
}

class _DialogBaseState extends State<DialogBase> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacityAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    scaleAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );

    controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: widget.child,
        ),
      ),
    );
  }
}

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    Key? key,
    required this.title,
    required this.desc,
    required this.buttons,
  }) : super(key: key);

  final String title;
  final String desc;
  final List<FancyButton> buttons;

  static show(
    BuildContext context,
    String title,
    List<FancyButton> buttons,
    String desc,
  ) {
    DialogBase.show(context, (context) {
      return CustomDialog(
        buttons: buttons,
        title: title,
        desc: desc,
      );
    });
  }

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> offsetAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    offsetAnimation = Tween<Offset>(
            begin: const Offset(0, -3), end: const Offset(0.0, 0.2))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceOut));
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SlideTransition(
            position: offsetAnimation,
            child: SizedBox(
              height: 100,
              width: 100,
              child: Text(widget.title),
            ),
          ),
          Text(widget.desc),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: widget.buttons,
          ),
        ],
      ),
    );
  }
}

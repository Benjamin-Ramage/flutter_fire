import 'package:flutter/material.dart';
import 'package:flutter_fire/styles/textfields.dart';

class EmailTextField extends StatefulWidget {
  final String hintText;
  final TextInputType textInputType;
  final void Function(String) onChanged;

  const EmailTextField({
    required this.hintText,
    this.textInputType = TextInputType.emailAddress,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TextFieldStyles.textBoxHorizontal, vertical: TextFieldStyles.textBoxVertical),
      child: TextField(
        onChanged: widget.onChanged,
        cursorColor: TextFieldStyles.cursorColor,
        textAlign: TextFieldStyles.textAlign,
        controller: _controller,
        decoration: TextFieldStyles.emailDecoration(widget.hintText),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AppButton extends StatefulWidget {
  const AppButton({Key? key}) : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

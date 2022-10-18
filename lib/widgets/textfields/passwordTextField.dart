import 'package:flutter/material.dart';
import 'package:flutter_fire/styles/base.dart';
import 'package:flutter_fire/styles/colors.dart';
import 'package:flutter_fire/styles/textfields.dart';

class PasswordTextField extends StatefulWidget {
  final TextInputType textInputType;
  final void Function(String) onChanged;
  final String hintText;

  const PasswordTextField({
    this.textInputType = TextInputType.text,
    required this.onChanged,
    required this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscure = true;
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
        obscureText: _isObscure,
        controller: _controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20.0),
          suffixIcon: IconButton(
            splashColor: AppColors.lightGrey,
            icon: Icon(
              _isObscure ? Icons.visibility : Icons.visibility_off,
              color: AppColors.red,
            ),
            onPressed: (){
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.black, width: BaseStyles.borderWidth),
            borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.black, width: BaseStyles.borderWidth),
            borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: AppColors.black, width: BaseStyles.borderWidth),
            borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: AppColors.red, width: BaseStyles.borderWidth),
            borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
          ),
          hintText: widget.hintText,
          hintStyle: TextFieldStyles.forgot,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

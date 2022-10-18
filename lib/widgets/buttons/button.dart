import 'package:flutter/material.dart';
import 'package:flutter_fire/styles/base.dart';
import 'package:flutter_fire/styles/buttons.dart';
import 'package:flutter_fire/styles/colors.dart';
import 'package:flutter_fire/styles/text.dart';

class AppButton extends StatefulWidget{
  final String buttonText;
  final ButtonType buttonType;
  final void Function() onPressed;

  const AppButton({Key? key,
    required this.buttonText,
    required this.buttonType,
    required this.onPressed,
  }) : super(key: key);

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    TextStyle fontStyle;
    Color buttonColor;

    switch (widget.buttonType) {
       case ButtonType.Red:
      fontStyle = TextStyles.buttonTextLight;
      buttonColor = AppColors.red;
      break;
       case ButtonType.Disabled:
      fontStyle = TextStyles.buttonTextLight;
      buttonColor = AppColors.grey;
      break;
       case ButtonType.Black:
      fontStyle = TextStyles.buttonTextLight;
      buttonColor = AppColors.black;
      break;
      case ButtonType.LightGrey:
        fontStyle = TextStyles.buttonTextLight;
        buttonColor = AppColors.lightGrey;
        break;
      default: 
      fontStyle = TextStyles.buttonTextLight;
      buttonColor = AppColors.white;
      break;
    }

    return AnimatedContainer(
      padding: EdgeInsets.only( 
        top: (pressed) ? BaseStyles.listFieldVertical + BaseStyles.animationOffset :  BaseStyles.listFieldVertical,
        bottom: (pressed) ? BaseStyles.listFieldVertical - BaseStyles.animationOffset :  BaseStyles.listFieldVertical,
        left: BaseStyles.listFieldHorizontal,
        right: BaseStyles.listFieldHorizontal
      ),
      child: GestureDetector(
              child: Container(  
          height: ButtonStyles.buttonHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(  
            color: buttonColor,
            borderRadius: BorderRadius.circular(BaseStyles.borderRadius),
            boxShadow: pressed ? BaseStyles.boxShadowPressed : BaseStyles.boxShadow
          ),
          child: Center(child: Text(widget.buttonText,style: fontStyle,)),
        ),
        onTapDown: (details){
          setState(() {
            if (widget.buttonType != ButtonType.Disabled) pressed = !pressed;
          });
        },
        onTapUp: (details){
          setState(() {
            if (widget.buttonType != ButtonType.Disabled) pressed = !pressed;
          });
        },
        onTap: (){
          if (widget.buttonType != ButtonType.Disabled) {
            widget.onPressed();
          }
        },
      ),
      duration: const Duration(milliseconds: 20),
    );
  }
}

enum ButtonType {
  LightGrey, Red, Disabled, Black,
}
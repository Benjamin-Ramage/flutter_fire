import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire/error_messages.dart';
import 'package:flutter_fire/theme/colours.dart';
import 'package:flutter_fire/widgets/login_widget.dart';

class ForgotPasswordPage extends StatefulWidget {

  const ForgotPasswordPage({Key? key,}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: AppColours.backgroundColour,
    body: Padding(
      padding: const EdgeInsets.only(left: 16, top: 100, right: 16, bottom: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Center(child: ClipOval(child: Image.asset('images/avataar_ben.png'))),
              const SizedBox(height: 20),
              Text(
                'Receive an email to\nreset your password.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  labelText: "What's your email address?",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
                style: Theme.of(context).textTheme.headline6,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? 'Enter a valid email'
                    : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                ),
                onPressed: resetPassword,
                child: Text(
                  'RESET PASSWORD',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                child: Text(
                  'Already have an account?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColours.teal,
                    fontSize: 20,
                  ),
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginWidget(onClickedSignUp: () {  },),
                )),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    ),
  );

  Future resetPassword() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      ErrorMessages.showSnackBar('Password Reset Email Sent');
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      ErrorMessages.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire/main.dart';
import 'package:flutter_fire/page/forgot_password_page.dart';
import 'package:flutter_fire/error_messages.dart';
import 'package:flutter_fire/theme/colours.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginWidget({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool isHidden = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor: AppColours.backgroundColour,
    body: Padding(
      padding: const EdgeInsets.only(left: 16, top: 80, right: 16, bottom: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: ClipOval(child: Image.asset('images/avataar_ben.png'))),
            const SizedBox(height: 25),
            TextField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
                labelText: 'Email address',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: isHidden,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                suffixIcon: IconButton(
                  onPressed: togglePasswordVisibility,
                  icon: isHidden ? const Icon(Icons.visibility_off, color: Colors.white) : const Icon(Icons.visibility, color: Colors.white),
                ),
                labelText: 'Password',
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
              ),
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )
              ),
              onPressed: signIn,
              child: Text(
                'CONTINUE',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColours.teal,
                  fontSize: 20,
                ),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ForgotPasswordPage(),
              )),
            ),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline6,
                text: 'No account?  ',
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignUp,
                    text: 'Sign Up',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColours.teal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      ErrorMessages.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app/screen/root_screen.dart';
import 'package:plant_app/screen/signup_screen.dart';
import '../widgets/textfields.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallDevice = constraints.maxHeight <= 800;

        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: isSmallDevice ? 8 : 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/signin.png',
                    fit: BoxFit.contain,
                    height:
                        isSmallDevice ? size.height * 0.3 : size.height * 0.3,
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Log in',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                Wrap(
                  runSpacing: 20,
                  children: const [
                    TextBoxes(
                      icon: Icons.alternate_email_outlined,
                      title: 'Email ID',
                    ),
                    TextBoxes(
                      icon: Icons.lock_open_outlined,
                      title: 'Password',
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    loginOption(Icons.arrow_forward_outlined, 24, 24, () {
                      context.pushTransition(
                        duration: const Duration(milliseconds: 500),
                        child: RootScreen(),
                        type: PageTransitionType.leftToRight,
                      );
                    }),
                    const SizedBox(width: 40),
                    loginOption(Icons.facebook_outlined, 24, 24, () {}),
                  ],
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    context.pushTransition(
                      duration: const Duration(milliseconds: 500),
                      child: SignupScreen(),
                      type: PageTransitionType.leftToRight,
                    );
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                        children: const [
                          TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(fontSize: 15),
                          ),
                          TextSpan(
                            text: 'Click here',
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.010),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget resetPassword() {
    return GestureDetector(
      onTap: () {},
      child: Align(
        alignment: Alignment.topRight,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Forgot password ? ',
                style: TextStyle(fontSize: 15),
              ),
              TextSpan(
                text: 'Click here',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowDivider() {
    return Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
          child: Text('OR', style: TextStyle(fontSize: 18)),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}

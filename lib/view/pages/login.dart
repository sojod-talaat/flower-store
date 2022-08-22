import 'package:flowerstore/app_router.dart';
import 'package:flowerstore/providers/provider.dart';
import 'package:flowerstore/view/pages/sign_up.dart';
import 'package:flowerstore/view/sharedui/shared_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  bool _secirty = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, Provider, x) {
      return Scaffold(
          body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image(image: AssetImage('assets/images/welcome.png'),),
                  const Text(
                    'Login Now ',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600),
                  ),
                  const Text('login now to browse our hot offers',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF8D8E98),
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: defulutTextFormFild(
                      style: Theme.of(context).textTheme.bodyText2,
                      controller: Provider.loginemailcontroller,
                      type: TextInputType.emailAddress,
                      labeltext: 'Email Adress',
                      hintText: 'Enter Email Adress',
                      //    obscureText: !_secirty,
                      prefix: const Icon(
                        Icons.email,
                        color: const Color(0xFF031956),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return 'Please a valid Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: defulutTextFormFild(
                        style: Theme.of(context).textTheme.bodyText2,
                        controller: Provider.loginpasswordcontroller,
                        type: TextInputType.visiblePassword,
                        labeltext: 'Password',
                        hintText: 'Enter Password',
                        onSubmited: (value) {},
                        prefix: const Icon(
                          Icons.lock,
                          color: Color(0xFF031956),
                        ),
                        suffixFun: () {},
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if (value.length <= 5) {
                            return 'Please enter long password';
                          }
                          return null;
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  defultMaterialButton(
                    height: 50,
                    width: 250,
                    text: 'LOGIN',
                    function: () {
                      Provider.Signin();
                    },
                  ),
                  //   fallback: (context) => CircularProgressIndicator(),
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account ?',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF8D8E98),
                          )),
                      defultTextButton(
                        text: 'Sign Up...',
                        onPressed: () {
                          AppRouter.NavigateWithReplacemtnToWidget(
                              SignupScreen());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
    });
  }
}

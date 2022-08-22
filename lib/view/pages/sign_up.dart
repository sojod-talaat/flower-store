import 'package:flowerstore/app_router.dart';
import 'package:flowerstore/providers/provider.dart';
import 'package:flowerstore/view/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../sharedui/shared_component.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
        builder: (context, Provider, x) {
      return Scaffold(
          body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: Provider.signUpKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign Up Now ',
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
                //name
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: defulutTextFormFild(
                    style: Theme.of(context).textTheme.bodyText2,
                    // controller: Provider.emailcontroller,
                    type: TextInputType.text,
                    labeltext: 'Name',
                    hintText: 'Enter Full Name',
                    //obscureText: SignUpCubit.get(context).secirty,
                    prefix: const Icon(
                      Icons.person,
                      // color: defultColor,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //email
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: defulutTextFormFild(
                    style: Theme.of(context).textTheme.bodyText2,
                    controller: Provider.emailcontroller,
                    type: TextInputType.emailAddress,
                    labeltext: 'Email Adress',
                    hintText: 'Enter Email Adress',
                    //obscureText: SignUpCubit.get(context).secirty,
                    prefix: Icon(
                      Icons.email,
                      // color: defultColor,
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
                SizedBox(
                  height: 20,
                ),
                //phone
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: defulutTextFormFild(
                      style: Theme.of(context).textTheme.bodyText2,
                      // controller:
                      //     SignUpCubit.get(context).phoneController,
                      type: TextInputType.phone,
                      labeltext: 'Phone',
                      hintText: 'Enter your phone',
                      onSubmited: (value) {},
                      prefix: Icon(
                        Icons.phone,
                        //color: defultColor,
                      ),
                      //obscureText: SignUpCubit.get(context).secirty,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (value.length == 10) {
                          return 'Please right number';
                        }
                        return null;
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                //pass
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: defulutTextFormFild(
                      style: Theme.of(context).textTheme.bodyText2,
                      controller: Provider.passwordcontroller,
                      type: TextInputType.text,
                      labeltext: 'Password',
                      hintText: 'Enter Password',
                      onSubmited: (value) {
                        // if (SignUpCubit.get(context)
                        //     .formkey
                        //     .currentState
                        //     .validate()) {}
                      },
                      prefix: Icon(
                        Icons.lock,
                        //  color: defultColor,
                      ),
                      //suffix: SignUpCubit.get(context).suffix,
                      suffixFun: () {
                        // SignUpCubit.get(context)
                        //     .ChangePasswordVisibility();
                      },
                      // obscureText: SignUpCubit.get(context).secirty,
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
                    text: 'SignUp',
                    function: () {
                      Provider.sigUp();
                      // if (SignUpCubit.get(context)
                      //     .formkey
                      //     .currentState
                    } //     .validate()) {
                    ),

                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account ?',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF8D8E98),
                        )),
                    defultTextButton(
                      text: 'LogIn',
                      onPressed: () {
                        AppRouter.NavigateToWidget(LoginScreen());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ));
    });
  }
}

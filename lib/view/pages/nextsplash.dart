import 'package:flowerstore/app_router.dart';
import 'package:flowerstore/providers/provider.dart';
import 'package:flowerstore/view/pages/add_slider.dart';
import 'package:flowerstore/view/pages/addcategory.dart';
import 'package:flowerstore/view/pages/home.dart';
import 'package:flowerstore/view/pages/silderpage.dart';
import 'package:flowerstore/view/sharedui/shared_component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Choose extends StatelessWidget {
  const Choose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<AuthProvider>(
      builder: (context, value, child) => Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            Lottie.asset('assets/collections/hello.json'),

            // Container(
            //     width: double.infinity,
            //     height: 200,
            //     decoration: const BoxDecoration(
            //         image: DecorationImage(
            //             image: AssetImage('assets/photos/k2.png')))),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    ('Start add your product to show user'),
                    style: GoogleFonts.badScript(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            defultMaterialButton(
                width: 250,
                height: 50,
                text: 'Category',
                function: () {
                  AppRouter.NavigateToWidget(AddCategory());
                }),
            SizedBox(
              height: 20,
            ),
            defultMaterialButton(
                width: 250,
                height: 50,
                text: 'Silder',
                function: () {
                  AppRouter.NavigateToWidget(AddSilder());
                }),
          ],
        )),
      ),
    ));
  }
}

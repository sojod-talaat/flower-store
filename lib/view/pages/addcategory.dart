import 'dart:ui';

import 'package:flowerstore/app_router.dart';
import 'package:flowerstore/view/colors.dart';
import 'package:flowerstore/view/pages/home.dart';
import 'package:flowerstore/view/sharedui/shared_component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/provider.dart';

class AddCategory extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Add Category',
            style: GoogleFonts.dancingScript(),
          ),
          backgroundColor: Colors.white,
        ),
        body: Consumer<FireStoreProvider>(builder: (context, provider, x) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                provider.selectedImage == null
                    ? InkWell(
                        onTap: () {
                          provider.selectImage();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ClipRRect(
                            clipBehavior: Clip.hardEdge,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              color: Colors.grey,
                              height: 200,
                              width: double.infinity,
                              child: provider.selectedImage == null
                                  ? Icon(
                                      Icons.add_photo_alternate,
                                      size: 40,
                                      color: HexColore.fromHex('#f8e3e2'),
                                    )
                                  : Image.file(
                                      provider.selectedImage!,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                      )
                    : CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(provider.selectedImage!),
                      ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: defulutTextFormFild(
                    hintText: 'category type',
                    controller: provider.categoryNameController,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                defultMaterialButton(
                  text: 'New Category',
                  fontsize: 12,
                  function: () {
                    provider.addNewCategory();
                    AppRouter.NavigateToWidget(MyHomePage2());
                  },
                  ColorText: Colors.black,
                  width: 200,
                  height: 65,
                  borderRadius: 13,
                  backColor: HexColore.fromHex('#f8e3e2'),
                ),

                // ElevatedButton(
                //     onPressed: () {
                //       provider.addNewCategory();
                //       AppRouter.NavigateToWidget(MyHomePage());
                //     },
                //     child: Text('New Category'))
              ],
            ),
          );
        }));
  }
}

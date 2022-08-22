import 'dart:ui';

import 'package:flowerstore/app_router.dart';
import 'package:flowerstore/view/colors.dart';

import 'package:flowerstore/view/pages/silderpage.dart';
import 'package:flowerstore/view/sharedui/shared_component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../providers/provider.dart';

class AddSilder extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Add Silder',
            style: GoogleFonts.dancingScript(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Consumer<FireStoreProvider>(builder: (context, provider, x) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
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
                    hintText: 'Silder name',
                    controller: provider.categoryNameController,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                defultMaterialButton(
                  text: 'New Silder',
                  fontsize: 12,
                  function: () {
                    provider.addNewSlider();
                    AppRouter.NavigateToWidget(SilderPage());
                  },
                  ColorText: Colors.black,
                  width: 250,
                  height: 50,
                  borderRadius: 13,
                  backColor: Color.fromARGB(255, 224, 162, 143),
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

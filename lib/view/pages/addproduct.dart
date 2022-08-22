import 'package:flowerstore/app_router.dart';
import 'package:flowerstore/providers/provider.dart';
import 'package:flowerstore/view/colors.dart';
import 'package:flowerstore/view/pages/home.dart';
import 'package:flowerstore/view/pages/product.dart';
import 'package:flowerstore/view/sharedui/shared_component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatelessWidget {
  String Catid;

  AddProduct({Key? key, required this.Catid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Add Product',
          style: GoogleFonts.dancingScript(),
        )),
        body: Consumer<FireStoreProvider>(builder: (context, provider, x) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                provider.selectedImage == null
                    ? InkWell(
                        onTap: () {
                          provider.selectImage();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ClipRRect(
                            clipBehavior: Clip.hardEdge,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              color: Colors.grey,
                              height: 200,
                              width: double.infinity,
                              child: provider.selectedImage == null
                                  ? Icon(
                                      Icons.add_a_photo,
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
                    hintText: 'product Name ',
                    controller: provider.productName,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: defulutTextFormFild(
                    hintText: 'product price',
                    controller: provider.price,
                    type: TextInputType.number,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: defulutTextFormFild(
                    hintText: 'product descrption',
                    controller: provider.productDescprition,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                defultMaterialButton(
                  text: 'New Product',
                  fontsize: 12,
                  function: () {
                    provider.addNewProduct(Catid);
                    AppRouter.NavigateToWidget(CookiePage(Catid));
                  },
                  ColorText: Colors.black,
                  width: 210,
                  height: 60,
                  borderRadius: 13,
                  backColor: Color.fromARGB(255, 224, 162, 143),
                ),
              ],
            ),
          );
        }));
  }
}

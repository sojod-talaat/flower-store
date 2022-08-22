import 'package:flowerstore/app_router.dart';
import 'package:flowerstore/models/category.dart';
import 'package:flowerstore/providers/provider.dart';
import 'package:flowerstore/view/pages/home.dart';
import 'package:flowerstore/view/sharedui/shared_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditCategory extends StatelessWidget {
  Category category;
  EditCategory({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<FireStoreProvider>(builder: (context, provider, x) {
      return Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          provider.selectedImage == null
              ? InkWell(
                  onTap: () {
                    provider.selectImage();
                  },
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.teal,
                    backgroundImage: NetworkImage(category.imageUrl),
                  ))
              : CircleAvatar(
                  backgroundImage: FileImage(provider.selectedImage!),
                  radius: 80),
          SizedBox(
            height: 20,
          ),
          // provider.selectedImage == null
          //     ? InkWell(
          //         onTap: () {
          //           provider.selectImage();
          //         },
          //         child: Padding(
          //           padding: const EdgeInsets.all(15.0),
          //           child: ClipRRect(
          //             clipBehavior: Clip.hardEdge,
          //             borderRadius: BorderRadius.circular(20),
          //             child: Container(
          //               color: Colors.grey.withOpacity(0.2),
          //               height: 300,
          //               width: double.infinity,
          //               child: provider.selectedImage == null
          //                   ? Icon(
          //                       Icons.add_a_photo,
          //                       size: 40,
          //                       color: Color.fromARGB(255, 224, 162, 143),
          //                     )
          //                   : Image.file(
          //                       provider.selectedImage!,
          //                       fit: BoxFit.cover,
          //                     ),
          //             ),
          //           ),
          //         ),
          //       )
          //     : InkWell(
          //         onTap: () {
          //           provider.selectImage();
          //         },
          //         child: CircleAvatar(
          //           radius: 50,
          //           backgroundImage: NetworkImage(category.imageUrl),
          //         ),
          //       ),
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
            text: 'Edit  Category',
            fontsize: 12,
            function: () {
              provider.updateCategory(category);
              AppRouter.NavigateToWidget(MyHomePage2());
            },
            ColorText: Colors.black,
            width: 250,
            height: 50,
            borderRadius: 13,
            backColor: Color.fromARGB(255, 224, 162, 143),
          ),
        ],
      );
    }));
  }
}

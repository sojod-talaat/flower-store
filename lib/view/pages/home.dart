import 'package:flowerstore/app_router.dart';
import 'package:flowerstore/view/colors.dart';
import 'package:flowerstore/models/category.dart';
import 'package:flowerstore/providers/provider.dart';
import 'package:flowerstore/view/pages/addcategory.dart';
import 'package:flowerstore/view/pages/nextsplash.dart';
import 'package:flowerstore/view/sharedui/collection_tile.dart';
//import 'package:flowerstore/views/product_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyHomePage2 extends StatefulWidget {
  MyHomePage2({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage2> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage2> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: .8);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Category category;
    return Consumer<FireStoreProvider>(
      builder: (context, provider, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text(
              'main Screen',
              style: GoogleFonts.dancingScript(),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {},
              ),
            ]),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: provider.categories.length == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: provider.categories.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: CollectionTile(provider.categories[index]),
                      onTap: () {
                        // openBottomSheet(
                        //     context, Collection.colletions()[index], pageController);
                      },
                    );
                  }),
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: HexColore.fromHex('#f8e3e2'),
          onPressed: () {
            AppRouter.NavigateToWidget(Choose());
            //AppRouter.NavigateToWidget(AddCategory());
          },
          child: Icon(Icons.add, size: 30, color: HexColore.fromHex('343e4b')),
        ),
      ),
    );
  }
}
// }

// AppBar _buildAppBar(BuildContext context, String title) {
//   return AppBar(
//     //title: Text(),
//     actions: [
//       Stack(
//         children: [
//           IconButton(
//               onPressed: () {
//                 Navigator.of(context)
//                     .push(MaterialPageRoute(builder: (context) {
//                   return const CartPage();
//                 }));
//               },
//               icon: const Icon(
//                 Icons.shopping_bag_outlined,
//                 size: 30,
//                 color: Colors.black87,
//               )),
//           Consumer<CartModel>(builder: (context, cart, child) {
//             return !cart.isEmpty()
//                 ? Positioned(
//                     height: 18,
//                     width: 18,
//                     right: 25,
//                     top: 15,
//                     child: Container(
//                       padding: const EdgeInsets.all(4),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(100),
//                           color: Colors.black),
//                       child: Text("${cart.itemsCount}",
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(color: Colors.white)),
//                     ))
//                 : Container();
//           })
//         ],
//       )
//     ],
//   );
// }

void openBottomSheet(
    BuildContext context, Category collection, PageController controller) {
  var size = MediaQuery.of(context).size;
  showModalBottomSheet(
      constraints:
          BoxConstraints(maxHeight: size.height * .88, minWidth: size.width),
      backgroundColor:
          Colors.amber[1000], //const Color.fromRGBO(248, 247, 243, 1),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      elevation: 3,
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Column(
            children: [
              Text(
                "${collection.name}'s Collection",
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
              const SizedBox(height: 24),
              // Flexible(
              //   child: PageView.builder(
              //       controller: controller,
              //       scrollDirection: Axis.horizontal,
              //       itemCount: collection.products!.length,
              //       itemBuilder: (context, index) {
              //         return GestureDetector(
              //             onTap: () {
              //               Navigator.of(context)
              //                   .push(MaterialPageRoute(builder: (context) {
              //                 return ProductDetails(
              //                     product: collection.products![index]);
              //               }));
              //             },
              //             child: Align(
              //               alignment: const Alignment(0, 1),
              //               child: ProductTile(
              //                 product: collection.products![index],
              //               ),
              //             ));
              //       }),
              // ),
            ],
          ),
        );
      });
}

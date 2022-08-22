import 'package:flowerstore/models/product.dart';
import 'package:flowerstore/providers/provider.dart';
import 'package:flowerstore/view/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CookiePage extends StatelessWidget {
  String catid;
  CookiePage(this.catid);
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
      builder: (context, value, child) => value.products == null
          ? const CircularProgressIndicator()
          : Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.white,
                  title: Text(
                    'All Product ',
                    style: GoogleFonts.dancingScript(),
                  )),
              backgroundColor: Colors.white,
              body: ListView(
                children: <Widget>[
                  SizedBox(height: 15.0),
                  Container(
                      padding: EdgeInsets.only(right: 15.0),
                      width: MediaQuery.of(context).size.width - 30.0,
                      height: MediaQuery.of(context).size.height - 50.0,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 15.0,
                                childAspectRatio: 0.8,
                                crossAxisCount: 2),
                        // crossAxisCount: 2,
                        primary: false,
                        itemCount: value.products.length,
                        itemBuilder: (context, index) {
                          return buildCard(value.products[index], catid);
                        },
                      )),
                  SizedBox(height: 15.0)
                ],
              ),
            ),
    );
  }
}

class buildCard extends StatelessWidget {
  Product product;
  String CatId;
  buildCard(this.product, this.CatId);
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
      builder: (context, value, child) => Padding(
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 20.0, left: 9.0, right: 5.0),
          child: InkWell(
              onTap: () {},
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Colors.white),
                  child: Column(children: [
                    Column(
                        //tag: const AssetImage('assets/photos/k6.png'),
                        children: [
                          Container(
                              margin: const EdgeInsets.only(top: 0.0),
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12)),
                                  image: DecorationImage(
                                      image: NetworkImage(product.imageUrl!),
                                      fit: BoxFit.cover))),
                          const SizedBox(height: 7.0),
                          Text(product.productName ?? 'flower',
                              style: const TextStyle(
                                  color: Color(0xFF575E67),
                                  fontFamily: 'Varela',
                                  fontSize: 14.0)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(product.price.toString() + '\$',
                              style: const TextStyle(
                                  color: Color(0xFFCC8053),
                                  fontFamily: 'Varela',
                                  fontSize: 14.0)),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  color: Color(0xFFEBEBEB), height: 1.0)),
                          Padding(
                              padding: EdgeInsets.only(left: 5.0, right: 5.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: HexColore.fromHex('c26b58'),
                                            style: BorderStyle.solid,
                                            width: 1.0,
                                          ),
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(13.0),
                                        ),
                                        child: TextButton(
                                            onPressed: () {},
                                            child: const Text('Edit'))),
                                    Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: HexColore.fromHex('343e4b'),
                                            style: BorderStyle.solid,
                                            width: 1.0,
                                          ),
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(13.0),
                                        ),
                                        child: TextButton(
                                            onPressed: () {
                                              value.deleteProduct(
                                                  product, CatId);
                                            },
                                            child: Text('delete'))),
                                  ]))
                        ])
                  ])))),
    );
  }
}

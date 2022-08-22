import 'dart:developer';

import 'package:flowerstore/app_router.dart';

import 'package:flowerstore/models/siLder.dart';
import 'package:flowerstore/providers/provider.dart';
import 'package:flowerstore/view/pages/add_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SilderPage extends StatelessWidget {
  Widget build(BuildContext context) {
    Silderitem imageSlider;
    return Consumer<FireStoreProvider>(
      builder: (context, provider, child) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('All Silder')),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: provider.categories.length == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: provider.imagesliderslist.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: CollectionTile2(provider.imagesliderslist[index]),
                      onTap: () {
                        // openBottomSheet(
                        //     context, Collection.colletions()[index], pageController);
                      },
                    );
                  }),
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            AppRouter.NavigateToWidget(AddSilder());
          },
          child: const Icon(Icons.add, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}

class CollectionTile2 extends StatelessWidget {
  // const CollectionTile({Key? key,}) : super(key: key);
  Silderitem? imagesilder;
  CollectionTile2(this.imagesilder);

  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(builder: (context, provider, x) {
      return InkWell(
        onTap: () {
          // provider.getAllProduct(cateogory!.catId!);
          // AppRouter.NavigateToWidget((CookiePage()));
        },
        child: Padding(
            padding: EdgeInsets.all(13),
            child: Row(children: <Widget>[
              Container(
                width: 50,
                height: 180,
                margin: const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Color.fromARGB(255, 59, 94, 60),
                      ),
                      onPressed: () {
                        provider.deleteSlider(imagesilder!);
                        log('s');
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(imagesilder!.imagesliderUrl),
                        fit: BoxFit.cover)),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.1),
                      ])),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        imagesilder!.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ))
            ])),
      );
    });
  }
}

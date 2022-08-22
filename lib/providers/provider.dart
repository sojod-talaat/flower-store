import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flowerstore/app_router.dart';

import 'package:flowerstore/firabase/auth.dart';
import 'package:flowerstore/firabase/firestore.dart';
import 'package:flowerstore/firabase/storage.dart';
import 'package:flowerstore/models/product.dart';
import 'package:flowerstore/models/siLder.dart';
import 'package:flowerstore/view/pages/home.dart';
import 'package:flowerstore/view/pages/nextsplash.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../models/category.dart';

class FireStoreProvider extends ChangeNotifier {
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController productDescprition = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController silderName = TextEditingController();
  File? selectedImage;
  List<Category> categories = [];
  List<Product> products = [];
  List<Silderitem> imagesliderslist = [];
  selectImage() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(xfile!.path);
    notifyListeners();
  }

  FireStoreProvider() {
    getAllCategory();
    getAllsliders();
  }
  addNewCategory() async {
    if (selectedImage != null) {
      String imageUrl =
          await StorageHelper.storageHelper.uploadImage(selectedImage!);
      Category category =
          Category(name: categoryNameController.text, imageUrl: imageUrl);
      FireStoreHelper.fireStoreHelper.addCategoryToFireStore(category);
      category.catId = category.catId;
      categories.add(category);
      notifyListeners();

      categoryNameController.clear();
      selectedImage = null;
    }
  }

  getAllCategory() async {
    categories =
        await FireStoreHelper.fireStoreHelper.getCategoryFromFireStore();
    notifyListeners();
  }

  updateCategory(Category category) async {
    String? imageUrl;
    if (selectedImage != null) {
      imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
    }
    Category newCategory = Category(
        name: categoryNameController.text,
        imageUrl: imageUrl ?? category.imageUrl);
    newCategory.catId = category.catId;
    await FireStoreHelper.fireStoreHelper.updateCategory(newCategory);
    selectedImage = null;
    categoryNameController.clear();
    getAllCategory();
  }

  deleteCategory(Category category) async {
    await FireStoreHelper.fireStoreHelper.deleteCategory(category);
    getAllCategory();
    notifyListeners();
  }

  getAllProduct(String ctid) async {
    products = await FireStoreHelper.fireStoreHelper.getAlProduct(ctid);
    notifyListeners();
  }

/////////////////////////////////////////////////////////////////////////////////
  addNewProduct(String catId) async {
    if (selectedImage != null) {
      String imageUrl2 =
          await StorageHelper.storageHelper.uploadImage(selectedImage!);
      Product product = Product(
        productName: productName.text,
        description: productDescprition.text,
        price: int.parse(price.text),
        imageUrl: imageUrl2,

        //quantity: int.parse(ProductquantityController.text),
      );
      Product aNewProduct =
          await FireStoreHelper.fireStoreHelper.addNewProduct(product, catId);

      //ProductquantityController.clear();
      products.add(aNewProduct);
      selectedImage = null;
      productDescprition.clear();
      productName.clear();
      price.clear();

      // notifyListeners();
      getAllProduct(catId);
    }
  }

  updateProduct(Product product, String ctid) async {
    String? imageUrl;

    if (selectedImage != null) {
      imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
    }
    Product newProduct = Product(
      description: productDescprition.text,
      imageUrl: imageUrl,
      price: int.parse(price.text),
      productName: productName.text,
    );
    newProduct.id = product.id;
    FireStoreHelper.fireStoreHelper.updateProduct(newProduct, ctid);
    getAllProduct(ctid);
  }

  deleteProduct(Product product, String ctid) async {
    await FireStoreHelper.fireStoreHelper.deleteProduct(product, ctid);
    getAllProduct(ctid);
  }

  getAllsliders() async {
    imagesliderslist = await FireStoreHelper.fireStoreHelper.getAllSliders();
    notifyListeners();
  }

  addNewSlider() async {
    if (selectedImage != null) {
      String imageUrl =
          await StorageHelper.storageHelper.uploadImage(selectedImage!);
      Silderitem imageSliders =
          Silderitem(imagesliderUrl: imageUrl, title: silderName.text);
      FireStoreHelper.fireStoreHelper..addNweSlider(imageSliders);
      imagesliderslist.add(imageSliders);
      selectedImage = null;
      silderName.clear();
      notifyListeners();

      getAllsliders();
    }
  }

  deleteSlider(Silderitem imageSlider) {
    FireStoreHelper.fireStoreHelper.deleteSlider(imageSlider);
    imagesliderslist.removeWhere(
        (element) => element.sliderid == imageSlider.imagesliderUrl);
    notifyListeners();
    getAllsliders();
  }
}

class AuthProvider extends ChangeNotifier {
  GlobalKey<FormState> signUpKey = GlobalKey();
  GlobalKey<FormState> loginKey = GlobalKey();

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController loginemailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController loginpasswordcontroller = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  NullValidate(String? v) {
    if (v == null || v.isEmpty) {
      return "this felied required";
    }
  }

  passworadVailidation(String V) {
    if (V.length < 6) {
      return "password weak,must be contanin 6 digat at least";
    }
  }

  emailValidation(String value) {
    if (EmailValidator.validate(value)) {
      return "must be email address";
    }
  }

  Signin() async {
    UserCredential? credential = await AuthHelper.auth
        .Signin(loginemailcontroller.text, loginpasswordcontroller.text);
    AppRouter.NavigateToWidget(MyHomePage2());

    // if (loginemailcontroller.text == 'sojodtalaat990@hotmail.com') {
    //   AppRouter.NavigateToWidget(Choose());
    // } else {
    //   AppRouter.NavigateToWidget(const UserPage());
    // }
    // if (credential != null) {
    //   AppRouter.NavigateWithReplacemtnToWidget(Choose());
    // }
  }

  sigUp() async {
    if (signUpKey.currentState!.validate()) {
      UserCredential? userq = await AuthHelper.auth
          .userSignUP(emailcontroller.text, passwordcontroller.text);
      if (userq != null) {
        AppRouter.NavigateWithReplacemtnToWidget(MyHomePage2());
      }
      // AppUser appUser = AppUser(
      //     id: userq!.user!.uid,
      //     email: emailcontroller.text,
      //     username: username.text,
      //     city: city.text,
      //     country: country.text);
    }
  }

  checUser() {
    AuthHelper.auth.checkUser();
  }

  signout() {
    AuthHelper.auth.Singout();
  }
}

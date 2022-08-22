import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flowerstore/models/category.dart';
import 'package:flowerstore/models/product.dart';
import 'package:flowerstore/models/siLder.dart';

class FireStoreHelper {
  FireStoreHelper._();
  static FireStoreHelper fireStoreHelper = FireStoreHelper._();
  FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> firebaseInstanceuser =
      FirebaseFirestore.instance.collection('users');
  final String categoryCollectionName = 'categories';

  // addUserToFireStore(AppUser appUser) async {
  //   firebaseInstanceuser.doc(appUser.id!).set(appUser.toMap());
  // }

  // Future<AppUser> getUserFromFireStore(String id) async {
  //   DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
  //       await firebaseInstanceuser.doc(id).get();
  //   documentSnapshot.data();
  //   return AppUser.fromMap(documentSnapshot.data()!);
  // }

  ////////////////////////////////////////////////////////////////////////////////////////////////////
  CollectionReference<Map<String, dynamic>> firebaseInstancecategory =
      FirebaseFirestore.instance.collection('categories');
  CollectionReference<Map<String, dynamic>> firebaseInstansilder =
      FirebaseFirestore.instance.collection('Slider');
  addCategoryToFireStore(Category category) async {
    await firebaseInstancecategory.add(category.toMap());
  }

  Future<List<Category>> getCategoryFromFireStore() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firebaseInstancecategory.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        querySnapshot.docs;
    List<Category> categories = documents.map((e) {
      Category category = Category.fromMap(e.data());
      category.catId = e.id;
      return category;
    }).toList();
    return categories;
  }

  deleteCategory(Category category) async {
    await firebaseInstancecategory.doc(category.catId).delete();
  }

  deleteSilder(Silderitem category) async {
    await firebaseInstansilder.doc(category.sliderid).delete();
  }

  // updateCategory(Category category) async {
  //   await firebaseInstancecategory.doc(category.catId).update(category.toMap());
  // }
  updateCategory(Category category) async {
    await firebaseInstancecategory.doc(category.catId).update(category.toMap());
  }

////////////////////////////////////////////////////////////////////////
  // Future<Product> addNewProduct(Product product, String CatId) async {

  Future<Product> addNewProduct(Product product, String catId) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        await FirebaseFirestore.instance
            .collection(categoryCollectionName)
            .doc(catId)
            .collection("products")
            .add(product.toMap());
    product.id = documentReference.id;
    return product;
  }

// ignore: non_constant_identifier_names
  Future<List<Product>> getAlProduct(String CatId) async {
    QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore.instance
        .collection(categoryCollectionName)
        .doc(CatId)
        .collection('products')
        .get();
    List<Product> prodectss = query.docs.map((e) {
      Map<String, dynamic> data = e.data();
      data['id'] = e.id;
      Product product = Product.fromMap(data);
      // product.id = e.id;
      return product;
    }).toList();
    print(prodectss.length);
    return prodectss;
  }

  updateProduct(Product product, String id) async {
    await FirebaseFirestore.instance
        .collection('categories')
        .doc(id)
        .collection('product ')
        .doc(product.id)
        .update(product.toMap());
  }

  deleteProduct(Product product, String id) async {
    await FirebaseFirestore.instance
        .collection(categoryCollectionName)
        .doc(id)
        .collection('products')
        .doc(product.id)
        .delete();
  }

  CollectionReference<Map<String, dynamic>> imagesliderinstance =
      FirebaseFirestore.instance.collection('Slider');
  Future<List<Silderitem>> getAllSliders() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await imagesliderinstance.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> DocumentSnapshot =
        querySnapshot.docs;
    List<Silderitem> sliderslist = DocumentSnapshot.map((e) {
      Silderitem sliderimage = Silderitem.fromMap(e.data());
      sliderimage.sliderid = e.id;
      return sliderimage;
    }).toList();

    return sliderslist;
  }

  Future<Silderitem> addNweSlider(Silderitem imageSlider) async {
    DocumentReference<Map<String, dynamic>> docref =
        await imagesliderinstance.add(imageSlider.toMap());
    imageSlider.sliderid = docref.id;
    return imageSlider;
  }

  deleteSlider(Silderitem imageSlider) async {
    imagesliderinstance.doc(imageSlider.sliderid).delete();
  }
}


/////////////////////////////////////////////////////


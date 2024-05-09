import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_new/model/productmodel/productmodel.dart';
import 'package:project_new/utils/colorconstant/colorconstant.dart';

class Homecontroller extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productnamecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController imageurl = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();

  String category = 'general';
  String flavor = 'un flavored';
  bool offer = false;
  List<Product> products = [];

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('products');
    await fetchProducts();
    super.onInit();
  }

  addproduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
          id: doc.id,
          name: productnamecontroller.text,
          category: category,
          description: descriptioncontroller.text,
          price: double.tryParse(pricecontroller.text),
          flavor: flavor,
          image: imageurl.text,
          offer: true);

      final productJson = product.toJson();
      doc.set(productJson);
      fetchProducts();
      Get.snackbar('Success', 'Product added successfully',
          colorText: colorconstant.primarygreen);
      setValueDefault();
    } catch (e) {
      print(e);
    }
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs
          .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      products.clear();
      products.assignAll(retrievedProducts);
      Get.snackbar('Success', 'Product fetch successfully',
          colorText: colorconstant.primarygreen);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: colorconstant.primaryred);
      print(e);
    } finally {
      update();
    }
  }

  deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
      fetchProducts();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: colorconstant.primaryred);
    }
  }

  void setValueDefault() {
    productnamecontroller.clear();
    descriptioncontroller.clear();
    pricecontroller.clear();
    imageurl.clear();

    category = 'general';
    flavor = 'un flavored';
    offer = false;
    update();
  }
}



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:project_new/model/productmodel/productmodel.dart';
// import 'package:project_new/utils/colorconstant/colorconstant.dart';

// class Homecontroller extends GetxController {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   late CollectionReference productCollection;
//   List<Product> products = [];
//   TextEditingController productnamecontroller = TextEditingController();
//   TextEditingController descriptioncontroller = TextEditingController();
//   TextEditingController imageurl = TextEditingController();
//   TextEditingController pricecontroller = TextEditingController();

//   String category = 'general';
//   String flavor = 'un flavored';
//   bool offer = false;



//   @override
//   Future<void> onInit() async {
//     productCollection = firestore.collection('products');

//     await fetchProducts();
//     super.onInit();
//   }
//     Future<void> addProduct() async {
//     try {
//       DocumentReference<Object?> doc = productCollection.doc();
//       Product product = Product(
//         id: doc.id,
//         name: productnamecontroller.text,
//         category: category,
//         description: descriptioncontroller.text,
//         price: double.tryParse(pricecontroller.text),
//         flavor: flavor,
//         image: imageurl.text,
//         offer: offer,
//       );
//       final productJson = product.toJson();

//       await doc.set(productJson as Product);

//       Get.snackbar("Success", "Product added successfully",
//           colorText: colorconstant.primarygreen);
//       fetchProducts();
//       setValueDefault();
//     } catch (e) {
//       Get.snackbar("Error", e.toString(), colorText: colorconstant.primaryred);
//       print(e);
//     }
//   }


//   Future<void> fetchProducts() async {
//     try {
//       QuerySnapshot productSnapshot = await productCollection.get();
//       final List<Product> retrievedProducts = productSnapshot.docs
//           .map((doc) => Product.fromJson(doc.data() as Map<String, dynamic>))
//           .toList();
//       products.clear();
//       products.assignAll(retrievedProducts);
//       Get.snackbar('Success', 'Product fetch successfully',
//           colorText: colorconstant.primarygreen);
//     } catch (e) {
//       Get.snackbar('Error', e.toString(), colorText: colorconstant.primaryred);
//       print(e);
//     } finally {
//       update();
//     }
//   }
//     deleteProduct(String id) async {
//     try {
//       await productCollection.doc(id).delete();
//       fetchProducts();
//     } catch (e) {
//       Get.snackbar('Error', e.toString(), colorText: colorconstant.primaryred);
//     }
//   }

//   void setValueDefault() {
//     productnamecontroller.clear();
//     descriptioncontroller.clear();
//     pricecontroller.clear();
//     imageurl.clear();

//     category = 'general';
//     flavor = 'un flavored';
//     offer = false;
//     update();
//   }
// }








import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_new/controller/homecontroller/homecontroller.dart';
import 'package:project_new/utils/colorconstant/colorconstant.dart';
import 'package:project_new/widgets/dropdownbtn.dart';

class Addproductscreen extends StatelessWidget {
  const Addproductscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Homecontroller>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(title: Text("Add product")),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Add New Product",
                  style: TextStyle(
                    color: colorconstant.primaryblack,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: ctrl.productnamecontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Product Name",
                    hintText: "Enter Your Product Name",
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: ctrl.descriptioncontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Product Description",
                    hintText: "Enter Your Product Description",
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: ctrl.imageurl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Image Url",
                    hintText: "Enter Your Image Url",
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: ctrl.pricecontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Product Price",
                    hintText: "Enter Your Product Price",
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Dropdownbtn(
                        items: ['Cakes', 'Cupcake', 'Donuts', 'Cookies'],
                        selectedItemtext: ctrl.category,
                        onselected: (selectedvalue) {
                          ctrl.category = selectedvalue ?? "general";
                          ctrl.update();
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Dropdownbtn(
                        items: [
                          'Vanila',
                          'Chocolate',
                          'Red velvet',
                          'Lemon',
                          'Strawberry',
                          'Raspberry',
                          'Nuts',
                          'Mango',
                          'Almond',
                          'Cocunut'
                        ],
                        selectedItemtext: ctrl.flavor,
                        onselected: (selectedvalue) {
                          ctrl.flavor = selectedvalue ?? "un flavored";
                          ctrl.update();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text("Offer Product?"),
                Dropdownbtn(
                  items: ['true', 'false'],
                  selectedItemtext: ctrl.offer.toString(),
                  onselected: (selectedvalue) {
                    ctrl.offer =
                        bool.tryParse(selectedvalue ?? "false") ?? false;
                    ctrl.update();
                  },
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    ctrl.addproduct();
                  },
                  child: Text(
                    "Add Product",
                    style: TextStyle(color: colorconstant.primarywhite),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(colorconstant.primarygreen),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

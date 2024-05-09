import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_new/controller/homecontroller/homecontroller.dart';
import 'package:project_new/utils/colorconstant/colorconstant.dart';
import 'package:project_new/view/admin/addproductscreen/addproduct.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Homecontroller>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Desserts"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: colorconstant.primarygreen,
          onPressed: () {
            Get.to(Addproductscreen());
          },
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: ctrl.products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(ctrl.products[index].name ?? ""),
                  subtitle: Text((ctrl.products[index].price ?? 0).toString()),
                  trailing: InkWell(
                      onTap: () {
                        ctrl.deleteProduct(ctrl.products[index].id ?? "");
                      },
                      child: Icon(Icons.delete)),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}

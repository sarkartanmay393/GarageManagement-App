import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../helper/formBarMaker.dart';
import '../../state/provider.dart';
import '../menu/menu.dart';

class AddNewPage extends StatefulWidget {
  static const routeName = "AddNewInventoryItemPage";
  AddNewPage({Key? key}) : super(key: key);

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  //
  final _key = GlobalKey<ScaffoldState>();

  Placemark pm = Placemark(locality: "Jalpaiguri");

  final _picker = ImagePicker();
  File? image1;
  bool image1marker = false;
  void selectImage1() async {
    var img = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (img != null) {
        image1 = File(img.path);
        image1marker = true;
      }
    });
  }

  Widget inputBar(String name, BuildContext context) {
    return Wrap(
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 12, right: 8),
          decoration: BoxDecoration(
            border: Border.all(width: 0.2),
          ),
          padding: const EdgeInsets.only(left: 8),
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter $name",
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var InfoFlow = Provider.of<InfoFlower>(context);
    return Scaffold(
      key: _key,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, size.height * 0.07),
        child: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            "Add New Product",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.navigate_before_outlined,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
      ),
      drawer: Menu(),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormBar.inputBarWithLabel(
                        name: "Product ID",
                        context: context,
                        onSaveStorage: "",
                        initVal: "",
                      ),
                      FormBar.inputBarWithLabel(
                        name: "Product Name",
                        context: context,
                        onSaveStorage: "",
                        initVal: "",
                      ),
                      FormBar.inputBarWithLabel(
                        name: "Price",
                        context: context,
                        onSaveStorage: "",
                        initVal: "",
                      ),
                      FormBar.inputBarWithLabel(
                        name: "Catagory",
                        context: context,
                        onSaveStorage: "",
                        initVal: "",
                        readOnlyRef: true,
                      ),
                      Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              "Quantities",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: size.width * 0.45,
                                margin:
                                    const EdgeInsets.only(top: 5, bottom: 12),
                                child: FormBar.inputBar(
                                  name: "Available",
                                  context: context,
                                  onSaveStorage: "",
                                  initVal: "",
                                  keyboardTypeRef: TextInputType.number,
                                ),
                              ),
                              const Spacer(),
                              Container(
                                width: size.width * 0.45,
                                margin: const EdgeInsets.only(
                                    top: 5, bottom: 12, right: 8),
                                child: FormBar.inputBar(
                                  name: "In Hands",
                                  context: context,
                                  onSaveStorage: "",
                                  initVal: "",
                                  keyboardTypeRef: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
                        child: Text(
                          "Add Photos",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      InkWell(
                        onTap: selectImage1,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 9,
                          ),
                          height: 75,
                          width: 75,
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: image1marker
                              ? Image.file(
                                  image1!,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(Icons.add),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            fixedSize:
                                Size(size.width * 0.8, size.height * 0.05),
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            alignment: AlignmentDirectional.center,
                          ),
                          child: Text(
                            "Add Item",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:inventory_management_system/model/inventory_db.dart';
import 'package:inventory_management_system/model/utils_db.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  // final _editFormKey = GlobalKey<FormBuilderState>();

  // String single_item = "";

  Inventory formData = Inventory();
  List<Inventory> inventories = [];

  @override
  void initState() {
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FormScreen"),
        backgroundColor: Colors.green,
        elevation: 20,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              children: [
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: 'name',
                        onChanged: (value) {
                          formData.name = value.toString();
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.required(),
                        decoration: const InputDecoration(
                          labelText: "Inventory Name",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      FormBuilderTextField(
                        name: 'description',
                        onChanged: (value) {
                          formData.description = value.toString();
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.required(),
                        decoration: const InputDecoration(
                          labelText: "descriptions",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      FormBuilderTextField(
                        initialValue: "0",
                        name: 'quantity',
                        onChanged: (value) {
                          formData.quantity = double.parse(value.toString());
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        validator: FormBuilderValidators.required(),
                        decoration: const InputDecoration(
                          prefixText: "Kg. ",
                          labelText: "Quantity",
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      FormBuilderTextField(
                        initialValue: "0",
                        name: 'price',
                        onChanged: (value) {
                          formData.price = double.parse(value.toString());
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.number,
                        validator: FormBuilderValidators.required(),
                        decoration: const InputDecoration(
                          prefixText: "\$ ",
                          labelText: "Price",
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    child: const Text("Add Items"),
                    onPressed: () {
                      if (formData.description.isEmpty ||
                          formData.name.isEmpty) {
                        Utils.toast("Please complete the form");
                        return;
                      }
                      addItem(formData);
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: const Text("Fetch Items"),
                    onPressed: () {
                      getItems();
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            inventories.isEmpty
                ? const Text("No Item added yet")
                : Expanded(
                    child: ListView.builder(
                    itemCount: inventories.length,
                    itemBuilder: (context, index) {
                      // return Row(
                      //   // mainAxisAlignment: MainAxisAlignment.start,
                      //   // children: [
                      //   //   Text(
                      //   //     "${index + 1}-${items[index]}",
                      //   //     style: const TextStyle(
                      //   //       fontWeight: FontWeight.bold,
                      //   //       fontSize: 25,
                      //   //       color: Colors.blue,
                      //   //     ),
                      //   //   ),
                      //   //   const Spacer(),
                      //   //   InkWell(
                      //   //     onTap: () {
                      //   //       _showEditDialog(context, index);
                      //   //     },
                      //   //     child: const Icon(
                      //   //       Icons.edit,
                      //   //       color: Colors.black,
                      //   //     ),
                      //   //   ),
                      //   //   const SizedBox(
                      //   //     width: 5,
                      //   //   ),
                      //   //   InkWell(
                      //   //     onTap: () {
                      //   //       items.removeAt(index);
                      //   //       setState(() {});
                      //   //     },
                      //   //     child: const Icon(
                      //   //       Icons.delete,
                      //   //       color: Colors.red,
                      //   //     ),
                      //   //   ),
                      //   // ],
                      // );
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            inventories[index].name,
                          ),
                          Text(
                            inventories[index].description,
                          ),
                          Row(
                            children: [
                              Card(
                                child:
                                    Text(inventories[index].price.toString()),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Card(
                                child: Text(
                                  inventories[index].quantity.toString(),
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      formData.name = inventories[index].name;
                                      formData.description =
                                          inventories[index].description;
                                      formData.quantity =
                                          inventories[index].quantity;
                                      formData.price = inventories[index].price;
                                      formData.id = inventories[index].id;

                                      //_formKey.currentState!.reset();

                                      _formKey.currentState!.patchValue({
                                        "name": formData.name,
                                        "description": formData.description,
                                        "quantity":
                                            formData.quantity.toString(),
                                        "price": formData.price.toString(),
                                      });
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      String resp = await Inventory.delete_item(
                                          inventories[index].id);
                                      if (resp.isNotEmpty) {
                                        Utils.toast(resp, sucess: false);
                                        return;
                                      }
                                      Utils.toast("Item deleted successfully");
                                      getItems();
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.delete_forever,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                    },
                  )),
          ],
        ),
      ),
    );
  }

  // void _showEditDialog(BuildContext context, int index) {
  //   String editedItem = items[index];

  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         name: const Text('Edit Item'),
  //         content: FormBuilder(
  //           key: _editFormKey,
  //           child: FormBuilderTextField(
  //             name: 'editItem',
  //             initialValue: editedItem,
  //             onChanged: (value) {
  //               editedItem = value.toString();
  //             },
  //             autovalidateMode: AutovalidateMode.onUserInteraction,
  //             validator: FormBuilderValidators.required(),
  //             decoration: const InputDecoration(
  //               labelText: "Inventory item",
  //             ),
  //           ),
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: const Text('Cancel'),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               if (_editFormKey.currentState?.saveAndValidate() ?? false) {
  //                 setState(() {
  //                   items[index] = editedItem;
  //                 });
  //                 Navigator.of(context).pop();
  //               }
  //             },
  //             child: const Text('Save'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  void addItem(Inventory inventory) async {
    String resp = await Inventory.saveItem(inventory);
    getItems();
    if (resp.isNotEmpty) {
      Utils.toast("Failed to save Item because $resp", sucess: false);
      return;
    }
    formData = Inventory();
    formData.description = '';
    formData.name = '';
    formData.price = 0;
    formData.quantity = 0;
    formData.id = 0;
    Utils.toast("Item saved Successfully");
    _formKey.currentState!.reset();
  }

  void getItems() async {
    List<Inventory> fetchedinventories = await Inventory.get_items();
    setState(() {
      inventories = fetchedinventories;
    });
  }
}

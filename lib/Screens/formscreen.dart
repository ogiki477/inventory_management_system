import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _editFormKey = GlobalKey<FormBuilderState>();

  String single_item = "";

  List<String> items = [
    'Electronics',
    'Groceries',
    'Home Appliances',
    'Clothing',
  ];

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
                  child: FormBuilderTextField(
                    name: 'Item 1',
                    onChanged: (value) {
                      single_item = value.toString();
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.required(),
                    decoration: const InputDecoration(
                      labelText: "Inventory item 1",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
            MaterialButton(
              color: Colors.green,
              textColor: Colors.white,
              child: const Text("Add Items"),
              onPressed: () {
                if (single_item.isEmpty) {
                  return;
                }
                items.add(single_item);
                single_item = "";
                _formKey.currentState!.reset();
                setState(() {});
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${index + 1}-${items[index]}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.blue,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        _showEditDialog(context, index);
                      },
                      child: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        items.removeAt(index);
                        setState(() {});
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
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

  void _showEditDialog(BuildContext context, int index) {
    String editedItem = items[index];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Item'),
          content: FormBuilder(
            key: _editFormKey,
            child: FormBuilderTextField(
              name: 'editItem',
              initialValue: editedItem,
              onChanged: (value) {
                editedItem = value.toString();
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: FormBuilderValidators.required(),
              decoration: const InputDecoration(
                labelText: "Inventory item",
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_editFormKey.currentState?.saveAndValidate() ?? false) {
                  setState(() {
                    items[index] = editedItem;
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

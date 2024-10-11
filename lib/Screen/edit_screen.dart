import 'package:account/main.dart';
import 'package:account/model/transaction.dart';
import 'package:account/provider/transaction_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  Transactions statement;

  EditScreen({super.key, required this.statement});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final formKey = GlobalKey<FormState>();

  final campnameController = TextEditingController();

  final seriesController= TextEditingController();
  final nameController= TextEditingController();
  final cost = TextEditingController();
  final image = TextEditingController();

  @override
  Widget build(BuildContext context) {
    campnameController.text = widget.statement.Camp_name;
    seriesController.text = widget.statement.Series;
    nameController.text = widget.statement.Name;
    cost.text = widget.statement.amount.toString();
    return Scaffold(
        appBar: AppBar(
          title: const Text('แก้ไขข้อมูล'),
        ),
        body: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ชื่อค่าย',
                  ),
                  autofocus: false,
                  controller: campnameController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ชื่อซีรี่ย์',
                  ),
                  autofocus: false,
                  controller: seriesController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                 TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ชื่อโมเดล',
                  ),
                  autofocus: false,
                  controller: nameController,
                  validator: (String? str) {
                    if (str!.isEmpty) {
                      return 'กรุณากรอกข้อมูล';
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'ราคา',
                  ),
                  keyboardType: TextInputType.number,
                  controller: cost,
                  validator: (String? input) {
                    try {
                      double amount = double.parse(input!);
                      if (amount < 0) {
                        return 'กรุณากรอกข้อมูลมากกว่า 0';
                      }
                    } catch (e) {
                      return 'กรุณากรอกข้อมูลเป็นตัวเลข';
                    }
                  },
                ),
                TextButton(
                    child: const Text('แก้ไขข้อมูล'),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // create transaction data object
                        var statement = Transactions(
                            keyID: widget.statement.keyID,
                            Camp_name: campnameController.text,
                            Series: seriesController.text,
                            Name: nameController.text,
                            amount: double.parse(cost.text),
                            date: DateTime.now());

                        // add transaction data object to provider
                        var provider = Provider.of<TransactionProvider>(context,
                            listen: false);

                        provider.updateTransaction(statement);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) {
                                  return const MyHomePage();
                                }));
                      }
                    })
              ],
            )));
  }
}

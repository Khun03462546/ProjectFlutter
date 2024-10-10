
import 'package:account/provider/transaction_provider.dart';
import 'package:account/screen/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text(
            "Mr.Art Toy",
            style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          ],
        ),
        body: Consumer(
          builder: (context, TransactionProvider provider, Widget? child) {
            if (provider.transactions.isEmpty) {
              return const Center(
                child: Text('ไม่มีข้อมูลโมเดล'),
              );
            } else {
              return ListView.builder(
                itemCount: provider.transactions.length,
                itemBuilder: (context, index) {
                  var statement = provider.transactions[index];
                  return Card(
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    color: const Color.fromARGB(255, 177, 141, 128),
                    child: ListTile(
                      title: Text(
                        'Character:${statement.Camp_name}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Serise:${statement.Series}',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Name:${statement.Name}',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Cost:${statement.amount}',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            DateFormat('dd MMM yyyy \nhh:mm:ss')
                                .format(statement.date),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      leading: Container(
                        width: 80,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: NetworkImage('https://img.lovepik.com/free-png/20210928/lovepik-lovely-mengmeng-steamed-stuffed-stuffed-stuffed-png-image_401059244_wh1200.png'),
                                fit: BoxFit.cover)),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          provider.deleteTransaction(statement.keyID);
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return EditScreen(statement: statement);
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }
          },
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

import 'package:expense_tracke_r/page1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var details;

  Future<dynamic>? getData() {
    details = Constants.expense;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: Constants.expense.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.cyan,
                        child: Container(
                          height: 80,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 115, top: 15),
                                child: Row(
                                  children: [
                                    Text(
                                      'Amount : ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        'Rs ${Constants.expense[index]['Amount']}'),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.only(left: 115),
                                child: Row(
                                  children: [
                                    Text(
                                      'Purpose : ',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(Constants.expense[index]['purpose']),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  SizedBox(
                    width:250 ,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 180),
                      child: Text('Add new',style: TextStyle(fontSize: 16,color: Colors.teal)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Mainpage();
                          },
                        ));
                      },
                      child: Icon(Icons.add),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

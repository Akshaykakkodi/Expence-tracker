import 'package:expense_tracke_r/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'constants.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  Color c1 = Colors.blue;
  Color c2 = Colors.blue;
  bool press1 = false;
  bool press2 = false;

  pressed1() {
    press1 = true;
    if (press1 == true) {
      setState(() {
        c1 = Colors.green;
      });
    }
  }

  pressed2() {
    press2 = true;
    if (press2 == true) {
      setState(() {
        c2 = Colors.red;
      });
    }
  }

  var fkey = GlobalKey<FormState>();
  TextEditingController amount = TextEditingController();

  TextEditingController purpose = TextEditingController();

  saveData() {
    Constants.expense.add({'Amount': amount.text, 'purpose': purpose.text});
    print(Constants.expense);

    // SharedPreferences spref=await SharedPreferences.getInstance();
    // spref.setString('amount', amount.text);
    // spref.setString('purpose', purpose.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: fkey,
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: amount,

                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'Empty';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Enter amount',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        pressed1();
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                            color: c1,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Center(
                            child: Text(
                          'Credit',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        pressed2();
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                            color: c2,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Center(
                            child: Text(
                          'Debit',
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        )),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: purpose,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'required';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Purpose',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: FloatingActionButton(
                      onPressed: () async {
                        await saveData();
                        if (fkey.currentState!.validate()) {
                          Fluttertoast.showToast(msg: 'successfull');
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return Home();
                            },
                          ));
                        }
                      },
                      child: Icon(Icons.done_outlined),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

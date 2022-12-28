import 'package:expense_tracke_r/page1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var amnt;
  var purpse;


  Future<dynamic>getData() async {
    SharedPreferences spref =await SharedPreferences.getInstance();
    amnt= spref.getString('amount');
    purpse= spref.getString('purpose');


    return amnt;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: ListView(

            children: [
              FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      child: Center(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text('Amount : ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('Rs $amnt',style: TextStyle(fontSize: 15)),
                                ),
                              ],
                            ),
                            Row(
                              children: [

                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text('Purpose : ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(purpse,style: TextStyle(fontSize: 15),),
                                )
                              ],
                            ),

                          ],
                        ),
                      ),

                    ),
                  );

                }else {return Text('No data');}
              },),
              SizedBox(height: 500,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: FloatingActionButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Mainpage();
                        },));
                    },child: Icon(Icons.add),),
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

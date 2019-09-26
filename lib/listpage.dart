import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class listpage extends StatefulWidget {
  @override
  _listpageState createState() => _listpageState();
}

class _listpageState extends State<listpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("Far From Home"),
        ),
        body: StreamBuilder(
            stream: Firestore.instance.collection('House').snapshots(),
            builder: (context, snapshot) {
              return (snapshot.connectionState == null )
                  ? new Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      child: ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot docsSnap =
                              snapshot.data.documents[index];
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image.network(
                                  '${docsSnap['houseImages'][0]}',
                                  fit: BoxFit.fill
                                ),
                                elevation: 5,
                              ),
                              /*SizedBox(
                                height: 10.0,
                              ),*/
                            ListTile(
                              leading: Text('${docsSnap['Address']['address']}'),
                              trailing: Text('${docsSnap['Address']['address']}'),
                            )

                            ],

                            /*emanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.network(
                                '${docsSnap['houseImages'][0]}',
                                fit: BoxFit.fill

                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10.0),*/
                            /*child: Container(

                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: <Widget>[
                                  Image.network(
                                    '${docsSnap['houseImages'][0]}',
                                    fit: BoxFit.

                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  /*Text(
                                    '${docsSnap['Address']['address']}'
                                  )*/
                                ],
                              ),
                            )*/

                          );
                        },
                      ),
                    );
            }));
  }
}

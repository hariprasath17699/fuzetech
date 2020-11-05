import 'dart:ui';



import 'package:cake_app/Constants/route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Homepage extends StatefulWidget {
 
  static final routeName = '/details';

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
 
  User user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context,
        designSize: Size(2280, 1080), allowFontScaling: true);
    return WillPopScope(
      onWillPop: () async=> false,
      child: SafeArea(
        child: StreamBuilder<DocumentSnapshot>(

          stream: FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else {
              // ignore: unused_local_variable
              DocumentSnapshot userdata = snapshot.data;
            
              return Scaffold(
                 
                  appBar: AppBar(
                    title: Text(("USER")),

                    centerTitle: true,
                   
                  ),
                  drawer: Drawer(
                    child: Column(
                      children: [
                        DrawerHeader(
                          child: Placeholder(),
                        ),
                       
                     
                        ListTile(
                          title: Text("Sign Out"),
                          onTap: () {
                            Navigator.pop(context);
                            FirebaseAuth.instance.signOut().then((value) =>
                                Navigator.pushReplacementNamed(
                                    context, RouteNames.loginScreen));
                          },
                        ),
                      ],
                    ),
                  ),
                  body: CakeListPage()
              );
            }
          }
        )
      ),
    );
  }

  void goToNextPage(BuildContext context) {}

 
}
class CakeListPage extends StatefulWidget {
  @override
  _CakeListPageState createState() => _CakeListPageState();
}

class _CakeListPageState extends State<CakeListPage> with SingleTickerProviderStateMixin {

  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    CollectionReference cakes = FirebaseFirestore.instance.collection("users").doc(user.uid).collection("cakes");
    return  SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: StreamBuilder(
          stream: cakes.snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }
            if (snapshot.connectionState ==
                ConnectionState.waiting) {
              return Text("Loading");
            }
            else {
              return GridView.count(
                physics: ClampingScrollPhysics(),
                crossAxisCount: 2 ,
                shrinkWrap: true,
                // ignore: deprecated_member_use
                children: snapshot.data.documents.map((
                    DocumentSnapshot document) {
                  return Card(
                      elevation: 5,
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RouteNames.details);
                          },
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      child: Image.network(document.data()["Img"],
                                        width: 120.0,
                                        height: 120.0,),

                                    )
                                ),

                                 ListTile(
                                    title: Center(child: Text(document.data()["Cake_Name"],style:TextStyle(fontSize: 20.0))),
                                    dense:true,
                                  trailing:SizedBox(
                                          height: 15,
                                          width: 15,
                                         
                                        )
                                    ),
                                         
                                        
                                    
                              ]
                          )
                      )
                  );
                }).toList(),
              );
            }
          }
      ),

    );
  }

}

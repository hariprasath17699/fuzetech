import 'package:cake_app/Constants/route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';



class DetailsScreen extends StatefulWidget {

  static final routeName = '/addCakes';
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  final _addUserScreenFormKey = GlobalKey<FormState>();
  String id;
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _priceCtrl = TextEditingController();
 

  final firestoreInstance = FirebaseFirestore.instance;

  get databaseReference => firestoreInstance.collection('users');

  @override
  Widget build(BuildContext context) {
    
    ScreenUtil.init(context,
        designSize: Size(2280, 1080), allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
      elevation: 0,
            title: Text('ORDER'),
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: (){
          Navigator.pushNamed(context, RouteNames.home);
        },
           
  
       
        
        ),
      ),
    
  
 
   
      body: SafeArea(
         child: StreamBuilder<DocumentSnapshot>(

          stream: FirebaseFirestore.instance.collection('cakes').doc(user.uid).snapshots(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else{
                 DocumentSnapshot userdata = snapshot.data;
              String cakename = userdata.get("Cake_Name");

               child: Text(snapshot.data.id[cakename],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      ));
   
            }
       
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _addUserScreenFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildName(),
                  buildPrice(),
           
                  buildSubmitButton(context),
                ],
              ),
            ),
          ),
        );
          }
      ),
          
      )
    );
  }
 
  Padding buildSubmitButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: Alignment.bottomRight,
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          child: Text(
            "BUY NOW",
            
            style: TextStyle(color: Colors.white),
          ),
          
          onPressed: () {
            FocusScope.of(context).unfocus();
            createOrders();
                  
              
              
              }
        )
      )
    );
          }

  
  
  User user = FirebaseAuth.instance.currentUser;
  displayuser()
  {
    void getData() {
  databaseReference
      .collection("cakes")
         .getDocuments(user.uid)
      .then((QuerySnapshot snapshot) {
    snapshot.docs.forEach((f) => print('${f.data}}'));
  });
}
  }
  createOrders() {
    FirebaseStorage.instance;
    
    
        FirebaseFirestore.instance
        
            .collection('orders')
            .add({
          'Kg': _priceCtrl.text,
          'Occation': _nameCtrl.text,
        }
        );
        

      }
      
    
  
  Padding buildName() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _nameCtrl,
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter the OCCATIONS please';
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: 'Occations',
          hintText: 'Notes to be written on cake',
        ),
      ),
    );
  }
  Padding buildPrice() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _priceCtrl,
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter the KG';
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: 'kg',
        ),
      ),
    );
  }



}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_click_clearer/persentation/resources/strings_manager.dart';

import '../../data/auth/auth_service.dart';
import '../resources/assets_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/values_manager.dart';
import '../widgets/app_text_form_filed.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  final FirebaseAuthService _auth = FirebaseAuthService();
  final  _store = FirebaseFirestore.instance;


  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  // final idController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  //final birthDayController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();

  final userTypeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: Image(image: const AssetImage(ImageAssets.MainBg),height: MediaQuery.of(context).size.height,fit: BoxFit.fill,)),

                  ),


                   Container(
                     margin: const EdgeInsets.only(top: 40),
                    child: Center(

                      child: Text(AppStrings.newAccount,
                      style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40,),

                  Container(
                      margin: const EdgeInsets.only(top: 100),
                      child:  Column(

                        children: [


                          Padding(padding: EdgeInsets.all(AppPadding.p8),
                              child: AppTextFormFiled(

                                controller: firstNameController,
                                hintText: "First Name",
                              )
                          ),




                          Padding(padding: EdgeInsets.all(AppPadding.p8),
                            child: AppTextFormFiled(

                              controller: lastNameController,
                              hintText: "Last Name",
                            ),),



                          Padding(padding: EdgeInsets.all(AppPadding.p8),
                              child: AppTextFormFiled(

                                controller: addressController,
                                hintText: "Address",
                              )),


                          Padding(padding: EdgeInsets.all(AppPadding.p8),
                            child: AppTextFormFiled(

                              controller: phoneController,
                              hintText:"Phone Number",
                            ),),




                          Padding(padding: EdgeInsets.all(AppPadding.p8),
                              child: AppTextFormFiled(
                                iconData: Icons.email_outlined,
                                controller: emailController,
                                hintText: "E-mail",
                              )),



                          Padding(padding: EdgeInsets.all(AppPadding.p8),
                            child: AppTextFormFiled(
                              obscureText: true,
                              suffixIcon: true,
                              iconData: Icons.lock,
                              controller: passwordController,
                              hintText: "Password",
                            ),),



                          Padding(padding: const EdgeInsets.all(AppPadding.p8),
                              child: ElevatedButton(
                                style: Theme.of(context).elevatedButtonTheme.style,
                                onPressed: (){
                                  _signup();
                                },
                                child: const Text("Sign Up"),


                              )

                          ),

                          const Positioned(
                             // top: 10.0,
                              left: 50.0, // Position from the left
                              right: 50.0,

                              child: Center(
                                child: Image(image: AssetImage(ImageAssets.logo),height: 300,width: 300,

                                ),
                              )),


                        ],
                      )
                  ),


                ],
              )




            ],
          ),
        ),
      ),

    );
  }


  void _signup() async{
    String firstName = firstNameController.text;
    String lastName= lastNameController.text;
    // String idNumber = idController.text;
    String phone = phoneController.text;
    String email = emailController.text;
    //String birthday = birthDayController.text;
    String password = passwordController.text;
    String address = addressController.text;
    String userType = userTypeController.text;
    User? user = await _auth.signupWithEmailAndPassword(email, password);





    if(user!= null){
      print("User is successfully created");
      await _store.collection("Users")
          .doc(user.uid.toString())
          .set({

        "email":email,
        "password":password,
        "fullName":firstName + lastName,

        "address":address,

        "phoneNumber":phone,

        "role":userType,
        "username":user.uid.toString()


      });



      Navigator.pushReplacementNamed(context, Routes.mainRoute);



    }else{
      _displayDialog('Registration failed. Please try again.');
    }



  }




  void _displayDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registration Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

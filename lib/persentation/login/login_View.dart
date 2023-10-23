

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:one_click_clearer/persentation/resources/values_manager.dart';

import '../../data/auth/auth_service.dart';
import '../resources/assets_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../widgets/app_text_form_filed.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override

  final FirebaseAuthService _auth = FirebaseAuthService();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();

  
  Widget build(BuildContext context) {
    return  Scaffold(

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
                   margin: const EdgeInsets.only(top: 10),
                   child:  Column(

                     children: [
                       const Positioned(
                           top: 10.0,
                           left: 50.0, // Position from the left
                           right: 50.0,

                           child: Center(
                             child: Image(image: AssetImage(ImageAssets.logo),height: 500,width: 500,

                             ),
                           )),

                       Container(padding: const EdgeInsets.all(AppPadding.p8),
                           child: AppTextFormFiled(
                             iconData: Icons.email_outlined,
                             controller: emailController,
                             hintText: "E-mail",
                           )),

                       Container(padding: const EdgeInsets.all(AppPadding.p8),
                         child: AppTextFormFiled(
                           obscureText: true,
                           suffixIcon: true,
                           iconData: Icons.lock,
                           controller: passwordController,
                           hintText: "Password",
                         ),),


                       Padding(padding: EdgeInsets.all(AppPadding.p8),
                           child: ElevatedButton(
                             style: Theme.of(context).elevatedButtonTheme.style,
                             onPressed: (){
                               _signin();
                             },
                             child: const Text("Login"),


                           )

                       ),

                       //const SizedBox(height: 100,),

                       const SizedBox(
                       child: Text("Don't have account yet ?"),
                       ),

                       Padding(padding: const EdgeInsets.all(AppPadding.p8),
                           child: ElevatedButton(
                          style: Theme.of(context).elevatedButtonTheme.style,
                             onPressed: (){
                               Navigator.pushReplacementNamed(context, Routes.registerRoute);
                             },
                             child: const Text("Sign Up"),


                           )

                       ),




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


  void _signin() async{

    String email = emailController.text;
    //String birthday = birthDayController.text;
    String password = passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);


    //Navigator.pushReplacementNamed(context, Routes.mainRoute);


    if(user!= null){
      print("User is successfully login");




      Navigator.pushReplacementNamed(context, Routes.mainRoute);



    }else{
      _displayDialog('كلمة المرور او اسم المستخدم خطآ.');
    }



  }





  void _displayDialog(String message) {
    showDialog(
      context: context,
      builder: ( context) {
        return AlertDialog(
          title: const Text('خطآ',
            textAlign: TextAlign.center,

          ),
          content: Text(message,
            textAlign: TextAlign.center,),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('موافق'),
            ),
          ],
        );
      },
    );
  }
}

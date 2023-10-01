

import 'package:flutter/material.dart';
import 'package:one_click_clearer/persentation/resources/values_manager.dart';

import '../resources/assets_manager.dart';
import '../resources/routes_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SingleChildScrollView(
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

                     const Padding(padding: EdgeInsets.all(AppPadding.p8),
                       child: TextField(
                         decoration: InputDecoration(
                           hintText: 'Username',
                         ),
                       ),

                     ),
                     const Padding(padding: EdgeInsets.all(AppPadding.p8),
                       child: TextField(
                         obscureText: true,
                         decoration: InputDecoration(
                           hintText: 'Password',
                         ),

                     )),

                     Padding(padding: EdgeInsets.all(AppPadding.p8),
                         child: ElevatedButton(
                           style: Theme.of(context).elevatedButtonTheme.style,
                           onPressed: (){

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

    );
  }
}

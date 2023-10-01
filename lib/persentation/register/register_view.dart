import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_click_clearer/persentation/resources/strings_manager.dart';

import '../resources/assets_manager.dart';
import '../resources/values_manager.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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


                        const Padding(padding: EdgeInsets.all(AppPadding.p8),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: AppStrings.firstName,
                            ),
                          ),

                        ),
                        const Padding(padding: EdgeInsets.all(AppPadding.p8),
                            child: TextField(

                              decoration: InputDecoration(
                                hintText:AppStrings.lastName,
                              ),

                            )),

                        const Padding(padding: EdgeInsets.all(AppPadding.p8),
                            child: TextField(

                              decoration: InputDecoration(
                                hintText:AppStrings.email,
                              ),

                            )),

                        const Padding(padding: EdgeInsets.all(AppPadding.p8),
                            child: TextField(

                              decoration: InputDecoration(
                                hintText:AppStrings.phone,
                              ),

                            )),


                        const Padding(padding: EdgeInsets.all(AppPadding.p8),
                            child: TextField(

                              decoration: InputDecoration(
                                hintText:AppStrings.password,
                              ),

                            )),

                        const Padding(padding: EdgeInsets.all(AppPadding.p8),
                            child: TextField(

                              decoration: InputDecoration(
                                hintText:AppStrings.confirmPassword,
                              ),

                            )),
                        //const SizedBox(height: 100,),
                        const Padding(padding: EdgeInsets.all(AppPadding.p8),
                            child: TextField(

                              decoration: InputDecoration(
                                hintText:AppStrings.accountType,
                              ),

                            )),


                        Padding(padding: const EdgeInsets.all(AppPadding.p8),
                            child: ElevatedButton(
                              style: Theme.of(context).elevatedButtonTheme.style,
                              onPressed: (){
                               // Navigator.pushReplacementNamed(context, Routes.registerRoute);
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

    );
  }
}

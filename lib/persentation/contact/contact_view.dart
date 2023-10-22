import 'package:flutter/services.dart';
import 'package:one_click_clearer/persentation/resources/assets_manager.dart';
import 'package:one_click_clearer/persentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';



class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: ColorManager.primary,),
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.mainRoute);// Navigate back to the previous screen
          },
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.darkGrey,
            statusBarBrightness: Brightness.light
        ),

        elevation: 0.0,
        title: Center(child: Text("Contact Us",style: Theme.of(context).textTheme.titleLarge,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Container(
               margin: const EdgeInsets.only(top: 10),
              child: Center(child: Image(image: AssetImage(ImageAssets.contactHeader),
                height: 100,
                width: 100,

              )),
            ),

            Text("Countact Us",style: Theme.of(context).textTheme.titleLarge),


            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MemoInput(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(3,0,3,0),
              child: Center(
                child: SizedBox(width: 350,height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      //pageController.animateToPage(getNextIndex, duration: const Duration(microseconds: AppConstants.splashDelay), curve: Curves.bounceInOut);

                    },


                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: const Text("Send"),

                  ),
                ),
              ),
            ),
            Text(" Info",style: Theme.of(context).textTheme.titleLarge),

            Text("Phone: ",style: Theme.of(context).textTheme.titleLarge),
            Text("92003060",style: Theme.of(context).textTheme.titleLarge),


            Text("E-mail:",style: Theme.of(context).textTheme.titleLarge),
            Text("serivce@gmail.com",style: Theme.of(context).textTheme.titleLarge),


          ],



        ),
      ),



    );
  }
}


class MemoInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 10, // Set the maximum lines to control the height
      decoration: InputDecoration(
        hintText: 'Write Here.........',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.all(16.0), // Adjust padding as needed
      ),
    );
  }
}
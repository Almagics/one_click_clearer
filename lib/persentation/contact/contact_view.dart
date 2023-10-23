import 'package:flutter/services.dart';
import 'package:one_click_clearer/data/feedback/feedback_service.dart';
import 'package:one_click_clearer/persentation/resources/assets_manager.dart';
import 'package:one_click_clearer/persentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/values_manager.dart';
import '../widgets/app_text_form_filed.dart';



class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {

  final FeedBackService _feedback = FeedBackService();

  final supjectController = TextEditingController();
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
        child: Form(
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


              Padding(padding: EdgeInsets.all(AppPadding.p8),
                  child: AppTextFormFiled(

                    controller: supjectController,
                    hintText: "Write Here",
                    maxLength: 8,
                  )),

              Padding(
                padding: const EdgeInsets.fromLTRB(3,0,3,0),
                child: Center(
                  child: SizedBox(width: 350,height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        _addfeed();
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
      ),



    );
  }

  void _addfeed() async{
    String supject = supjectController.text;






   bool? insert =  await _feedback.NewFeedBack(supject);








      _displayDialog('Note had been sent');




  }




  void _displayDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Done'),
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




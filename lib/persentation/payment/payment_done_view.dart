import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_click_clearer/persentation/Main/main_view.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../widgets/app_button.dart';



class PaymentDone extends StatelessWidget {
  const PaymentDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
        title: Center(child: Text("Done",style: Theme.of(context).textTheme.titleLarge,)),
      ),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Center(child:
          Image(image: AssetImage(ImageAssets.paymentdone),height: 350,width: 350,

          ),

            ),
          Center(child:
            Text("The amount has been paid successfully",style: Theme.of(context).textTheme.titleLarge,)

            ,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppButton(
                onPressed: () {


                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => MainView()));
                  },

                text: 'Back To Home' ),
          ),

        ],
      ),
    );
  }
}

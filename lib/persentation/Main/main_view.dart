import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_click_clearer/persentation/contact/contact_view.dart';
import 'package:one_click_clearer/persentation/orders/order_list_view.dart';
import 'package:one_click_clearer/persentation/payment/payment_list.dart';
import 'package:one_click_clearer/persentation/profile/profile_view.dart';
import 'package:one_click_clearer/persentation/providers/providers_list_ivew.dart';
import 'package:one_click_clearer/persentation/resources/color_manager.dart';
import 'package:one_click_clearer/persentation/resources/strings_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../resources/assets_manager.dart';
import '../resources/routes_manager.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final String phoneNumber = '1234567890';
  void _makePhoneCall() async {
    final Uri phoneLaunchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunch(phoneLaunchUri.toString())) {
      await launch(phoneLaunchUri.toString());
    } else {
      throw 'Could not launch the phone dialer.';
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(


      body: SingleChildScrollView(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: Image(image: const AssetImage(ImageAssets.MainBg),height: MediaQuery.of(context).size.height,fit: BoxFit.fill,)),

                ),

                Container(
                  margin: const EdgeInsets.only(top: 40,right: 8.0,left: 8.0),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      
                      GestureDetector(
                          onTap: (){

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => Profile()));


                          },
                          child: Icon(Icons.account_circle,color: ColorManager.primary,size: 50.0,)),
                      const SizedBox(width: 10.0,),

                      GestureDetector(
                          onTap: _makePhoneCall,
                          child: Icon(Icons.call,color: ColorManager.primary,size: 50.0,)),
                      
                    ],
                    
                  )
                ),
                

                
                Container(
                    margin: const EdgeInsets.only(top: 100),
                    child:   Column(
                      //mainAxisAlignment: MainAxisAlignment.center,

                      children: [

             const SizedBox(height: 70,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          GestureDetector(
                            onTap: (){

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => ProviderList(ordertype:"laundry")));


                            },
                            child: SizedBox(width: MediaQuery.of(context).size.width * 0.315,
                              child: Column(
                                children: [const Image(image: AssetImage(ImageAssets.laundry),height: 100,width: 130,

                                ),
                                Center(child: Text(AppStrings.Laundry,style: Theme.of(context).textTheme.displayLarge,))

                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => OrderListView()));

                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.315,
                              child: Column(
                                children: [const Image(image: AssetImage(ImageAssets.delivery),height: 100,width: 130,

                                ),
                                  Center(child: Text(AppStrings.Delivery,style: Theme.of(context).textTheme.displayLarge,))

                                ],
                              ),
                            ),
                          ),


                          GestureDetector(
                            onTap: (){

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => ProviderList(ordertype:"Ironing")));


                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.315,
                              child: Column(
                                children: [const Image(image: AssetImage(ImageAssets. cleaing),height: 100,width: 130,

                                ),
                                  Center(child: Text(AppStrings.cleaning,style: Theme.of(context).textTheme.displayLarge,))

                                ],
                              ),
                            ),
                          ),

                        ],
                      ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            GestureDetector(
                              onTap: (){

                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => ContactView()));


                              },
                              child: SizedBox(width: MediaQuery.of(context).size.width * 0.315,
                                child: Column(
                                  children: [const Image(image: AssetImage(ImageAssets.customerservice),height: 100,width: 130,

                                  ),
                                    Center(child: Text(AppStrings.customerservie,style: Theme.of(context).textTheme.displayLarge,))

                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => PaymentList()));

                              },
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.315,
                                child: Column(
                                  children: [const Image(image: AssetImage(ImageAssets.payment),height: 100,width: 130,

                                  ),
                                    Center(child: Text(AppStrings.payment,style: Theme.of(context).textTheme.displayLarge,))

                                  ],
                                ),
                              ),
                            ),




                          ],
                        ),
                        

                       


                        

                      
                        //const SizedBox(height: 100,),
                        


                       

                        Positioned(
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_click_clearer/persentation/orders/order_laundry_view.dart';
import 'package:one_click_clearer/persentation/resources/assets_manager.dart';

import '../../data/providers/providerModel.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';



class ProviderList extends StatefulWidget {
  const ProviderList({super.key, required this.ordertype});
  final String ordertype;

  @override
  State<ProviderList> createState() => _ProviderListState();
}

class _ProviderListState extends State<ProviderList> {


  final List<ProviderModel> items = [

    ProviderModel(address: "rayadh", name: "cleainng house", price: 5, id: "store1", rate: 6.5, imgurl: ImageAssets.cleaing),
    ProviderModel(address: "rayadh", name: "clean master", price: 6, id: "store1", rate: 8.1, imgurl: ImageAssets.cleaing),
    ProviderModel(address: "rayadh", name: "clean way", price: 4, id: "store1", rate: 7.8, imgurl: ImageAssets.cleaing)


  ];



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
        title: Center(child: Text("Available service providers",style: Theme.of(context).textTheme.titleLarge,)),
      ),


      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CardWithImageAndText(item: items[index],ordertype: widget.ordertype,);
        },
      ),
    );
  }
}



class CardWithImageAndText extends StatelessWidget {
  final ProviderModel item;
  final String ordertype;

  CardWithImageAndText({required this.item, required this.ordertype});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Navigator.pushReplacement(
         context,
           MaterialPageRoute(
          builder: (ctx) => OrderLaundry(Price: item.price, id: 'dfdfdfdgh',ordertype:ordertype)));


      },
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          color: ColorManager.primary,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image at the top of the card, stretched to fill
              const Column(
                children: [
                  Image(image: AssetImage(ImageAssets.laundry),
                    height: 50,
                    width: 50,

                  )

                ],
              ),

              Column(
                children: [
                  Text(item.name),
                  Text(item.address)

                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [

                    Text('Price per Piece : ' + item.price.toString()),
                    Text('Rate : ' + item.rate.toString()),

                  ],
                ),
              ),

              // Text at the bottom of the card, centered with shadow

            ],
          ),
        ),
      ),
    );
  }
}
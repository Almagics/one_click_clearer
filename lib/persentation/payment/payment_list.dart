import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_click_clearer/data/paymentModel/paymentModel.dart';

import '../providers/providers_list_ivew.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';

class PaymentList extends StatefulWidget {
  const PaymentList({super.key});

  @override
  State<PaymentList> createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {


  final List<PaymentModel> items = [

   PaymentModel(holdername: "ahmed sayed", cardno: "435454656556", exp: "10/22", cvv: "123"),
    PaymentModel(holdername: "amr sayed", cardno: "4454656576767", exp: "12/22", cvv: "456")

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
        title: Center(child: Text("Payment Method",style: Theme.of(context).textTheme.titleLarge,)),
      ),


      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CardWithImageAndText(item: items[index]);
        },
      ),
    );
  }
}



class CardWithImageAndText extends StatelessWidget {
final PaymentModel item;

CardWithImageAndText({required this.item});

@override
Widget build(BuildContext context) {
  return Card(
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
           Column(
            children: [
              GestureDetector(
                  onTap: (){

                    //code here
                  },
                  child: Icon(Icons.delete,size: 50,color: Colors.red,))

            ],
          ),

          Column(
            children: [
              Text(item.holdername),
              Text(item.cardno)

            ],
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [

                Text('EXP. Date : ' + item.exp),
                Text('CVV : ' + item.cvv),

              ],
            ),
          ),

          // Text at the bottom of the card, centered with shadow

        ],
      ),
    ),
  );
}
}

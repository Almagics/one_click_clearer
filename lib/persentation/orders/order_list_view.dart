import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_click_clearer/data/orders/OrderModel.dart';

import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';


class OrderListView extends StatefulWidget {
  const OrderListView({super.key});

  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {


  final List<OrderModel> items = [

    OrderModel(customerName: "ahmed sayed", customerId: "fdfdgfgfg", providerName: "clean master", orderDate: "10/10/2023", orderAmount: "115", orderStatus: "Pending", orderType: "Laundry", countItems: "5", iconUrl: ""),
    OrderModel(customerName: "amr sayed", customerId: "53436", providerName: "clean master", orderDate: "12/10/2023", orderAmount: "105", orderStatus: "Pending", orderType: "Laundry", countItems: "3", iconUrl: ""),
    OrderModel(customerName: "ali ahmed", customerId: "454543", providerName: "clean master", orderDate: "15/10/2023", orderAmount: "25", orderStatus: "Pending", orderType: "Laundry", countItems: "3", iconUrl: ""),

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
        title: Center(child: Text("Order List",style: Theme.of(context).textTheme.titleLarge,)),
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
  final OrderModel item;

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
                    child: Icon(Icons.info,size: 50,color: Colors.grey,))

              ],
            ),

            Column(
              children: [
                Text(item.providerName),
                Text(item.orderDate)

              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [

                  Text('Amount : ' + item.orderAmount),
                  Text('Pieces : ' + item.countItems),

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

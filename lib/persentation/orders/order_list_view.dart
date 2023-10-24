import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_click_clearer/data/orders/OrderModel.dart';
import 'package:one_click_clearer/data/orders/order_service.dart';

import '../rate/rate_view.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';


class OrderListView extends StatefulWidget {
  const OrderListView({super.key});

  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
  final OrderService _orderService = OrderService();








  final List<OrderModel> items = [

    OrderModel(customerName: "ahmed sayed", customerId: "fdfdgfgfg", providerName: "clean master", orderDate: "10/10/2023", orderAmount: "115", orderStatus: "Pending", orderType: "Laundry", countItems: "5", cleanmode: '', recieving: '', recievingdate: '', ),
    OrderModel(customerName: "amr sayed", customerId: "53436", providerName: "clean master", orderDate: "12/10/2023", orderAmount: "105", orderStatus: "Pending", orderType: "Laundry", countItems: "3", cleanmode: '', recieving: '', recievingdate: '', ),
    OrderModel(customerName: "ali ahmed", customerId: "454543", providerName: "clean master", orderDate: "15/10/2023", orderAmount: "25", orderStatus: "Pending", orderType: "Laundry", countItems: "3", cleanmode: '', recieving: '', recievingdate: '', ),

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

      body: FutureBuilder<List<OrderModel>>(
        future: _orderService.OrderListData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final data = snapshot.data;

            // Display data in a ListView or other widget
            return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return CardWithImageAndText(item: data![index],);
              },
            );
          } else {
            return Text('No data found for');
          }
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
    return GestureDetector(

      onTap: (){

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (ctx) => RatingScreen()));
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
              Column(
                children: [
                  Icon(Icons.info,size: 50,color: Colors.grey,)

                ],
              ),

              Column(
                children: [
                  Text(item.providerName),
                  Text(item.recievingdate)

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
      ),
    );
  }
}





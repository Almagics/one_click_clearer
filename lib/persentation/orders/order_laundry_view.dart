import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_click_clearer/data/orders/order_service.dart';
import 'package:one_click_clearer/persentation/payment/payment_view.dart';
import 'package:one_click_clearer/persentation/resources/color_manager.dart';
import 'package:intl/intl.dart';
import '../../data/auth/auth_service.dart';
import '../resources/assets_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_form_filed.dart';


class OrderLaundry extends StatefulWidget {
  const OrderLaundry({super.key, required this.Price, required this.id, required this.ordertype});

  final int Price;
  final String id;
  final String ordertype;

  @override
  State<OrderLaundry> createState() => _OrderLaundryState();
}

class _OrderLaundryState extends State<OrderLaundry> {
  @override

  final OrderService _OrderService = OrderService();
  final FirebaseAuthService _auth = FirebaseAuthService();

  final countitemsController = TextEditingController();
  final totalpriceController = TextEditingController();
  final cleanmodeController = TextEditingController();
  final recievingController = TextEditingController();
  final recievingdateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    countitemsController.dispose();
    totalpriceController.dispose();
    cleanmodeController.dispose();
    recievingController.dispose();

    super.dispose();
  }

  _getDropDownDecoration({required hintText, required IconData icon}) {
    return InputDecoration(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0)));
  }


  void _updateTotalPrice() {
    setState(() {
      // Parse the quantity as a double
      double quantity = double.tryParse(countitemsController.text) ?? 0.0;

      // Calculate the total price
      double calculatedTotalPrice = quantity * widget.Price;

      // Update the total price text
      totalPrice = calculatedTotalPrice.toStringAsFixed(2);
    });
  }



  String totalPrice = '0.0'; // Initial total price
  @override
  void initState() {
    super.initState();
    countitemsController.addListener(_updateTotalPrice);
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
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
        title: Center(child: Text("Submit New Order",style: Theme.of(context).textTheme.titleLarge,)),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SafeArea(child: SizedBox.shrink()),

              Expanded(
                flex: 4,
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(24.0)),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppTextFormFiled(
                            iconData: Icons.calculate_outlined,
                            controller: countitemsController,
                            hintText: AppStrings.entercountitems,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),

                          StatefulBuilder(builder: (context, setStateBirthDay) {
                            return AppTextFormFiled(
                              readOnly: true,
                              onTap: () async {
                                final picker = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2040));
                                setStateBirthDay(() {
                                  recievingdateController.text =
                                      DateFormat.yMd().format(picker!);
                                });
                              },
                              iconData: Icons.cake_outlined,
                              controller: recievingdateController,
                              hintText: 'Enter Receiving Date',
                            );
                          }),

                          const SizedBox(
                            height: 20.0,
                          ),
                          DropdownButtonFormField(
                              validator: (value) {
                                if (value == null) {
                                  return 'Required*';
                                }
                              },
                              icon: const Icon(Icons.keyboard_arrow_down),
                              decoration: _getDropDownDecoration(
                                  hintText: 'Cleaning Mode', icon: Icons.wash),
                              items: ['Soft', 'Dry']
                                  .map((e) => DropdownMenuItem(
                                child: Text(e.toString()),
                                value: e.toString(),
                              ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  cleanmodeController.text = value!;
                                });

                              }),
                          const SizedBox(
                            height: 20.0,
                          ),
                          DropdownButtonFormField(
                              validator: (value) {
                                if (value == null) {
                                  return 'Required*';
                                }
                              },
                              icon: const Icon(Icons.keyboard_arrow_down),
                              decoration: _getDropDownDecoration(
                                  hintText: 'Receiving Mode', icon: Icons.local_shipping),
                              items: ['delivery', 'By Hand']
                                  .map((e) => DropdownMenuItem(
                                child: Text(e.toString()),
                                value: e.toString(),
                              ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  recievingController.text = value!;
                                });
                              }),
                          const SizedBox(
                            height: 20.0,
                          ),

                          const SizedBox(
                            height: 20.0,
                          ),
                         Center(child:
                           Text("Total Amount:$totalPrice"),


                           ),

                          const SizedBox(
                            height: 20.0,
                          ),

                          AppButton(
                              onPressed: () {

                                if (_formKey.currentState!.validate()) {
                                  _addorder();
                                }
                              },
                              text: 'Submit'),
                          const SizedBox(
                            height: 20.0,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );

  }


  void _addorder() async{

    final String? userEmail = await _auth.getCurrentUserUID();

    String countitems = countitemsController.text;
    String totalprice= totalPrice;
     String cleanmode = cleanmodeController.text;
    String recieving = recievingController.text;
    String recievingdate = recievingdateController.text;

    String useremail = userEmail.toString();
    String providerName = widget.id;
    String orderStatus = 'Under Review';

    String orderType= widget.ordertype;


   bool? createOrder = await _OrderService.NewOrder(
       "",
       useremail,
       providerName,
       providerName,
       totalprice,
       orderStatus,
       orderType,
       countitems,
       cleanmode,
       recieving,
       recievingdate);




      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (ctx) => PaymentView(price: totalprice)));













  }




  void _displayDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
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

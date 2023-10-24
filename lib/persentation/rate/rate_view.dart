import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';



class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _rating = 0;

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
        title: Center(child: Text("Rating",style: Theme.of(context).textTheme.titleLarge,)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemSize: 40,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.mainRoute);
                print('Submitted rating: $_rating');
              },
              child: Text('Submit Rating'),
            ),
          ],
        ),
      ),
    );
  }
}

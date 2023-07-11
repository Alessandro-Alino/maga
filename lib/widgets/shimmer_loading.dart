import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      height: 200.0,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade500,
        child: const Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                //Locations and Prices
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Regina Stock
                    Flexible(
                      child: Card(
                        color: Colors.amber,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                    //Tagliam. Stock
                    Flexible(
                      child: Card(
                        color: Color.fromARGB(255, 247, 242, 249),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [],
                          ),
                        ),
                      ),
                    ),
                    //Regular Price
                    Flexible(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('price 1'),
                        ),
                      ),
                    ),
                    //Sales Price
                    Flexible(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('price2'),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

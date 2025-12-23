import 'package:flutter/material.dart';
import 'package:projectq/models/showAllApartment_model.dart';

class Customcard extends StatelessWidget {
  final ApartmentModel apartment;
  Customcard({super.key, required this.apartment});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 60, color: Colors.grey, spreadRadius: 0),
            ],
          ),

          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Card(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Positioned(
                      child: Image.network(
                        apartment.photoOfTheApartment,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    Text(
                      "${apartment.title}",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$'
                          "${apartment.price}",
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(Icons.favorite, color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

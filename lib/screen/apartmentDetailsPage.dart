import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectq/cubit/theme_cubit.dart';

import 'package:projectq/models/showAllApartment_model.dart';

class Apartmentdetailspage extends StatelessWidget {
  // استقبال كائن المنتج من الصفحة السابقة
  final ApartmentModel apartment;

  const Apartmentdetailspage({super.key, required this.apartment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(apartment.title),
        actions: [
          Switch(
            // watch للاستماع إلى التغييرات وتحديث الواجهة
            value: context.watch<ThemeCubit>().state is DarkTheme,
            // read لاستدعاء دالة التبديل
            onChanged: (value) {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: apartment.photoOfTheApartment,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),

                height: 300,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Text(
                'رقم الشقة: #${apartment.id}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Chip(
                label: Text("${apartment.province} - ${apartment.city}"),
                backgroundColor: Colors.green.shade100,
                side: BorderSide(color: Colors.green.shade300),
                labelStyle: TextStyle(color: Colors.green.shade800),
              ),

              const SizedBox(height: 10),
              Text(
                apartment.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'المرافق العامة:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 6.0,
                runSpacing: 4.0,
                children: apartment.amenities.map((amenity) {
                  return Chip(
                    label: Text(amenity),
                    backgroundColor: Colors.green.shade100,
                    side: BorderSide(color: Colors.green.shade300),
                    labelStyle: TextStyle(color: Colors.green.shade800),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text(
                'أرقام الهاتف:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 6.0,
                runSpacing: 4.0,
                children: apartment.phones.map((phone) {
                  return Chip(
                    label: Text(phone),
                    backgroundColor: Colors.green.shade100,
                    side: BorderSide(color: Colors.green.shade300),
                    labelStyle: TextStyle(color: Colors.green.shade800),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'السعر:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Chip(
                label: Text("${apartment.price}"),
                backgroundColor: Colors.green.shade100,
                side: BorderSide(color: Colors.green.shade300),
                labelStyle: TextStyle(color: Colors.green.shade800),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

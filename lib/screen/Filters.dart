import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectq/cache/cache_helper.dart';
import 'package:projectq/core/api/end_ponits.dart';
import 'package:projectq/cubit/user_cubit.dart';
import 'package:projectq/generated/l10n.dart';
import 'package:projectq/screen/apartmentDetailsPage.dart';
import 'package:projectq/screen/home.dart';
import 'package:projectq/widget/classAmenty.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String? selectedProvince;
  String? selectedCity;
  String? selectedType;
  RangeValues priceRange = RangeValues(0, 20000);
  RangeValues priceRange2 = RangeValues(30, 500);

  late List<Amenity> provinces;
  late List<Amenity> cities;

  @override
  void initState() {
    super.initState();
  }

  bool x = true;
  @override
  void didChangeDependencies() {
    if (x) {
      cities = [
        Amenity(id: 1, name: S.of(context).damas),
        Amenity(id: 2, name: S.of(context).qanawat),
        Amenity(id: 3, name: S.of(context).medan),
        Amenity(id: 4, name: S.of(context).babTuma),
        Amenity(id: 5, name: S.of(context).sarojah),
        Amenity(id: 6, name: S.of(context).douma),
        Amenity(id: 7, name: S.of(context).AlTall),
        Amenity(id: 8, name: S.of(context).AlQutayfah),
        Amenity(id: 9, name: S.of(context).AleppoCity),
        Amenity(id: 10, name: S.of(context).Manbij),
        Amenity(id: 11, name: S.of(context).Azaz),
        Amenity(id: 12, name: S.of(context).IdlibCity),
        Amenity(id: 13, name: S.of(context).MaarratalNuuman),
        Amenity(id: 14, name: S.of(context).HomsCity),
        Amenity(id: 15, name: S.of(context).AlRastan),
        Amenity(id: 16, name: S.of(context).HamaCity),
        Amenity(id: 17, name: S.of(context).Masyaf),
        Amenity(id: 18, name: S.of(context).LatakiaCity),
        Amenity(id: 19, name: S.of(context).Jableh),
        Amenity(id: 20, name: S.of(context).TartusCity),
        Amenity(id: 21, name: S.of(context).Baniyas),
        Amenity(id: 22, name: S.of(context).DeirezZorCity),
        Amenity(id: 23, name: S.of(context).AlMayadin),
        Amenity(id: 24, name: S.of(context).RaqqaCity),
        Amenity(id: 25, name: S.of(context).AlThawrah),
      ];
      provinces = [
        Amenity(id: 1, name: S.of(context).Damascus),
        Amenity(id: 2, name: S.of(context).RifDimashq),
        Amenity(id: 3, name: S.of(context).Aleppo),
        Amenity(id: 4, name: S.of(context).Idlib),
        Amenity(id: 5, name: S.of(context).Homs),
        Amenity(id: 6, name: S.of(context).Hama),
        Amenity(id: 7, name: S.of(context).Latakia),
        Amenity(id: 8, name: S.of(context).Tartus),
        Amenity(id: 9, name: S.of(context).DeirezZor),
        Amenity(id: 10, name: S.of(context).Raqqa),
        Amenity(id: 11, name: S.of(context).AlHasakah),
        Amenity(id: 12, name: S.of(context).Daraa),
        Amenity(id: 13, name: S.of(context).AsSuwayda),
        Amenity(id: 14, name: S.of(context).Quneitra),
      ];
    }
    x = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).filterapr),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    Home(role: CacheHelper().getData(key: ApiKey.role)),
              ),
            );
          },
        ),
      ),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is FilterSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.apartments.message)));
          } else if (state is FilterFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
        },
        builder: (context, state) {
          if (state is FilterLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButtonFormField<int>(
                        decoration: InputDecoration(
                          labelText: S.of(context).province,
                        ),
                        items: provinces
                            .map(
                              (p) => DropdownMenuItem(
                                value: p.id,
                                child: Text(p.name),
                              ),
                            )
                            .toList(),
                        onChanged: (v) {
                          context.read<UserCubit>().setprovince(v!);
                        },
                      ),
                      const SizedBox(height: 15),
                      DropdownButtonFormField<int>(
                        decoration: InputDecoration(
                          labelText: S.of(context).city,
                        ),
                        items: cities
                            .map(
                              (c) => DropdownMenuItem(
                                value: c.id,
                                child: Text(c.name),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          context.read<UserCubit>().setcity(value!);
                        },
                      ),
                      const SizedBox(height: 20),
                      Text(
                        S.of(context).laprice,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RangeSlider(
                        values: priceRange,
                        min: 0,
                        max: 20000,
                        divisions: 100,
                        labels: RangeLabels(
                          "${priceRange.start.toInt()}",
                          "${priceRange.end.toInt()}",
                        ),
                        onChanged: (values) {
                          setState(() {
                            priceRange = values;
                          });
                          context.read<UserCubit>().setpric1(
                            priceRange.end.toDouble(),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      Text(
                        S.of(context).area,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RangeSlider(
                        values: priceRange2,
                        min: 30,
                        max: 500,
                        divisions: 100,
                        labels: RangeLabels(
                          "${priceRange2.start.toInt()}",
                          "${priceRange2.end.toInt()}",
                        ),
                        onChanged: (values) {
                          setState(() => priceRange2 = values);
                          context.read<UserCubit>().setArea(
                            priceRange2.end.toInt(),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          context.read<UserCubit>().Filters();
                          context.read<UserCubit>().area = null;
                          context.read<UserCubit>().price1 = null;
                          context.read<UserCubit>().province = null;
                          context.read<UserCubit>().city = null;
                        },
                        child: Text(S.of(context).searche),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: Size(double.infinity, 50),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (state is FilterLoading)
                SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              else if (state is FilterSuccess &&
                  state.apartments.data.isNotEmpty)
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return ApartmentCard(
                      apartment: state.apartments.data[index],
                    );
                  }, childCount: state.apartments.data.length),
                )
              else if (state is FilterSuccess && state.apartments.data.isEmpty)
                SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text(S.of(context).noApartment),
                    ),
                  ),
                )
              else if (state is FilterFailure)
                SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text("حدث خطأ: ${state.errMessage}"),
                    ),
                  ),
                )
              else
                SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text(S.of(context).ennter),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class ApartmentCard extends StatelessWidget {
  final dynamic apartment;

  const ApartmentCard({Key? key, required this.apartment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Apartmentdetailspage(apartment: apartment),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: CachedNetworkImage(
                imageUrl: apartment.images.isNotEmpty
                    ? apartment.images.first
                    : 'https://pic.i7lm.com/wp-content/uploads/2019/05/%D8%B5%D9%88%D8%B1-%D8%B4%D9%82%D9%82-%D9%81%D8%AE%D9%85%D8%A9-720x405.jpg',
                placeholder: (context, url) => Container(
                  height: 180,
                  child: Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) =>
                    Container(height: 180, child: Icon(Icons.error)),
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          apartment.title,
                          style: Theme.of(context).textTheme.headlineSmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Card(
                    color: Colors.green.shade50,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.paid,
                            color: Colors.green.shade700,
                            size: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            apartment.price,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey.shade600,
                        size: 20,
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${apartment.province} - ${apartment.city}',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Colors.grey.shade700),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

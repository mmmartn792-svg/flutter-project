import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectq/auth/login_screen.dart';
import 'package:projectq/cache/cache_helper.dart';
import 'package:projectq/core/api/end_ponits.dart';
import 'package:projectq/cubit/user_cubit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:projectq/generated/l10n.dart';
import 'package:projectq/screen/AddApartment.dart';
import 'package:projectq/screen/AllBookings.dart';
import 'package:projectq/screen/AllBookingsOwner.dart';
import 'package:projectq/screen/Filters.dart';
import 'package:projectq/screen/LanguageSelectorScreen.dart';
import 'package:projectq/screen/apartmentDetailsPage.dart';
import 'package:projectq/screen/favoritesApartment.dart';
import 'package:projectq/screen/notifications_page.dart';

class Home extends StatefulWidget {
  final String role;
  const Home({super.key, required this.role});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getAllapartment();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          CacheHelper().clearData(key: ApiKey.token);
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (Route<dynamic> route) => false,
          );
        } else if (state is signupFailuer) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
        if (state is GetAllApartmentFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
        if (state is GetAllApartmentSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(S.of(context).getApartment)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          drawer: Drawer(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        height: 90,
                        width: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(66),
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://picsum.photos/seed/apartment123/400/300.jpg",
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "${CacheHelper().getData(key: ApiKey.firstName) ?? ""} ${CacheHelper().getData(key: ApiKey.secondName) ?? ""}",
                          ),
                          subtitle: Text(
                            CacheHelper().getData(key: ApiKey.phone) ?? "0",
                          ),
                        ),
                      ),
                    ],
                  ),

                  ListTile(
                    leading: const Icon(Icons.home),
                    title: Text(S.of(context).homePage),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  ListTile(
                    leading: const Icon(Icons.favorite_outlined),
                    title: Text(S.of(context).favorites),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Favoritesapartment(),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.local_hotel),
                    title: Text(S.of(context).Bookings),
                    onTap: () {
                      if (CacheHelper().getData(key: ApiKey.role) == 'renter') {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MyBookingsPage(),
                          ),
                        );
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MyApartmentsPage(),
                          ),
                        );
                      }
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text(S.of(context).darkAndLang),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LanguageSelectorScreen(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: state is LogoutLoading
                        ? const CircularProgressIndicator()
                        : const Icon(Icons.exit_to_app),
                    title: Text(S.of(context).awesaTitle),
                    onTap: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.infoReverse,
                        animType: AnimType.rightSlide,
                        title: S.of(context).awesaTitle,
                        desc: S.of(context).awsdec,
                        btnCancelText: S.of(context).btnCancelText,
                        btnOkText: S.of(context).btnOkText,
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          context.read<UserCubit>().logout();
                        },
                      ).show();
                    },
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              if (widget.role == "owner") {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Addapartment()),
                );
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(S.of(context).masenger)));
              }
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            title: Text(S.of(context).homePage),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => FilterPage()));
                },
                icon: const Icon(Icons.search, size: 35),
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NotificationsPage(),
                    ),
                  );
                },
              ),
            ],
          ),
          body: state is GetAllApartmentLoading
              ? const Center(child: CircularProgressIndicator())
              : state is GetAllApartmentSuccess
              ? ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  itemCount: state.apartments.length,
                  itemBuilder: (context, index) {
                    final apartment = state.apartments[index];

                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                Apartmentdetailspage(apartment: apartment),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: apartment.images.length == 0
                                    ? "https://picsum.photos/seed/apartment123/400/300.jpg"
                                    : apartment.images.first,
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) {
                                  print("Failed to load image: $error");
                                  return Icon(Icons.error, color: Colors.red);
                                },

                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            //
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          apartment.title,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.headlineSmall,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.favorite_border),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
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
                                          const SizedBox(width: 8),
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
                                  const SizedBox(height: 12),
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: Colors.grey.shade700,
                                              ),
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
                  },
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 80,
                        color: Colors.red.shade400,
                      ),
                      const SizedBox(height: 16),
                      Text(S.of(context).noApartment),

                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () =>
                            context.read<UserCubit>().getAllapartment(),
                        child: Text(S.of(context).refresh),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

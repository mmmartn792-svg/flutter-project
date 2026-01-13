import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectq/cubit/user_cubit.dart';
import 'package:projectq/generated/l10n.dart';
import 'package:projectq/screen/apartmentDetailsPage.dart';

class Favoritesapartment extends StatefulWidget {
  const Favoritesapartment({super.key});

  @override
  State<Favoritesapartment> createState() => _FavoritesapartmentState();
}

class _FavoritesapartmentState extends State<Favoritesapartment> {
  @override
  void initState() {
    context.read<UserCubit>().getAllfavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(S.of(context).favorites)),
          body: state is GetAllFavoritesLoading
              ? const Center(child: CircularProgressIndicator())
              : state is GetAllFavoritestSuccess
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
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: apartment.images.first,
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
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
                            context.read<UserCubit>().getAllfavorites(),
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

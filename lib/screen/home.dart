import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectq/auth/login_screen.dart';
import 'package:projectq/cache/cache_helper.dart';
import 'package:projectq/core/api/end_ponits.dart';
import 'package:projectq/cubit/user_cubit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:projectq/generated/l10n.dart';
import 'package:projectq/screen/AddApartment.dart';
import 'package:projectq/screen/apartmentDetailsPage.dart';
import 'package:projectq/screen/chaneglan.dart';

class Home extends StatefulWidget {
  final String role;
  const Home({super.key, required this.role});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  initState() {
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

          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => LoginScreen()));
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
              padding: EdgeInsets.all(15),

              child: Column(
                children: [
                  SizedBox(height: 50),
                  // ignore: avoid_unnecessary_containers
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        height: 90,
                        width: 90,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(66),
                          child: Image.network(
                            fit: BoxFit.cover,
                            alignment: AlignmentGeometry.center,
                            "https://images.pexels.com/photos/986733/pexels-photo-986733.jpeg?cs=srgb&dl=pexels-nickoloui-986733.jpg&fm=jpg",
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Row(
                            children: [
                              Text(
                                CacheHelper().getData(key: ApiKey.firstName) ??
                                    "0",
                              ),
                              Text(
                                CacheHelper().getData(key: ApiKey.secondName) ??
                                    "0",
                              ),
                            ],
                          ),
                          subtitle: Text(
                            CacheHelper().getData(key: ApiKey.phone) ?? "0",
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    subtitle: Text("hassn@gmail.com"),
                    leading: Icon(Icons.home),
                    title: Text("home"),
                    onTap: () {},
                  ),

                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(S.of(context).darkAndLang),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LanguageSelectorScreen(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: state is LogoutLoading
                        ? CircularProgressIndicator()
                        : Icon(Icons.exit_to_app),
                    onTap: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.infoReverse,
                        animType: AnimType.rightSlide,
                        title: S.of(context).awesaTitle,
                        desc: S.of(context).awsdec,
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          context.read<UserCubit>().logout();
                        },
                      ).show();
                    },
                    title: Text(S.of(context).awesaTitle),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              if (widget.role == "owner") {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => Addapartment()));
              } else {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(S.of(context).masenger)));
              }
            },
            child: Icon(Icons.add),
          ),
          appBar: AppBar(title: Text(S.of(context).homePage)),
          body: state is GetAllApartmentLoading
              ? Center(child: CircularProgressIndicator())
              : state is GetAllApartmentSuccess
              ? ListView.builder(
                  itemCount: state.apartments.length,
                  itemBuilder: (context, index) {
                    final apartment = state.apartments[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: ListTile(
                        title: Text(apartment.title),
                        subtitle: Text(
                          '${apartment.province} - ${apartment.city}',
                        ),
                        leading: const Icon(Icons.apartment),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  Apartmentdetailspage(apartment: apartment),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  clipBehavior: Clip.none,
                )
              : Center(child: Text(S.of(context).noApartment)),
        );
      },
    );
  }
}

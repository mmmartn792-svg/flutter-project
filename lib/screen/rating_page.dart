import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectq/cache/cache_helper.dart';
import 'package:projectq/core/api/end_ponits.dart';
import 'package:projectq/cubit/user_cubit.dart';
import 'package:projectq/generated/l10n.dart';
import 'package:projectq/screen/home.dart';

class RatingPage extends StatefulWidget {
  final int apartmentId;

  RatingPage({required this.apartmentId});

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double rating = 0;
  TextEditingController commentController = TextEditingController();
  GlobalKey<FormState> form = GlobalKey();
  @override
  void initState() {
    context.read<UserCubit>().setidApartment(widget.apartmentId);
    super.initState();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is AddRatingSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.ratingResponse.message)));
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) =>
                  Home(role: CacheHelper().getData(key: ApiKey.role)),
            ),
            (Route<dynamic> route) => false,
          );
        } else if (state is AddRatingFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(S.of(context).RAting), centerTitle: true),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: form,
              child: ListView(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      S.of(context).Stars,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 35,
                        ),
                        onPressed: () {
                          setState(() {
                            rating = index + 1.0;
                          });

                          context.read<UserCubit>().setRating(rating.toInt());
                        },
                      );
                    }),
                  ),

                  SizedBox(height: 30),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      S.of(context).write,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  TextFormField(
                    controller: commentController,
                    maxLines: 5,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: S.of(context).opinion,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (value) {
                      context.read<UserCubit>().setcommet(value);
                    },
                    validator: (value) {
                      if (commentController.text == null ||
                          commentController.text.isEmpty) {
                        return S.of(context).comment;
                      }
                    },
                  ),

                  SizedBox(height: 215),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (form.currentState!.validate()) {
                          context.read<UserCubit>().AddRating();
                        }

                        // final ratingData = {
                        //   "apartment_id": widget.apartmentId,
                        //   "rating": rating,
                        //   "comment": commentController.text,
                        // };

                        // Navigator.pop(context, ratingData);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                      child: Text(S.of(context).SendComent),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

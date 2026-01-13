import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectq/cache/cache_helper.dart';
import 'package:projectq/core/api/end_ponits.dart';
import 'package:projectq/cubit/user_cubit.dart';
import 'package:projectq/generated/l10n.dart';
import 'package:projectq/screen/home.dart';
import 'package:projectq/widget/classAmenty.dart';
import 'package:projectq/widget/customboton.dart';
import 'package:projectq/widget/customtextfid.dart';

class Addapartment extends StatefulWidget {
  const Addapartment({super.key});

  @override
  State<Addapartment> createState() => _AddapartmentState();
}

class _AddapartmentState extends State<Addapartment> {
  GlobalKey<FormState> addApartment = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController number2 = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController number1 = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    price.dispose();
    number2.dispose();
    area.dispose();
    number1.dispose();
    super.dispose();
  }

  late final List<Amenity> cities = [
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
  late final List<Amenity> _allAmenities = [
    Amenity(id: 1, name: S.of(context).WiFi),
    Amenity(id: 2, name: S.of(context).AirConditioning),
    Amenity(id: 3, name: S.of(context).SwimmingPool),
    Amenity(id: 4, name: S.of(context).Gym),
    Amenity(id: 5, name: S.of(context).Parking),
    Amenity(id: 6, name: S.of(context).PetFriendly),
    Amenity(id: 7, name: S.of(context).BreakfastIncluded),
    Amenity(id: 8, name: S.of(context).AirportShuttle),
    Amenity(id: 9, name: S.of(context).Spa),
    Amenity(id: 10, name: S.of(context).Restaurant),
    Amenity(id: 11, name: S.of(context).Bar),
    Amenity(id: 12, name: S.of(context).LaundryService),
    Amenity(id: 13, name: S.of(context).RoomService),
    Amenity(id: 14, name: S.of(context).HourFrontDesk),
    Amenity(id: 15, name: S.of(context).BusinessCenter),
    Amenity(id: 16, name: S.of(context).ConferenceRooms),
  ];
  List<int> _selectedAmenityIds = [];
  List<String> phoneNumber = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is AddApartmentSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) =>
                  Home(role: CacheHelper().getData(key: ApiKey.role)),
            ),
            (Route<dynamic> route) => false,
          );
        } else if (state is AddApartmentFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(S.of(context).Addtitl)),
          body: Form(
            key: addApartment,
            child: ListView(
              children: [
                Text(
                  S.of(context).AddPhotos,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();

                    // استخدام pickMultiImage لاختيار عدة صور
                    final List<XFile>? pickedFiles = await picker
                        .pickMultiImage();

                    if (pickedFiles != null && pickedFiles.isNotEmpty) {
                      context.read<UserCubit>().setImages(pickedFiles);
                    }
                  },
                  child: Container(
                    height: 120,
                    color: Colors.grey,
                    child: Center(child: Text(S.of(context).ADDphoto)),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  S.of(context).amanty,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _allAmenities.map((amenity) {
                    final isSelected = _selectedAmenityIds.contains(amenity.id);

                    return FilterChip(
                      label: Text(amenity.name),
                      selected: isSelected,
                      onSelected: (isSelected) {
                        setState(() {
                          if (isSelected) {
                            _selectedAmenityIds.add(amenity.id);
                            context.read<UserCubit>().setAmenities(
                              _selectedAmenityIds,
                            );
                          } else {
                            _selectedAmenityIds.remove(amenity.id);

                            context.read<UserCubit>().setAmenities(
                              _selectedAmenityIds,
                            );
                          }
                        });
                      },
                      selectedColor: Colors.teal.shade200,
                      checkmarkColor: Colors.teal.shade900,
                    );
                  }).toList(),
                ),
                SizedBox(height: 25),

                Customtextform(
                  hint: S.of(context).tit,
                  controller: title,
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      context.read<UserCubit>().setTitle(val);
                    }
                  },
                  validator: (textValue) {
                    if (textValue == null || textValue.isEmpty) {
                      return S.of(context).tit;
                    } else {
                      return null;
                    }
                  }, //100
                ),
                SizedBox(height: 20),

                DropdownButtonFormField<int>(
                  decoration: InputDecoration(labelText: S.of(context).city),
                  items: cities
                      .map(
                        (c) =>
                            DropdownMenuItem(value: c.id, child: Text(c.name)),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      context.read<UserCubit>().setCityid(value);
                    }
                  },
                  validator: (val) {
                    if (val == null) {
                      return S.of(context).validatorcity;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: price,
                        decoration: InputDecoration(
                          labelText: S.of(context).laprice,
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          context.read<UserCubit>().setPrice(val);
                        },
                        validator: (textValue) {
                          if (textValue == null || textValue.isEmpty) {
                            return S.of(context).validatorpric;
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<int>(
                        decoration: InputDecoration(labelText: 'm²'),
                        items: [50, 100, 150, 200]
                            .map(
                              (s) =>
                                  DropdownMenuItem(value: s, child: Text("$s")),
                            )
                            .toList(),
                        onChanged: (val) {
                          context.read<UserCubit>().setArea(val ?? 0);
                        },
                        validator: (value) {
                          if (value == null) {
                            return S.of(context).validatorarea;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        hint: Text(S.of(context).typeapar),

                        items: [
                          DropdownMenuItem<String>(
                            value: S.of(context).daily,
                            child: Text(S.of(context).daily),
                          ),
                          DropdownMenuItem<String>(
                            value: S.of(context).monthly,
                            child: Text(S.of(context).monthly),
                          ),
                          DropdownMenuItem<String>(
                            value: S.of(context).yearly,
                            child: Text(S.of(context).yearly),
                          ),
                        ],
                        onChanged: (String? value) {
                          if (value != null) {
                            context.read<UserCubit>().setRentType(value);
                          }
                        },
                        validator: (val) {
                          if (val == null) {
                            return S.of(context).typeapar;
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        hint: Text(S.of(context).hiiiii),

                        items: [
                          DropdownMenuItem<String>(
                            value: 'family',
                            child: Text(S.of(context).family),
                          ),
                          DropdownMenuItem<String>(
                            value: 'single',
                            child: Text(S.of(context).single),
                          ),
                          DropdownMenuItem<String>(
                            value: 'students',
                            child: Text(S.of(context).students),
                          ),
                          DropdownMenuItem<String>(
                            value: 'employees',
                            child: Text(S.of(context).employees),
                          ),
                        ],
                        onChanged: (String? value) {
                          if (value != null) {
                            context.read<UserCubit>().setCategoryOfRentType(
                              value,
                            );
                          }
                        },
                        validator: (val) {
                          if (val == null) {
                            return S.of(context).hiiiii;
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15),

                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  hint: Text(S.of(context).floor),

                  items: [
                    DropdownMenuItem<String>(
                      value: 'land',
                      child: Text(S.of(context).land),
                    ),
                    DropdownMenuItem<String>(
                      value: 'first',
                      child: Text(S.of(context).first),
                    ),
                    DropdownMenuItem<String>(
                      value: 'second',
                      child: Text(S.of(context).second),
                    ),
                    DropdownMenuItem<String>(
                      value: 'third',
                      child: Text(S.of(context).third),
                    ),
                    DropdownMenuItem<String>(
                      value: 'fourth',
                      child: Text(S.of(context).fourth),
                    ),
                    DropdownMenuItem<String>(
                      value: 'fifth',
                      child: Text(S.of(context).fifth),
                    ),
                  ],
                  onChanged: (String? value) {
                    if (value != null) {
                      context.read<UserCubit>().setFloor(value);
                    }
                  },
                  validator: (val) {
                    if (val == null) {
                      return S.of(context).floor;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 15),

                SizedBox(height: 15),
                DropdownButtonFormField<int>(
                  hint: Text(S.of(context).nroom),

                  items: [
                    DropdownMenuItem<int>(
                      value: 1,
                      child: Text(S.of(context).room1),
                    ),
                    DropdownMenuItem<int>(
                      value: 2,
                      child: Text(S.of(context).room2),
                    ),
                    DropdownMenuItem<int>(
                      value: 3,
                      child: Text(S.of(context).room3),
                    ),
                    DropdownMenuItem<int>(
                      value: 4,
                      child: Text(S.of(context).room4),
                    ),
                    DropdownMenuItem<int>(
                      value: 5,
                      child: Text(S.of(context).room5),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      context.read<UserCubit>().setRooms_number(value);
                    }
                  },
                  validator: (val) {
                    if (val == null) {
                      return S.of(context).nroom;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 25),

                Custombutton(
                  title: S.of(context).Addtitl,
                  onPressed: () {
                    if (_selectedAmenityIds.isEmpty) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: S.of(context).Eroor,
                        desc: S.of(context).des,
                        btnOkOnPress: () {},
                      ).show();
                    } else if (context.read<UserCubit>().img != null) {
                      if (addApartment.currentState!.validate()) {
                        context.read<UserCubit>().addApartment();
                      }
                    } else {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: S.of(context).Eroor,
                        desc: S.of(context).des2,
                        btnOkOnPress: () {},
                      ).show();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

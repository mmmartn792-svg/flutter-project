import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projectq/cache/cache_helper.dart';
import 'package:projectq/core/api/end_ponits.dart';
import 'package:projectq/cubit/user_cubit.dart';
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

  final List<Amenity> _allAmenities = [
    const Amenity(id: 1, name: 'WiFi'),
    const Amenity(id: 2, name: 'Air Conditioning'),
    const Amenity(id: 3, name: 'Swimming Pool'),
    const Amenity(id: 4, name: 'Gym'),
    const Amenity(id: 5, name: 'Parking'),
    const Amenity(id: 6, name: 'Pet Friendly'),
    const Amenity(id: 7, name: 'Breakfast Included'),
    const Amenity(id: 8, name: 'Airport Shuttle'),
    const Amenity(id: 9, name: 'Spa'),
    const Amenity(id: 10, name: 'Restaurant'),
    const Amenity(id: 11, name: 'Bar'),
    const Amenity(id: 12, name: 'Laundry Service'),
    const Amenity(id: 13, name: 'Room Service'),
    const Amenity(id: 14, name: '24-Hour Front Desk'),
    const Amenity(id: 15, name: 'Business Center'),
    const Amenity(id: 16, name: 'Conference Room'),
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
          appBar: AppBar(title: Text("إضافة شقة")),
          body: Form(
            key: addApartment,
            child: ListView(
              children: [
                Customtextform(
                  hint: "الرجاء ادخال العنوان",
                  controller: title,
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      context.read<UserCubit>().setTitle(val);
                    }
                  },
                  validator: (textValue) {
                    if (textValue == null || textValue.isEmpty) {
                      return 'الرجاء إدخال العنوان';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 15),
                Customtextform(
                  hint: "الرجاء ادخال الوصف",
                  controller: description,
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      context.read<UserCubit>().setDescription(val);
                    }
                  },
                  validator: (textValue) {
                    if (textValue == null || textValue.isEmpty) {
                      return 'الرجاء إدخال الوصف';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Customtextform(
                  hint: "الرجاء ادخال السعر",
                  controller: price,
                  onChanged: (val) {
                    context.read<UserCubit>().setPrice(val);
                  },
                  keyboardType: TextInputType.number,
                  validator: (textValue) {
                    if (textValue == null || textValue.isEmpty) {
                      return 'الرجاء إدخال السعر';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),

                SizedBox(height: 15),
                Customtextform(
                  hint: "الرجاء ادخال المساحة",
                  controller: area,
                  onChanged: (val) {
                    final areaValue = int.tryParse(val) ?? 0;
                    context.read<UserCubit>().setArea(areaValue);
                  },
                  keyboardType: TextInputType.number,
                  validator: (textValue) {
                    if (textValue == null || textValue.isEmpty) {
                      return 'الرجاء إدخال المساحة';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Customtextform(
                  hint: "الرجاء ادخال رقم الهاتف",
                  controller: number1,
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      phoneNumber.add(val);
                      context.read<UserCubit>().setPhones(phoneNumber);
                    }
                  },
                  validator: (textValue) {
                    if (textValue == null || textValue.isEmpty) {
                      return 'الرجاء إدخال رقم الهاتف';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                Customtextform(
                  hint: "الرجاء ادخال رقم الموبايل ",
                  controller: number2,
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    phoneNumber.add(val);
                    context.read<UserCubit>().setPhones(phoneNumber);
                  },
                  validator: (textValue) {
                    if (textValue == null || textValue.isEmpty) {
                      return 'الرجاء إدخال رقم الموبايل';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                DropdownButtonFormField<String>(
                  hint: Text("حدد نوع الايجار"),

                  items: [
                    DropdownMenuItem<String>(
                      value: 'يومي', // القيمة الفعلية التي سيتم حفظها
                      child: Text('يومي '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<String>(
                      value: 'شهري',
                      child: Text('شهري'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'سنوي', // القيمة الفعلية التي سيتم حفظها
                      child: Text('سنوي '), // النص الذي سيظهر للمستخدم
                    ),
                  ],
                  onChanged: (String? value) {
                    if (value != null) {
                      context.read<UserCubit>().setRentType(value);
                    }
                  },
                  validator: (val) {
                    if (val == null) {
                      return "الرجاء تحديد نوع الايجار";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 15),
                DropdownButtonFormField<String>(
                  hint: Text("حدد رقم الطابق"),

                  items: [
                    DropdownMenuItem<String>(
                      value: 'land', // القيمة الفعلية التي سيتم حفظها
                      child: Text('ارضي '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<String>(
                      value: 'first',
                      child: Text('طابق اول'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'second', // القيمة الفعلية التي سيتم حفظها
                      child: Text('طابق ثاني '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<String>(
                      value: 'third', // القيمة الفعلية التي سيتم حفظها
                      child: Text('طابق ثالث '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<String>(
                      value: 'fourth', // القيمة الفعلية التي سيتم حفظها
                      child: Text('طابق رابع '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<String>(
                      value: 'fifth', // القيمة الفعلية التي سيتم حفظها
                      child: Text('طابق خامس '), // النص الذي سيظهر للمستخدم
                    ),
                  ],
                  onChanged: (String? value) {
                    if (value != null) {
                      context.read<UserCubit>().setFloor(value);
                    }
                  },
                  validator: (val) {
                    if (val == null) {
                      return "الرجاء تحديد رقم الطابق";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 15),
                DropdownButtonFormField<String>(
                  hint: Text("حدد الشريجة المستهدفة"),

                  items: [
                    DropdownMenuItem<String>(
                      value: 'family', // القيمة الفعلية التي سيتم حفظها
                      child: Text(' عائلي'), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<String>(
                      value: 'single',
                      child: Text(' فردي'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'students',
                      child: Text(' طلاب'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'employees',
                      child: Text(' موظفين'),
                    ),
                  ],
                  onChanged: (String? value) {
                    if (value != null) {
                      context.read<UserCubit>().setCategoryOfRentType(value);
                    }
                  },
                  validator: (val) {
                    if (val == null) {
                      return "الرجاء تحديد الشريحة المستهدفة";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 15),
                DropdownButtonFormField<int>(
                  hint: Text(" ادخل عدد الغرف"),

                  items: [
                    DropdownMenuItem<int>(
                      value: 1, // القيمة الفعلية التي سيتم حفظها
                      child: Text(' غرفة واحدة'), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(value: 2, child: Text(' غرفتين')),
                    DropdownMenuItem<int>(value: 3, child: Text(' ثلاث غرف')),
                    DropdownMenuItem<int>(value: 4, child: Text(' اربع غرف')),
                    DropdownMenuItem<int>(
                      value: 5,
                      child: Text(' خمس غرف او أكثر'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      context.read<UserCubit>().setRooms_number(value);
                    }
                  },
                  validator: (val) {
                    if (val == null) {
                      return "الرجاء تحديد عدد الغرف";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 15),
                DropdownButtonFormField<int>(
                  hint: Text("الرجاء تحديد المدينة"),

                  items: [
                    DropdownMenuItem<int>(
                      value: 1, // القيمة الفعلية التي سيتم حفظها
                      child: Text('دمشق المدبنة '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(value: 2, child: Text('القنوات')),
                    DropdownMenuItem<int>(
                      value: 3, // القيمة الفعلية التي سيتم حفظها
                      child: Text('الميدان '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 4, // القيمة الفعلية التي سيتم حفظها
                      child: Text('باب توما  '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 5, // القيمة الفعلية التي سيتم حفظها
                      child: Text('ساروجا '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 6, // القيمة الفعلية التي سيتم حفظها
                      child: Text('دوما '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 7, // القيمة الفعلية التي سيتم حفظها
                      child: Text('التل '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 8, // القيمة الفعلية التي سيتم حفظها
                      child: Text('القطيفة '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 9, // القيمة الفعلية التي سيتم حفظها
                      child: Text('حلب المدينة '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 10, // القيمة الفعلية التي سيتم حفظها
                      child: Text('منبج '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 11, // القيمة الفعلية التي سيتم حفظها
                      child: Text('عزاز '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 12, // القيمة الفعلية التي سيتم حفظها
                      child: Text('ادلب المدينة '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 13, // القيمة الفعلية التي سيتم حفظها
                      child: Text('معرة النعمان '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 14, // القيمة الفعلية التي سيتم حفظها
                      child: Text('حمص المدينة  '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 15, // القيمة الفعلية التي سيتم حفظها
                      child: Text('الرستن '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 16, // القيمة الفعلية التي سيتم حفظها
                      child: Text('حماه المدينة '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 17, // القيمة الفعلية التي سيتم حفظها
                      child: Text('مصياف '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 18, // القيمة الفعلية التي سيتم حفظها
                      child: Text(
                        'اللاذقية المدينة ',
                      ), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 19, // القيمة الفعلية التي سيتم حفظها
                      child: Text('جبلة '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 20, // القيمة الفعلية التي سيتم حفظها
                      child: Text('طرطوس المدينة '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 21, // القيمة الفعلية التي سيتم حفظها
                      child: Text('بانياس '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 22, // القيمة الفعلية التي سيتم حفظها
                      child: Text(
                        'دير الزور المدينة  ',
                      ), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 23, // القيمة الفعلية التي سيتم حفظها
                      child: Text('الميادين '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 24, // القيمة الفعلية التي سيتم حفظها
                      child: Text('الرقة المدينة '), // النص الذي سيظهر للمستخدم
                    ),
                    DropdownMenuItem<int>(
                      value: 25, // القيمة الفعلية التي سيتم حفظها
                      child: Text('الثوره '), // النص الذي سيظهر للمستخدم
                    ),
                  ],
                  onChanged: (int? value) {
                    if (value != null) {
                      context.read<UserCubit>().setCityid(value);
                    }
                  },
                  validator: (val) {
                    if (val == null) {
                      return "الرجاء تحديد المدينة";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 15),
                Text(
                  "الرجاء تحديد المرافق المتوفرة ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _allAmenities.map((amenity) {
                    // التحقق إذا كان الرقم الخاص بالوسيلة الحالية موجود في القائمة المختارة
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
                            // إذا تم تحديده، أضف الرقم (id) إلى القائمة
                          } else {
                            _selectedAmenityIds.remove(amenity.id);

                            context.read<UserCubit>().setAmenities(
                              _selectedAmenityIds,
                            );

                            // إذا تم إلغاء تحديده، احذف الرقم (id) من القائمة
                          }
                        });
                      },
                      selectedColor: Colors.teal.shade200,
                      checkmarkColor: Colors.teal.shade900,
                    );
                  }).toList(),
                ),
                SizedBox(height: 15),
                Custombutton(
                  title: "الرجاء ادخال صورة ",
                  onPressed: () async {
                    await ImagePicker()
                        .pickImage(source: ImageSource.camera)
                        .then(
                          (onValue) =>
                              context.read<UserCubit>().setImage(onValue!),
                        );
                  },
                ),
                SizedBox(height: 15),
                Custombutton(
                  title: "إضافة الشقة",
                  onPressed: () {
                    if (_selectedAmenityIds.isEmpty) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'خطأ',
                        desc: 'الرجاء اختيار المرافق المتوفرة',
                        btnOkOnPress: () {},
                      ).show();
                    } else if (context.read<UserCubit>().image != null) {
                      if (addApartment.currentState!.validate()) {
                        context.read<UserCubit>().addApartment();
                      }
                    } else {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'خطأ',
                        desc: 'الرجاء إضافة صورة للشقة',
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

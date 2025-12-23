// // // void _signup() {
// // //     if (_dateController.text.isEmpty ||
// // //         fileC == null ||
// // //         fileP == null ||
// // //         secondName.text.isEmpty ||
// // //         firstName.text.isEmpty ||
// // //         phoneController.text.isEmpty ||
// // //         passwordController.text.isEmpty ||
// // //         confirmPasswordController.text.isEmpty) {
// // //       ScaffoldMessenger.of(
// // //         context,
// // //       ).showSnackBar(SnackBar(content: Text("يرجى إدخال جميع البيانات")));
// // //       return;
// // //     }

// // //     if (passwordController.text != confirmPasswordController.text) {
// // //       ScaffoldMessenger.of(
// // //         context,
// // //       ).showSnackBar(SnackBar(content: Text("كلمة المرور غير متطابقة")));
// // //       return;
// // //     }

// // //     ScaffoldMessenger.of(
// // //       context,
// // //     ).showSnackBar(SnackBar(content: Text("تم إنشاء الحساب بنجاح")));

// // //     Navigator.pop(context);
// // //   }

// // //   Future<void> AddImagP() async {
// // //     final ImagePicker picker = ImagePicker();
// // //     final XFile? image = await picker.pickImage(source: ImageSource.gallery);

// // //     final XFile? photo = await picker.pickImage(source: ImageSource.camera);
// // //     if (photo != null) fileP = File(photo.path);
// // //     if (image != null) fileP = File(image.path);
// // //     setState(() {});
// // //   }

// // //   Future<void> AddImagC() async {
// // //     final ImagePicker picker = ImagePicker();
// // //     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
// // //     // final XFile? image = await picker.pickImage(source: ImageSource.gallery);
// // //     // Capture a photo.
// // //     final XFile? photo = await picker.pickImage(source: ImageSource.camera);
// // //     if (photo != null) fileC = File(photo.path);
// // //     if (image != null) fileC = File(image.path);
// // //     setState(() {});
// // //   }
// // الخطوة 1: إنشاء نموذج البيانات (Data Model)


// // // models/apartment_model.dart

// // class ApartmentModel {
// //   final int id;
// //   final String title;
// //   final String description;
// //   final double price;
// //   final String location;
// //   final int bedrooms;
// //   final int bathrooms;
// //   final double area; // بالمتر المربع
// //   final List<String> images; // قائمة من روابط الصور

// //   ApartmentModel({
// //     required this.id,
// //     required this.title,
// //     required this.description,
// //     required this.price,
// //     required this.location,
// //     required this.bedrooms,
// //     required this.bathrooms,
// //     required this.area,
// //     required this.images,
// //   });

// //   /// دالة مصنعية لإنشاء كائن ApartmentModel من JSON
// //   factory ApartmentModel.fromJson(Map<String, dynamic> json) {
// //     // استخلاص قائمة الصور بأمان
// //     var imagesList = <String>[];
// //     if (json['images'] is List) {
// //       imagesList = List<String>.from(json['images']);
// //     }

// //     return ApartmentModel(
// //       id: json['id'] as int,
// //       title: json['title'] ?? 'بدون عنوان',
// //       description: json['description'] ?? 'لا يوجد وصف',
// //       price: (json['price'] as num).toDouble(),
// //       location: json['location'] ?? 'غير محدد',
// //       bedrooms: json['bedrooms'] ?? 0,
// //       bathrooms: json['bathrooms'] ?? 0,
// //       area: (json['area'] as num?)?.toDouble() ?? 0.0,
// //       images: imagesList,
// //     );
// //   }
// // }

// // // services/api_service.dart

// // import 'package:dio/dio.dart';
// // import 'package:projectq/core/errors/error_model.dart'; // تأكد من المسار الصحيح
// // import 'package:projectq/features/home/data/models/apartment_model.dart'; // تأكد من المسار الصحيح

// // class ApiService {
// //   final Dio _dio;

// //   ApiService(this._dio);

// //   /// جلب قائمة بالشقق
// //   Future<List<ApartmentModel>> getApartments() async {
// //     try {
// //       final response = await _dio.get('/apartments'); // الرابط النسبي للـ API
      
// //       // افترض أن السيرفر يرجع قائمة من الشقق
// //       final List<dynamic> jsonData = response.data['data'];
// //       return jsonData.map((json) => ApartmentModel.fromJson(json)).toList();
// //     } on DioException catch (e) {
// //       // استخدام دالة معالجة الأخطاء التي أنشأناها سابقاً
// //       handleDioExceptions(e);
// //       // هذا السطر لن يُتنفذ أبداً لأن handleDioExceptions ترمي استثناء
// //       rethrow; 
// //     }
// //   }

// //   /// جلب تفاصيل شقة واحدة بناءً على معرفها (ID)
// //   Future<ApartmentModel> getApartmentDetails(int apartmentId) async {
// //     try {
// //       final response = await _dio.get('/apartments/$apartmentId'); // الرابط النسبي للـ API
      
// //       // افترض أن السيرفر يرجع كائن شقة واحد
// //       return ApartmentModel.fromJson(response.data['data']);
// //     } on DioException catch (e) {
// //       handleDioExceptions(e);
// //       rethrow;
// //     }
// //   }
// // }الخطوة 3


// // // logic/apartment_cubit.dart

// // import 'package:bloc/bloc.dart';
// // import 'package:meta/meta.dart';
// // import 'package:projectq/core/errors/error_model.dart';
// // import 'package:projectq/features/home/data/models/apartment_model.dart';
// // import 'package:projectq/features/home/data/services/api_service.dart';

// // part 'apartment_state.dart';

// // class ApartmentCubit extends Cubit<ApartmentState> {
// //   final ApiService _apiService;

// //   ApartmentCubit(this._apiService) : super(ApartmentInitial());

// //   void fetchApartments() async {
// //     emit(ApartmentLoading());
// //     try {
// //       final apartments = await _apiService.getApartments();
// //       emit(ApartmentLoaded(apartments));
// //     } on ServerException catch (e) {
// //       emit(ApartmentError(e.errModel));
// //     }
// //   }
// // }// logic/apartment_state.dart

// // part of 'apartment_cubit.dart';

// // abstract class ApartmentState {}

// // class ApartmentInitial extends ApartmentState {}

// // class ApartmentLoading extends ApartmentState {}

// // class ApartmentLoaded extends ApartmentState {
// //   final List<ApartmentModel> apartments;

// //   ApartmentLoaded(this.apartments);
// // }

// // class ApartmentError extends ApartmentState {
// //   final ErrorModel errorModel;

// //   ApartmentError(this.errorModel);
// // }



// // // logic/apartment_details_cubit.dart

// // import 'package:bloc/bloc.dart';
// // import 'package:meta/meta.dart';
// // import 'package:projectq/core/errors/error_model.dart';
// // import 'package:projectq/features/home/data/models/apartment_model.dart';
// // import 'package:projectq/features/home/data/services/api_service.dart';

// // part 'apartment_details_state.dart';

// // class ApartmentDetailsCubit extends Cubit<ApartmentDetailsState> {
// //   final ApiService _apiService;

// //   ApartmentDetailsCubit(this._apiService) : super(ApartmentDetailsInitial());

// //   void fetchApartmentDetails(int apartmentId) async {
// //     emit(ApartmentDetailsLoading());
// //     try {
// //       final apartment = await _apiService.getApartmentDetails(apartmentId);
// //       emit(ApartmentDetailsLoaded(apartment));
// //     } on ServerException catch (e) {
// //       emit(ApartmentDetailsError(e.errModel));
// //     }
// //   }
// // }

// // // logic/apartment_details_state.dart

// // part of 'apartment_details_cubit.dart';

// // abstract class ApartmentDetailsState {}

// // class ApartmentDetailsInitial extends ApartmentDetailsState {}

// // class ApartmentDetailsLoading extends ApartmentDetailsState {}

// // class ApartmentDetailsLoaded extends ApartmentDetailsState {
// //   final ApartmentModel apartment;

// //   ApartmentDetailsLoaded(this.apartment);
// // }

// // class ApartmentDetailsError extends ApartmentDetailsState {
// //   final ErrorModel errorModel;

// //   ApartmentDetailsError(this.errorModel);
// // }


// // // screens/apartments_list_screen.dart

// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:projectq/features/home/logic/apartment_cubit.dart';
// // import 'package:projectq/features/home/logic/apartment_state.dart';
// // import 'package:projectq/features/home/data/models/apartment_model.dart';
// // import 'package:projectq/features/home/ui/apartment_details_screen.dart'; // سننشئها بعد قليل

// // class ApartmentsListScreen extends StatelessWidget {
// //   const ApartmentsListScreen({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('تصفح الشقق'),
// //       ),
// //       // نستخدم BlocProvider لإنشاء وتوفير الـ Cubit لهذه الشاشة
// //       body: BlocProvider(
// //         create: (context) => ApartmentCubit(ApiService(Dio()))..fetchApartments(),
// //         child: const ApartmentsListView(),
// //       ),
// //     );
// //   }
// // }

// // class ApartmentsListView extends StatelessWidget {
// //   const ApartmentsListView({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocBuilder<ApartmentCubit, ApartmentState>(
// //       builder: (context, state) {
// //         if (state is ApartmentLoading) {
// //           return const Center(child: CircularProgressIndicator());
// //         }
// //         if (state is ApartmentError) {
// //           // عرض رسالة الخطأ من السيرفر
// //           return Center(
// //             child: Text(state.errorModel.getAllErrorsAsString()),
// //           );
// //         }
// //         if (state is ApartmentLoaded) {
// //           if (state.apartments.isEmpty) {
// //             return const Center(child: Text('لا توجد شقق متاحة حالياً'));
// //           }
// //           return ListView.builder(
// //             itemCount: state.apartments.length,
// //             itemBuilder: (context, index) {
// //               final apartment = state.apartments[index];
// //               return ApartmentCard(apartment: apartment);
// //             },
// //           );
// //         }
// //         // الحالة الابتدائية
// //         return const Center(child: Text('اضغط لجلب الشقق'));
// //       },
// //     );
// //   }
// // }

// // // تصميم بطاقة الشقة في القائمة
// // class ApartmentCard extends StatelessWidget {
// //   final ApartmentModel apartment;

// //   const ApartmentCard({Key? key, required this.apartment}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Card(
// //       margin: const EdgeInsets.all(8.0),
// //       child: ListTile(
// //         leading: Image.network(
// //           apartment.images.isNotEmpty ? apartment.images.first : 'https://via.placeholder.com/100',
// //           width: 100,
// //           fit: BoxFit.cover,
// //           errorBuilder: (context, error, stackTrace) => const Icon(Icons.home),
// //         ),
// //         title: Text(apartment.title),
// //         subtitle: Text('${apartment.location} - ${apartment.bedrooms} غرف'),
// //         trailing: Text('${apartment.price.toStringAsFixed(0)} ريال'),
// //         onTap: () {
// //           // عند الضغط، انتقل إلى شاشة التفاصيل مع تمرير معرف الشقة
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(
// //               builder: (context) => ApartmentDetailsScreen(apartmentId: apartment.id),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }


// // // screens/apartment_details_screen.dart

// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:projectq/features/home/logic/apartment_details_cubit.dart';
// // import 'package:projectq/features/home/logic/apartment_details_state.dart';
// // import 'package:projectq/features/home/data/services/api_service.dart';
// // import 'package:dio/dio.dart';

// // class ApartmentDetailsScreen extends StatelessWidget {
// //   final int apartmentId;

// //   const ApartmentDetailsScreen({Key? key, required this.apartmentId}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('تفاصيل الشقة'),
// //       ),
// //       body: BlocProvider(
// //         create: (context) => ApartmentDetailsCubit(ApiService(Dio()))..fetchApartmentDetails(apartmentId),
// //         child: const ApartmentDetailsView(),
// //       ),
// //     );
// //   }
// // }

// // class ApartmentDetailsView extends StatelessWidget {
// //   const ApartmentDetailsView({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocBuilder<ApartmentDetailsCubit, ApartmentDetailsState>(
// //       builder: (context, state) {
// //         if (state is ApartmentDetailsLoading) {
// //           return const Center(child: CircularProgressIndicator());
// //         }
// //         if (state is ApartmentDetailsError) {
// //           return Center(
// //             child: Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: Text(state.errorModel.getAllErrorsAsString()),
// //             ),
// //           );
// //         }
// //         if (state is ApartmentDetailsLoaded) {
// //           final apartment = state.apartment;
// //           return SingleChildScrollView(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 // عرض الصور في PageView
// //                 if (apartment.images.isNotEmpty)
// //                   SizedBox(
// //                     height: 250,
// //                     child: PageView.builder(
// //                       itemCount: apartment.images.length,
// //                       itemBuilder: (context, index) {
// //                         return Image.network(
// //                           apartment.images[index],
// //                           fit: BoxFit.cover,
// //                           errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.image_not_supported, size: 50)),
// //                         );
// //                       },
// //                     ),
// //                   ),
// //                 const SizedBox(height: 16),
// //                 Text(
// //                   apartment.title,
// //                   style: Theme.of(context).textTheme.headlineSmall,
// //                 ),
// //                 const SizedBox(height: 8),
// //                 Text(
// //                   '${apartment.price.toStringAsFixed(0)} ريال / شهر',
// //                   style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.green),
// //                 ),
// //                 const Divider(),
// //                 _buildDetailRow('الموقع', apartment.location),
// //                 _buildDetailRow('المساحة', '${apartment.area.toStringAsFixed(0)} م²'),
// //                 _buildDetailRow('غرف النوم', '${apartment.bedrooms}'),
// //                 _buildDetailRow('الحمامات', '${apartment.bathrooms}'),
// //                 const Divider(),
// //                 const SizedBox(height: 8),
// //                 Text(
// //                   'الوصف:',
// //                   style: Theme.of(context).textTheme.titleMedium,
// //                 ),
// //                 const SizedBox(height: 4),
// //                 Text(apartment.description),
// //               ],
// //             ),
// //           );
// //         }
// //         return const Center(child: Text('جاري التحميل...'));
// //       },
// //     );
// //   }

// //   Widget _buildDetailRow(String title, String value) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 4.0),
// //       child: Row(
// //         children: [
// //           SizedBox(
// //             width: 100,
// //             child: Text(
// //               '$title:',
// //               style: const TextStyle(fontWeight: FontWeight.bold),
// //             ),
// //           ),
// //           Expanded(child: Text(value)),
// //         ],
// //       ),
// //     );
// //   }
// // }






// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:projectq/auth/login_screen.dart';
// import 'package:projectq/cubit/user_cubit.dart'; // تأكد من أن المسار صحيح
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:projectq/screen/AddApartment.dart'; // تأكد من أن المسار صحيح

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   void initState() {
//     // استدعاء جلب الشقق عند بناء الواجهة لأول مرة
//     // context.read() يُستخدم لتنفيذ دالة مرة واحدة بدون الاستماع للنتيجة
//     context.read<UserCubit>().getAllapartment();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.green,
//         onPressed: () {
//           Navigator.of(
//             context,
//           ).push(MaterialPageRoute(builder: (context) => const Addapartment()));
//         },
//         child: const Icon(Icons.add),
//       ),
//       appBar: AppBar(
//         title: const Text("الصفحة الرئيسية"),
//         actions: [
          
//           if (context.watch<UserCubit>().state is LogoutLoading)
//             const Padding(
//               padding: EdgeInsets.all(16.0),
//               child: SizedBox(
//                 width: 24,
//                 height: 24,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2,
//                   color: Colors.white,
//                 ),
//               ),
//             )
//           else
//             IconButton(
//               onPressed: () {
//                 AwesomeDialog(
//                   context: context,
//                   dialogType: DialogType.info,
//                   animType: AnimType.rightSlide,
//                   title: 'تسجيل الخروج',
//                   desc: 'هل أنت متأكد من تسجيل الخروج؟',
//                   btnCancelOnPress: () {},
//                   btnOkOnPress: () {
//                     context.read<UserCubit>().logout();
//                   },
//                 ).show();
//               },
//               icon: const Icon(Icons.exit_to_app),
//             ),
//         ],
//       ),
//       // دمج الـ BlocConsumer المزدوج في واحد لتحسين الكود
//       body: BlocConsumer<UserCubit, UserState>(
//         listener: (context, state) {
//           // معالجة الحالات التي تتطلب تنفيذ أمر (Side Effects) مثل عرض رسائل أو التنقل
//           if (state is LogoutSuccess) {
//             ScaffoldMessenger.of(
//               context,
//             ).showSnackBar(SnackBar(content: Text(state.message)));
//             Navigator.of(context).pushAndRemoveUntil(
//               MaterialPageRoute(builder: (context) => LoginScreen()),
//               (Route<dynamic> route) => false,
//             );
//           } else if (state is GetAllApartmentFailure) {
//             ScaffoldMessenger.of(
//               context,
//             ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
//           } else if (state is GetAllApartmentSuccess) {
//             // يمكنك إظهار رسالة نجاح هنا إذا أردت
//             // ScaffoldMessenger.of(context).showSnackBar(
//             //   SnackBar(content: Text('تم جلب الشقق بنجاح')),
//             // );
//           }
//         },
//         builder: (context, state) {
//           // بناء الواجهة بناءً على الحالة الحالية
//           if (state is GetAllApartmentLoading) {
//             // حالة التحميل: عرض مؤشر تحميل في المنتصف
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (state is GetAllApartmentFailure) {
//             // حالة الفشل: عرض رسالة خطأ
//             return Center(child: Text(state.errorMessage));
//           }

//           if (state is GetAllApartmentSuccess) {
//             // حالة النجاح: عرض قائمة الشقق
//             final apartments = state.apartments;

//             // في حالة كانت القائمة فارغة، اعرض رسالة مناسبة
//             if (apartments.isEmpty) {
//               return const Center(child: Text("لا توجد شقق متاحة حاليًا."));
//             }

//             return ListView.builder(
//               itemCount: apartments.length,
//               itemBuilder: (context, index) {
//                 final apartment = apartments[index];
              
//               },
//             );
//           }

//           // الحالة الابتدائية (قبل بدء التحميل) أو أي حالة أخرى
//           return const Center(child: Text("ابدأ بجلب الشقق..."));
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectq/cubit/user_cubit.dart';
import 'package:projectq/generated/l10n.dart';
import 'package:projectq/models/showAllApartment_model.dart';
import 'package:projectq/screen/detailsbooking.dart';
import 'package:projectq/widget/primary_button.dart';

class Booking extends StatefulWidget {
  final id;
  Booking({super.key, required this.apartment, this.id});
  final ApartmentModel apartment;
  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  DateTime? _selectedDate;
  TextEditingController dateController = TextEditingController();
  GlobalKey<FormState> date = GlobalKey();
  DateTime? selectedDate1;
  TextEditingController dateController2 = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    dateController2.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2029),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        dateController.text =
            "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
        context.read<UserCubit>().setStartdat(dateController.text);
      });
    }
  }

  Future<void> selectDate1(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate1 ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2029),
    );

    if (pickedDate != null && pickedDate != selectedDate1) {
      setState(() {
        selectedDate1 = pickedDate;
        dateController2.text =
            "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
        context.read<UserCubit>().setEnddat(dateController2.text);
      });
    }
  }

  @override
  void initState() {
    context.read<UserCubit>().setId(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(S.of(context).Booking),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: theme.iconTheme.color),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is BookingSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.bookingResponse.message)),
            );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => BookingConfirmationScreen(
                  apartment: widget.apartment,
                  checkInDate: state.bookingResponse.data.startDate,
                  checkOutDate: state.bookingResponse.data.endDate,
                ),
              ),
            );
          } else if (state is BookingFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errMessage.toString())),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: date,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      color: theme.cardColor,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.apartment.title,
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: colorScheme.onSurfaceVariant,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    '${widget.apartment.province} - ${widget.apartment.city}',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    Card(
                      color: theme.cardColor,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: dateController,
                              decoration: InputDecoration(
                                labelText: S.of(context).date1,
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                  color: colorScheme.primary,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                    color: colorScheme.outline,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                    color: colorScheme.primary,
                                    width: 2.0,
                                  ),
                                ),
                                filled: true,
                                fillColor: colorScheme.surface,
                              ),
                              readOnly: true,
                              onTap: () => _selectDate(context),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return S.of(context).validateDAte;
                                }

                                if (_selectedDate != null &&
                                    selectedDate1 != null &&
                                    selectedDate1!.isBefore(_selectedDate!)) {
                                  return S.of(context).val;
                                }

                                if (_selectedDate != null &&
                                    selectedDate1 != null &&
                                    selectedDate1!.isAtSameMomentAs(
                                      _selectedDate!,
                                    )) {
                                  return S.of(context).val2;
                                }

                                return null;
                              },
                              onChanged: (value) => context
                                  .read<UserCubit>()
                                  .setDateController(value),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: dateController2,
                              decoration: InputDecoration(
                                labelText: S.of(context).date2,
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                  color: colorScheme.primary,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                    color: colorScheme.outline,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                    color: colorScheme.primary,
                                    width: 2.0,
                                  ),
                                ),
                                filled: true,
                                fillColor: colorScheme.surface,
                              ),
                              readOnly: true,
                              onTap: () => selectDate1(context),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return S.of(context).validateDAte;
                                }

                                if (_selectedDate != null &&
                                    selectedDate1 != null &&
                                    selectedDate1!.isBefore(_selectedDate!)) {
                                  return S.of(context).val;
                                }

                                if (_selectedDate != null &&
                                    selectedDate1 != null &&
                                    selectedDate1!.isAtSameMomentAs(
                                      _selectedDate!,
                                    )) {
                                  return S.of(context).val2;
                                }

                                return null;
                              },
                              onChanged: (value) => context
                                  .read<UserCubit>()
                                  .setDateController(value),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    if (state is BookingLoading)
                      Center(
                        child: CircularProgressIndicator(
                          color: colorScheme.primary,
                        ),
                      )
                    else
                      PrimaryButton(
                        text: S.of(context).book,
                        onPressed: () {
                          if (date.currentState!.validate()) {
                            if (context.read<UserCubit>().startDat !=
                                context.read<UserCubit>().endD) {
                              context.read<UserCubit>().BookingApartment();
                            }
                          }
                        },
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

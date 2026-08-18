import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sketch_app/core/di/injection.dart';
import 'package:sketch_app/core/models/booking_model.dart';
import 'package:sketch_app/core/theme/app_colors.dart';
import 'package:sketch_app/core/theme/app_text_styles.dart';
import 'package:sketch_app/core/widgets/custom_divider.dart';
import 'package:sketch_app/features/book/presentation/cubit/book_cubit.dart';
import 'package:sketch_app/features/book/presentation/cubit/book_state.dart';
import 'package:sketch_app/features/book/widgets/confirm_button.dart';
import 'package:sketch_app/features/book/widgets/text_field_box.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => getIt<BookCubit>(),
    child: const _BookForm(),
  );
}

class _BookForm extends StatefulWidget {
  const _BookForm();

  @override
  State<_BookForm> createState() => _BookFormState();
}

class _BookFormState extends State<_BookForm> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dateController = TextEditingController();
  final _detailsController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dateController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final selected = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year, now.month, now.day),
      lastDate: DateTime(now.year + 5),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.dark(
            primary: AppColors.primaryGold,
            surface: AppColors.cardBackground,
            onPrimary: AppColors.deepBlack,
            onSurface: AppColors.white,
          ),
        ),
        child: child!,
      ),
    );
    if (selected == null || !mounted) return;
    _dateController.text =
        '${selected.day.toString().padLeft(2, '0')}/${selected.month.toString().padLeft(2, '0')}/${selected.year}';
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<BookCubit>().submitBooking(
      BookingModel(
        fullName: _fullNameController.text.trim(),
        email: _emailController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        bookDate: _dateController.text.trim(),
        additionalDetails: _detailsController.text.trim(),
        createdAt: DateTime.now().toUtc().toIso8601String(),
      ),
    );
  }

  void _clearForm() {
    _formKey.currentState!.reset();
    _fullNameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _dateController.clear();
    _detailsController.clear();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.darkBackground,
    body: SafeArea(
      child: BlocConsumer<BookCubit, BookState>(
        listener: (context, state) {
          if (state is BookSuccess) {
            _clearForm();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Booking request sent successfully.')),
            );
          } else if (state is BookError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(18.r),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [AppColors.lightGold, AppColors.primaryGold],
                        stops: [0.53, 1.0],
                      ).createShader(bounds),
                      child: Text('BOOK NOW', style: AppTextStyles.screenTitle),
                    ),
                  ),
                  const CustomDivider(),
                  SizedBox(height: 15.h),
                  Text("Fill in your details and we'll get back to you\nwithin 24 hours to discuss your project.", style: AppTextStyles.bodyMuted),
                  SizedBox(height: 30.h),
                  TextFieldBox(title: 'FULL NAME', hintText: 'Enter your name', controller: _fullNameController, validator: (value) => value == null || value.trim().isEmpty ? 'Full name is required.' : null),
                  SizedBox(height: 20.h),
                  TextFieldBox(title: 'EMAIL', hintText: 'Enter your email', controller: _emailController, keyboardType: TextInputType.emailAddress, validator: _emailValidator),
                  SizedBox(height: 20.h),
                  TextFieldBox(title: 'PHONE NUMBER', hintText: 'Enter your phone number', controller: _phoneController, keyboardType: TextInputType.phone, validator: (value) => value == null || value.trim().isEmpty ? 'Phone number is required.' : null),
                  SizedBox(height: 20.h),
                  TextFieldBox(title: 'BOOK DATE', hintText: 'dd/mm/yyyy', controller: _dateController, readOnly: true, onTap: _pickDate, validator: (value) => value == null || value.trim().isEmpty ? 'Book date is required.' : null),
                  SizedBox(height: 20.h),
                  TextFieldBox(title: 'ADDITIONAL DETAILS', hintText: 'Enter any additional details or requirements', controller: _detailsController, maxLines: 4),
                  SizedBox(height: 20.h),
                  ConfirmButton(onPressed: _submit, isLoading: state is BookLoading),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );

  String? _emailValidator(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return 'Email is required.';
    return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)
        ? null
        : 'Enter a valid email address.';
  }
}

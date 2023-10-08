import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/cubits/register_cubit/cubit/register_cubit.dart';
import 'package:shared/models/cities_model.dart';
import 'package:shared/models/governorates_model.dart';
import 'package:shared/widgets/custom_button.dart';
import 'package:shared/widgets/custom_text_field.dart';
import '../core/utils/validator.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen(
      {super.key, required this.phone, required this.countryCode});
  final String phone;
  final String countryCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: CompleteProfileScreenBody(
          phone: phone,
          countryCode: countryCode,
        ),
      ),
    );
  }
}

class CompleteProfileScreenBody extends StatefulWidget {
  const CompleteProfileScreenBody(
      {super.key, required this.phone, required this.countryCode});
  final String phone;
  final String countryCode;
  @override
  State<CompleteProfileScreenBody> createState() =>
      _CompleteProfileScreenBodyState();
}

class _CompleteProfileScreenBodyState extends State<CompleteProfileScreenBody> {
  bool showPassword = true;
  bool showCoPassword = true;
  late String countryValue;
  late String? stateValue;
  late String? cityValue;
  late String? address;
  late String dropdownvalue;
  late String dropdownvalue2;
  late String dropdownvalue3;
  final List<String> items = [
    'male',
    'female',
  ];

  List<GovernoratesData> governorates = [];
  List<CitiesData> cities = [];

  Future<void> _getGovernorates() async {
    final String jsonData =
        await rootBundle.loadString('assets/json/governorates.json');
    final List<dynamic> data = jsonDecode(jsonData)["data"];

    final List<GovernoratesData> parsedData = data.map((item) {
      return GovernoratesData(
        governorateNameAr: item["governorate_name_ar"], id: item["id"],
        governorateNameEn:
            item["governorate_name_en"], // Make sure this matches the JSON key
        // Map other fields here
      );
    }).toList();

    setState(() {
      governorates = parsedData;
    });
  }

  Future<void> _getCities({required String id}) async {
    final String jsonData =
        await rootBundle.loadString('assets/json/cities.json');
    final List<dynamic> data = await jsonDecode(jsonData)["data"];
    final List<CitiesData> parsedData = data.map((item) {
      return CitiesData(
          id: item["id"],
          governorateId: item["governorate_id"],
          cityNameAr: item["city_name_ar"],
          cityNameEn: item["city_name_en"]);
    }).toList();
    setState(() {
      cities = parsedData.where((city) => city.governorateId == id).toList();
    });
  }

  @override
  void initState() {
    _getGovernorates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.phone);
    return SafeArea(
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          final cubit = RegisterCubit.of(context);
          return SingleChildScrollView(
            child: Form(
              key: cubit.formKey,
              child: Column(
                children: [
                  ClipPath(
                    clipper: WaveClipperTwo(),
                    child: Container(
                      height: 200,
                      color: BrandColors.primary,
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.only(top: 50.h),
                        child: const Column(
                          children: [
                            Text(
                              "مرحبا بك",
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              "برجاء استكمال البيانات",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "الاسم",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.w,
                              color: BrandColors.primary),
                        ),
                        SizedBox(height: 5.w),
                        customTextField(
                          startIcon: const Icon(Icons.person),
                          isPassword: false,
                          type: TextInputType.emailAddress,
                          controller: cubit.nameController,
                          hintText: 'برجاء ادخال الاسم',
                          endIcon: null,
                          validator: (value) => Validator.name(value),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "كلمة المرور",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.w,
                              color: BrandColors.primary),
                        ),
                        SizedBox(height: 5.w),
                        customTextField(
                            startIcon: const Icon(Icons.lock),
                            isPassword: showPassword == false ? false : true,
                            type: TextInputType.visiblePassword,
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            validator: (value) => Validator.password(value),
                            endIcon: showPassword == true
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            controller: cubit.passwordController,
                            hintText: 'برجاء ادخال كلمة المرور'),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "تأكيد كلمة المرور",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.w,
                              color: BrandColors.primary),
                        ),
                        SizedBox(height: 5.w),
                        customTextField(
                            startIcon: const Icon(Icons.lock),
                            isPassword: showCoPassword == false ? false : true,
                            type: TextInputType.visiblePassword,
                            validator: (value) => Validator.confirmPassword(
                                value, cubit.passwordController.text),
                            onPressed: () {
                              setState(() {
                                showCoPassword = !showCoPassword;
                              });
                            },
                            endIcon: showCoPassword == true
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            controller: cubit.coPasswordController,
                            hintText: 'برجاء ادخال تأكيد كلمة المرور'),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "تاريخ الميلاد",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.w,
                              color: BrandColors.primary),
                        ),
                        SizedBox(height: 5.w),
                        customTextField(
                            startIcon: const Icon(Icons.date_range),
                            isPassword: false,
                            readOnly: true,
                            type: TextInputType.emailAddress,
                            validator: (value) => Validator.generalField(value),
                            controller: cubit.dateController,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime.now());
                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                setState(() {
                                  cubit.dateController.text = formattedDate;
                                });
                              } else {}
                            },
                            hintText: 'برجاء اختيار تاريخ الميلاد',
                            endIcon: null),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "النوع",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.w,
                              color: BrandColors.primary),
                        ),
                        SizedBox(height: 5.w),
                        customTextField(
                          startIcon: const Icon(Icons.male),
                          hintText: 'برجاء اختيار النوع',
                          readOnly: true,
                          validator: (value) => Validator.generalField(value),
                          isPassword: false,
                          type: TextInputType.text,
                          controller: cubit.genderController,
                          endIcon: PopupMenuButton<String>(
                            onSelected: (String newValue) {
                              setState(() {
                                dropdownvalue = newValue;
                                cubit.genderController.text = newValue;
                              });
                            },
                            itemBuilder: (BuildContext context) {
                              return items
                                  .map(
                                    (String value) => PopupMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ),
                                  )
                                  .toList();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "المحافظة",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.w,
                              color: BrandColors.primary),
                        ),
                        SizedBox(height: 5.w),
                        customTextField(
                          startIcon: const Icon(Icons.location_city),
                          hintText: 'برجاء اختيار المحافظة',
                          validator: (value) => Validator.generalField(value),
                          readOnly: true,
                          isPassword: false,
                          type: TextInputType.text,
                          controller: cubit.governorateController,
                          endIcon: PopupMenuButton<String>(
                            onSelected: (String newValue) {
                              setState(() {
                                dropdownvalue2 = newValue;
                                cubit.governorateController.text =
                                    dropdownvalue2;
                              });
                            },
                            itemBuilder: (BuildContext context) {
                              return governorates
                                  .map(
                                    (GovernoratesData value) =>
                                        PopupMenuItem<String>(
                                      value: value.governorateNameAr,
                                      child: Text(value.governorateNameAr),
                                      onTap: () {
                                        _getCities(id: value.id);
                                      },
                                    ),
                                  )
                                  .toList();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "المدينة",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.w,
                              color: BrandColors.primary),
                        ),
                        SizedBox(height: 5.w),
                        customTextField(
                          startIcon: const Icon(Icons.location_city),
                          hintText: 'برجاء اختيار المدينة',
                          validator: (value) => Validator.generalField(value),
                          readOnly: true,
                          isPassword: false,
                          type: TextInputType.text,
                          controller: cubit.cityController,
                          endIcon: PopupMenuButton<String>(
                            onSelected: (String newValue) {
                              setState(() {
                                dropdownvalue3 = newValue;
                                cubit.cityController.text = dropdownvalue3;
                              });
                            },
                            itemBuilder: (BuildContext context) {
                              return cities
                                  .map(
                                    (CitiesData value) => PopupMenuItem<String>(
                                      value: value.cityNameAr,
                                      child: Text(value.cityNameAr),
                                    ),
                                  )
                                  .toList();
                            },
                          ),
                        ),
                        Text(
                          "القرية / المنطقة",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.w,
                              color: BrandColors.primary),
                        ),
                        SizedBox(height: 5.w),
                        customTextField(
                            startIcon: const Icon(Icons.location_city),
                            hintText: 'برجاء ادخال اسم القرية او المنطقة',
                            validator: (value) => Validator.generalField(value),
                            isPassword: false,
                            type: TextInputType.text,
                            controller: cubit.villageController,
                            endIcon: null),
                        SizedBox(
                          height: 20.h,
                        ),
                        state is RegisterLoading
                            ? const Center(child: CircularProgressIndicator())
                            : Center(
                                child: customButton(
                                    text: 'التالي',
                                    onTap: () async {
                                      cubit.register(
                                          phone: widget.phone,
                                          countryCode: widget.countryCode);
                                    },
                                    context: context),
                              ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

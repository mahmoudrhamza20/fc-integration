import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared/core/utils/brand_colors.dart';
import 'package:shared/core/utils/cache_helper.dart';
import 'package:shared/cubits/get_governments_countries_cubit/cubit/getgovernmentsandcountries_cubit.dart';
import 'package:shared/cubits/register_cubit/cubit/register_cubit.dart';
import 'package:shared/models/get_cities_model.dart';
import 'package:shared/widgets/custom_button.dart';
import 'package:shared/widgets/custom_text_field.dart';
import '../core/utils/validator.dart';
import '../models/get_countries_model.dart';
import '../models/get_government_model.dart';

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
  late String dropdownvalue;
  late String dropdownvalue2;
  late String dropdownvalue3;
  late String dropdownvalue4;
  final List<String> items = [
    'male',
    'female',
  ];

  // List<GovernoratesData> governorates = [];
  // List<CitiesData> cities = [];

  // Future<void> _getGovernorates() async {
  //   final String jsonData =
  //       await rootBundle.loadString('assets/json/governorates.json');
  //   final List<dynamic> data = jsonDecode(jsonData)["data"];

  //   final List<GovernoratesData> parsedData = data.map((item) {
  //     return GovernoratesData(
  //       governorateNameAr: item["governorate_name_ar"], id: item["id"],
  //       governorateNameEn:
  //           item["governorate_name_en"], // Make sure this matches the JSON key
  //       // Map other fields here
  //     );
  //   }).toList();

  //   setState(() {
  //     governorates = parsedData;
  //   });
  // }

  // Future<void> _getCities({required String id}) async {
  //   final String jsonData =
  //       await rootBundle.loadString('assets/json/cities.json');
  //   final List<dynamic> data = await jsonDecode(jsonData)["data"];
  //   final List<CitiesData> parsedData = data.map((item) {
  //     return CitiesData(
  //         id: item["id"],
  //         governorateId: item["governorate_id"],
  //         cityNameAr: item["city_name_ar"],
  //         cityNameEn: item["city_name_en"]);
  //   }).toList();
  //   setState(() {
  //     cities = parsedData.where((city) => city.governorateId == id).toList();
  //   });
  // }

  @override
  void initState() {
    // _getGovernorates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(widget.phone);
    return SafeArea(
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          final cubit = RegisterCubit.of(context);
          return BlocBuilder<GetGovernmentsAndCountriesCubit,
              GetGovernmentsAndCountriesState>(
            builder: (context, countriesState) {
              final cubitCountries =
                  GetGovernmentsAndCountriesCubit.of(context);
              return SingleChildScrollView(
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
                      child: Form(
                        key: cubit.formKey,
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
                              hintText: ' برجاء إدخال الإسم (لا يقل عن ٤ حروف)',
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
                                isPassword:
                                    showPassword == false ? false : true,
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
                                isPassword:
                                    showCoPassword == false ? false : true,
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
                                validator: (value) =>
                                    Validator.generalField(value),
                                controller: cubit.dateController,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime.now());
                                  if (pickedDate != null) {
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);
                                    setState(() {
                                      cubit.dateController.text = formattedDate;
                                    });
                                  } else {}
                                },
                                hintText:
                                    ' برجاء إختيار تاريخ الميلاد (لا يقل عن ١٥ سنه )',
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
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      actionsAlignment:
                                          MainAxisAlignment.center,
                                      title: const Center(
                                          child: Text('برجاء اختيار النوع')),
                                      actions: [
                                        SizedBox(
                                          height: 100.h,
                                          width: 70.w,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: items.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return ListTile(
                                                contentPadding: EdgeInsets.zero,
                                                title: Text(items[index]),
                                                onTap: () {
                                                  setState(() {
                                                    dropdownvalue =
                                                        items[index];
                                                    cubit.genderController
                                                        .text = items[index];
                                                  });
                                                  Navigator.pop(context);
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );

                                // showModalBottomSheet(
                                //   context: context,
                                //   builder: (BuildContext context) {
                                //     return SizedBox(
                                //       height: 150,
                                //       child: ListView.builder(
                                //         itemCount: items.length,
                                //         itemBuilder:
                                //             (BuildContext context, int index) {
                                //           return ListTile(
                                //             title: Text(items[index]),
                                //             onTap: () {
                                //               setState(() {
                                //                 dropdownvalue = items[index];
                                //                 cubit.genderController.text =
                                //                     items[index];
                                //               });
                                //               Navigator.pop(context);
                                //             },
                                //           );
                                //         },
                                //       ),
                                //     );
                                //   },
                                // );
                              },
                              startIcon: const Icon(Icons.male),
                              hintText: 'برجاء اختيار النوع',
                              readOnly: true,
                              validator: (value) =>
                                  Validator.generalField(value),
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
                              "الدولة",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.w,
                                  color: BrandColors.primary),
                            ),
                            SizedBox(height: 5.w),
                            customTextField(
                              startIcon: const Icon(Icons.location_city),
                              hintText: 'برجاء اختيار الدولة',
                              validator: (value) =>
                                  Validator.generalField(value),
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
                                  return cubitCountries.countriesData
                                      .map(
                                        (Country value) =>
                                            PopupMenuItem<String>(
                                          value: value.name,
                                          child: Text(value.name),
                                          onTap: () async {
                                            await cubitCountries.getGovernments(
                                                countryId: value.id);
                                            await CacheHelper.saveData(
                                                key: 'countryId',
                                                value: value.id);
                                            //  print('countryId:${value.id}');
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
                              "المحافظة / المنطقة",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.w,
                                  color: BrandColors.primary),
                            ),
                            SizedBox(height: 5.w),
                            customTextField(
                              startIcon: const Icon(Icons.location_city),
                              hintText: 'برجاء اختيار المحافظة / المنطقة',
                              validator: (value) =>
                                  Validator.generalField(value),
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
                                  return cubitCountries.governmentData.isEmpty
                                      ? <PopupMenuEntry<String>>[
                                          const PopupMenuItem<String>(
                                            // value: 'لا يوجد بيانات',
                                            child: Text('لا يوجد بيانات'),
                                          ),
                                        ]
                                      : cubitCountries.governmentData
                                          .map(
                                            (Governorate value) =>
                                                PopupMenuItem<String>(
                                              value: value.name,
                                              child: Text(value.name),
                                              onTap: () async {
                                                await cubitCountries.getCities(
                                                    governmentId: value.id);
                                                await CacheHelper.saveData(
                                                    key: 'governmentId',
                                                    value: value.id);
                                                // print(
                                                //     'governmentId:${value.id}');
                                              },
                                            ),
                                          )
                                          .toList();
                                },
                              ),
                            ),
                            SizedBox(height: 10.w),
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
                              validator: (value) =>
                                  Validator.generalField(value),
                              readOnly: true,
                              isPassword: false,
                              type: TextInputType.text,
                              controller: cubit.villageController,
                              endIcon: PopupMenuButton<String>(
                                onSelected: (String newValue) {
                                  setState(() {
                                    dropdownvalue4 = newValue;
                                    cubit.villageController.text =
                                        dropdownvalue4;
                                  });
                                },
                                itemBuilder: (BuildContext context) {
                                  return cubitCountries.cityData.isEmpty
                                      ? <PopupMenuEntry<String>>[
                                          const PopupMenuItem<String>(
                                            // value: 'لا يوجد بيانات',
                                            child: Text('لا يوجد بيانات'),
                                          ),
                                        ]
                                      : cubitCountries.cityData
                                          .map(
                                            (City value) =>
                                                PopupMenuItem<String>(
                                              value: value.name,
                                              child: Text(value.name),
                                              onTap: () async {
                                                // await cubitCountries.getCities(
                                                //     governmentId: value.id);
                                                await CacheHelper.saveData(
                                                    key: 'cityId',
                                                    value: value.id);
                                                print('cityId:${value.id}');
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
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "القرية / الشارع",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.w,
                                color: BrandColors.primary),
                          ),
                          SizedBox(height: 5.w),
                          customTextField(
                            startIcon: const Icon(Icons.location_city),
                            hintText:
                                'برجاء ادخال اسم القرية او الشارع (اختيارى)',
                            // hintText: 'برجاء ادخال اسم القرية او المنطقة',
                            validator: (value) => Validator.generalField(value),
                            readOnly: false,
                            isPassword: false,
                            type: TextInputType.text,
                            controller: cubit.streetController,
                            endIcon: null,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                    state is RegisterLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Center(
                            child: customButton(
                                text: 'التالي',
                                onTap: () async {
                                  cubit.register(
                                    phone: widget.phone,
                                    countryCode: widget.countryCode,
                                    governorateId: CacheHelper.getData(
                                            key: 'governmentId') ??
                                        1,
                                    countryId:
                                        CacheHelper.getData(key: 'countryId') ??
                                            1,
                                    cityId:
                                        CacheHelper.getData(key: 'cityId') ?? 1,
                                  );
                                },
                                context: context),
                          ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  // void _showDropdown(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return SizedBox(
  //         child: ListView.builder(
  //           itemCount: items.length,
  //           itemBuilder: (BuildContext context, int index) {
  //             return ListTile(
  //               title: Text(items[index]),
  //               onTap: () {
  //                 setState(() {
  //                   dropdownvalue = items[index];
  //                 });
  //                 Navigator.pop(context);
  //               },
  //             );
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }
}

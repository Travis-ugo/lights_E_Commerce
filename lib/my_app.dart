// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/bloc/commerce/commerce_bloc.dart';
import 'package:lights_on_heights_e_commerce_assessment/presentation/route/app_router.dart';
import 'package:lights_on_heights_e_commerce_assessment/view_model/view_model.dart';

class MyApp extends StatelessWidget {
  MyApp({
    required ECommerceViewModelImp eCommerceViewModelImp,
    super.key,
  }) : _eCommerceViewModelImp = eCommerceViewModelImp;

  // This widget is the root of your application.
  final _appRouter = AppRouter();
  final ECommerceViewModelImp _eCommerceViewModelImp;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _eCommerceViewModelImp,
      child: BlocProvider(
        create: (_) =>
            CommerceBloc(eCommerceViewModelImp: _eCommerceViewModelImp)
              ..add(FetchItemsEvent())
              ..add(FetchAdsDataEvent()),
        child: MaterialApp.router(
          // hook up router to MaterialApp
          title: 'Lighs on Heights E-commerce',
          theme: ThemeData(
            fontFamily: 'Montserra',
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade800),
            useMaterial3: true,
          ),
          routerConfig: _appRouter.config(),
        ),
      ),
    );
  }
}

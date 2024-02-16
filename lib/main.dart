// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lights_on_heights_e_commerce_assessment/my_app.dart';
import 'package:lights_on_heights_e_commerce_assessment/view_model/view_model.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MyApp(
      eCommerceViewModelImp: ECommerceViewModelImp(),
    );
  }
}

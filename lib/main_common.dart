import 'package:flutter/material.dart';
import 'package:getx_tutorial/app/app.dart';
import 'package:getx_tutorial/app/binding/initial_binding.dart';
import 'package:getx_tutorial/flavors.dart';

Future<void> mainCommon(Flavor flavor) async {
  F.appFlavor = flavor;
  LocalResourceBinding.
  runApp(const MyApp());
}

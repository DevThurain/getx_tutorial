import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_tutorial/app/modules/testing/widgets/custom_form_field.dart';

import '../controllers/testing_controller.dart';

class TestingView extends GetView<TestingController> {
  TestingView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestingView'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomFormField(
                onChanged: (text) {},
                validator: (value) {
                  if (value == null || value.isEmpty == true) {
                    return "form field should not be empty";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: const Text("Validate"))
          ],
        ),
      ),
    );
  }
}

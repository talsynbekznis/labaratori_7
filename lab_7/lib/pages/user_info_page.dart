import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class SimpleRegistrationPage extends StatefulWidget {
  const SimpleRegistrationPage({super.key});

  @override
  State<SimpleRegistrationPage> createState() => _SimpleRegistrationPageState();
}

class _SimpleRegistrationPageState extends State<SimpleRegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('registration'.tr())),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: tr('full_name')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return tr('enter_name');
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: tr('email')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return tr('enter_email');
                  }
                  if (!value.contains('@')) {
                    return tr('invalid_email');
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: tr('phone')),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return tr('enter_phone');
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.h),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: tr('password'),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () => setState(() {
                      _obscurePassword = !_obscurePassword;
                    }),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return tr('enter_password');
                  if (value.length < 6) return tr('password_length');
                  return null;
                },
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(tr('registration_success'))),
                    );
                  }
                },
                child: Text(tr('submit')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

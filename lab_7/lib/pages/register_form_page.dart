import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/constants.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr('register'))),
      body: Padding(
        padding: AppStyles.formPadding,
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextField(_nameController, tr('full_name')),
              SizedBox(height: 10.h),
              buildTextField(_emailController, tr('email')),
              SizedBox(height: 10.h),
              buildTextField(_phoneController, tr('phone'), keyboardType: TextInputType.phone),
              SizedBox(height: 10.h),
              buildPasswordField(_passwordController, tr('password'), _obscurePassword, () {
                setState(() => _obscurePassword = !_obscurePassword);
              }),
              SizedBox(height: 10.h),
              buildPasswordField(_confirmPasswordController, tr('confirm_password'), _obscureConfirmPassword, () {
                setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
              }, confirm: true),
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

  Widget buildTextField(TextEditingController controller, String label, {TextInputType? keyboardType}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: AppStyles.inputText,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.clear),
                onPressed: () => setState(() => controller.clear()),
              )
            : null,
      ),
    );
  }

  Widget buildPasswordField(TextEditingController controller, String label, bool obscureText, VoidCallback toggle,
      {bool confirm = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: toggle,
        ),
      ),
      validator: (value) {
        if (!confirm) {
          if (value == null || value.isEmpty) return tr('enter_password');
          if (value.length < 8) return tr('password_length');
          if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{8,}$').hasMatch(value)) return tr('password_format');
        } else {
          if (value != _passwordController.text) return tr('passwords_do_not_match');
        }
        return null;
      },
    );
  }
}

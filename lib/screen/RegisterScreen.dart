import 'package:flutter/material.dart';
import 'ProfileScreen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل مستخدم')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // الاسم
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'الاسم'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الاسم مطلوب';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              // الإيميل
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'الإيميل'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الإيميل مطلوب';
                  }
                  if (!value.contains('@')) {
                    return 'صيغة الإيميل غير صحيحة';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              // كلمة المرور
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'كلمة المرور'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'كلمة المرور مطلوبة';
                  }
                  if (value.length < 6) {
                    return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              // تأكيد كلمة المرور
              TextFormField(
                controller: confirmPasswordController,
                decoration:
                    const InputDecoration(labelText: 'تأكيد كلمة المرور'),
                obscureText: true,
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'كلمتا المرور غير متطابقتين';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProfileScreen(
                          name: nameController.text,
                          email: emailController.text,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('تسجيل'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

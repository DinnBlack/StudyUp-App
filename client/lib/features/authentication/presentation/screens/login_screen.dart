import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_text_field.dart';
import 'package:client/core/constants/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObscure = true;
  bool _isSubmitting = false;

  late final PageController _pageController;
  int _currentPage = 0;
  late final Timer _timer;

  final List<String> _onboardImages = [
    'assets/images/onboard_1.jpg',
    'assets/images/onboard_2.jpg',
    'assets/images/onboard_3.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < _onboardImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);

      Future.delayed(const Duration(seconds: 2), () {
        setState(() => _isSubmitting = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login Successful')),
        );
      });
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.normal),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _onboardImages.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        _onboardImages[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                flex: 1,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text(
                        'Welcome Back!',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Please login to continue.',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 24),
                      CustomTextField(
                        controller: _emailController,
                        label: "Email",
                        hintText: "example@gmail.com",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email is required';
                          } else if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _passwordController,
                        label: "Password",
                        hintText: "Enter your password",
                        obscureText: _isObscure,
                        suffixIcon: _isObscure
                            ? "assets/icons/visibility-off.svg"
                            : "assets/icons/visibility-on.svg",
                        onSuffixIconTap: _togglePasswordVisibility,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _isSubmitting ? null : _submit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: _isSubmitting
                              ? const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          )
                              : const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

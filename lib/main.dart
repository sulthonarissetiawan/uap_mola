import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      // home: const LoginPage(),
      home: const SplashScreen(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  bool _rememberMe = false;
  
  final Color _primaryColor = const Color(0xFFFF6B35);
  final Color _textColor = const Color(0xFF2D2D2D);
  final Color _greyColor = const Color(0xFF9E9E9E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              
              // 1. LOGO ICON
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: _primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.business_center_rounded,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              
              const SizedBox(height: 24),

              // 2. HEADER TEXT
              Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: _textColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Sign in to continue to your account",
                style: TextStyle(
                  fontSize: 16,
                  color: _greyColor,
                ),
              ),

              const SizedBox(height: 32),

              // 3. INPUT FORM
              _buildTextField(
                label: "Email Address",
                icon: Icons.email_outlined,
                inputType: TextInputType.emailAddress,
              ),
              
              const SizedBox(height: 20),

              _buildTextField(
                label: "Password",
                icon: Icons.lock_outline,
                isPassword: true,
              ),

              const SizedBox(height: 16),

              // 4. REMEMBER ME
              Row(
                children: [
                  SizedBox(
                    height: 24, width: 24,
                    child: Checkbox(
                      value: _rememberMe,
                      activeColor: _primaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text("Remember me", style: TextStyle(color: _textColor, fontWeight: FontWeight.w500)),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text("Forgot Password?", style: TextStyle(color: _primaryColor, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // 5. SIGN IN BUTTON (LOGIKA NAVIGASI DISINI)
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  // 2. Tambahkan logika Navigator di sini
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const WalletPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // ... (Sisa kode ke bawah sama persis, tidak perlu diubah)
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Text("Or continue with", style: TextStyle(color: _greyColor))),
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(child: _buildSocialButton("Google", Icons.g_mobiledata)),
                  const SizedBox(width: 16),
                  Expanded(child: _buildSocialButton("Apple", Icons.apple)),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ", style: TextStyle(color: _greyColor, fontSize: 16)),
                  GestureDetector(
                    onTap: () {},
                    child: Text("Sign Up", style: TextStyle(color: _primaryColor, fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Widget Helper (Biarkan sama seperti sebelumnya)
  Widget _buildTextField({required String label, required IconData icon, bool isPassword = false, TextInputType inputType = TextInputType.text}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: TextField(
        obscureText: isPassword ? _obscurePassword : false,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: _greyColor),
          prefixIcon: Icon(icon, color: _greyColor),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(_obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: _greyColor),
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
      ),
    );
  }

  Widget _buildSocialButton(String text, IconData icon) {
    return Container(
      height: 56,
      decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28, color: Colors.black87),
            const SizedBox(width: 12),
            Text(text, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}
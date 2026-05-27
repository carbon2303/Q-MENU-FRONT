import 'package:flutter/material.dart';

import 'admin_screen.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // LOGIN TEMPORAL
    if (email == "admin@gmail.com" && password == "1234") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AdminScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Correo o contraseña incorrectos",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // IMAGEN
          Expanded(
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // LOGIN
          Expanded(
            flex: 4,
            child: Container(
              color: const Color(0xFFF5F1EA),
              child: Center(
                child: Container(
                  width: 420,
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 20,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // LOGO Y TÍTULO
                      Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/logo.png',
                              width: 140,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "¡Bienvenido!",
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Login ",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // EMAIL
                      const Text(
                        "Email",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 10),

                      CustomInput(
                        hint: "example@example.com",
                        controller: emailController,
                      ),

                      const SizedBox(height: 25),

                      // PASSWORD
                      const Text(
                        "Password",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 10),

                      CustomInput(
                        hint: "********",
                        obscure: true,
                        controller: passwordController,
                      ),

                      const SizedBox(height: 30),

                      // BOTÓN
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          text: "Entrar",
                          onPressed: login,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

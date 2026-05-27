import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Iniciar Sesión",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              const CustomInput(
                hint: "Correo",
              ),
              const SizedBox(height: 20),
              const CustomInput(
                hint: "Contraseña",
                obscure: true,
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: "Entrar",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

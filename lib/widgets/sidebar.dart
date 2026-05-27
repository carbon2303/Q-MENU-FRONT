import 'package:flutter/material.dart';

import '../screens/login_screen.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      color: const Color(0xFF1E1E2D),
      child: Column(
        children: [
          const SizedBox(height: 40),

          // LOGO
          Column(
            children: [
              Image.asset(
                'assets/logo.png',
                width: 120,
              ),
              const SizedBox(height: 15),
              const Text(
                "ADMIN PANEL",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // MENÚ
          menuItem(
            icon: Icons.dashboard,
            title: "Dashboard",
            onTap: () {},
          ),

          menuItem(
            icon: Icons.fastfood,
            title: "Productos",
            onTap: () {},
          ),

          menuItem(
            icon: Icons.receipt_long,
            title: "Órdenes",
            onTap: () {},
          ),

          menuItem(
            icon: Icons.people,
            title: "Clientes",
            onTap: () {},
          ),

          menuItem(
            icon: Icons.kitchen,
            title: "Cocina",
            onTap: () {},
          ),

          menuItem(
            icon: Icons.bar_chart,
            title: "Reportes",
            onTap: () {},
          ),

          const Spacer(),

          // CERRAR SESIÓN
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: menuItem(
              icon: Icons.logout,
              title: "Cerrar sesión",
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                  (route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget menuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hoverColor: Colors.white10,
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

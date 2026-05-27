import 'package:flutter/material.dart';
import 'login_screen.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  final List<Map<String, dynamic>> productos = [
    {
      "nombre": "Tacos de Barbacoa",
      "precio": "\$90",
      "imagen": "https://images.unsplash.com/photo-1613514785940-daed07799d9b",
    },
    {
      "nombre": "Pizza Pepperoni",
      "precio": "\$120",
      "imagen": "https://images.unsplash.com/photo-1513104890138-7c749659a591",
    },
    {
      "nombre": "Hamburguesa",
      "precio": "\$95",
      "imagen": "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
    },
  ];

  void cerrarSesion() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  Widget menuItem(
    IconData icon,
    String text,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.orange,
          ),
          const SizedBox(width: 15),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: Row(
        children: [
          // MENU LATERAL
          Container(
            width: 260,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),

                // LOGO
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                      image: AssetImage(
                        "assets/logo.png",
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "CLIENTE",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 35),

                menuItem(Icons.home, "Inicio"),
                menuItem(Icons.restaurant_menu, "Menú"),
                menuItem(Icons.shopping_cart, "Carrito"),
                menuItem(Icons.receipt_long, "Pedidos"),
                menuItem(Icons.favorite, "Favoritos"),
                menuItem(Icons.person, "Perfil"),

                GestureDetector(
                  onTap: cerrarSesion,
                  child: menuItem(
                    Icons.logout,
                    "Cerrar Sesión",
                  ),
                ),
              ],
            ),
          ),

          // CONTENIDO
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Bienvenido 🍔",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Selecciona tus platillos favoritos",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: GridView.builder(
                      itemCount: productos.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 25,
                        mainAxisSpacing: 25,
                        childAspectRatio: 0.78,
                      ),
                      itemBuilder: (context, index) {
                        final producto = productos[index];

                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              25,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              // IMAGEN
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(
                                      25,
                                    ),
                                  ),
                                  child: Image.network(
                                    producto["imagen"],
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(
                                  18,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      producto["nombre"],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      producto["precio"],
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 18,
                                    ),
                                    ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 14,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              "${producto["nombre"]} agregado al carrito",
                                            ),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.add_shopping_cart,
                                        color: Colors.white,
                                      ),
                                      label: const Text(
                                        "Agregar",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

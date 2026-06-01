import 'package:flutter/material.dart';
import 'login_screen.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  int paginaActual = 0;

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

  List<Map<String, dynamic>> carrito = [];

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
    String texto,
    int index,
  ) {
    bool seleccionado = paginaActual == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          paginaActual = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: seleccionado ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: seleccionado ? Colors.white : Colors.orange,
            ),
            const SizedBox(width: 15),
            Text(
              texto,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: seleccionado ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tarjetaInfo(
    String titulo,
    String valor,
    IconData icon,
  ) {
    return Expanded(
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.orange,
            ),
            const SizedBox(height: 10),
            Text(
              valor,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(titulo),
          ],
        ),
      ),
    );
  }

  Widget pantallaInicio() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Bienvenido 🍔",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            tarjetaInfo(
              "Productos",
              productos.length.toString(),
              Icons.fastfood,
            ),
            const SizedBox(width: 20),
            tarjetaInfo(
              "Carrito",
              carrito.length.toString(),
              Icons.shopping_cart,
            ),
            const SizedBox(width: 20),
            tarjetaInfo(
              "Pedidos",
              "3",
              Icons.receipt_long,
            ),
          ],
        ),
      ],
    );
  }

  Widget pantallaMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Menú de Platillos",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 25),
        Expanded(
          child: GridView.builder(
            itemCount: productos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 25,
              mainAxisSpacing: 25,
              childAspectRatio: .8,
            ),
            itemBuilder: (context, index) {
              final producto = productos[index];

              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                        child: Image.network(
                          producto["imagen"],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Text(
                            producto["nombre"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            producto["precio"],
                            style: const TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            onPressed: () {
                              setState(() {
                                carrito.add(producto);
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
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
    );
  }

  Widget pantallaCarrito() {
    if (carrito.isEmpty) {
      return const Center(
        child: Text(
          "Tu carrito está vacío",
          style: TextStyle(fontSize: 22),
        ),
      );
    }

    return ListView.builder(
      itemCount: carrito.length,
      itemBuilder: (context, index) {
        final producto = carrito[index];

        return Card(
          child: ListTile(
            leading: const Icon(Icons.fastfood),
            title: Text(producto["nombre"]),
            subtitle: Text(producto["precio"]),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  carrito.removeAt(index);
                });
              },
            ),
          ),
        );
      },
    );
  }

  Widget pantallaPedidos() {
    return ListView(
      children: const [
        Card(
          child: ListTile(
            leading: Icon(Icons.receipt_long),
            title: Text("Pedido #001"),
            subtitle: Text("Entregado"),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.receipt_long),
            title: Text("Pedido #002"),
            subtitle: Text("En camino"),
          ),
        ),
      ],
    );
  }

  Widget pantallaFavoritos() {
    return const Center(
      child: Text(
        "No tienes favoritos ❤️",
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Widget pantallaPerfil() {
    return Center(
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Cliente",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text("cliente@gmail.com"),
          ],
        ),
      ),
    );
  }

  Widget obtenerPantalla() {
    switch (paginaActual) {
      case 0:
        return pantallaInicio();
      case 1:
        return pantallaMenu();
      case 2:
        return pantallaCarrito();
      case 3:
        return pantallaPedidos();
      case 4:
        return pantallaFavoritos();
      case 5:
        return pantallaPerfil();
      default:
        return pantallaInicio();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: Row(
        children: [
          Container(
            width: 260,
            padding: const EdgeInsets.all(20),
            color: Colors.orange.shade100,
            child: Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    image: const DecorationImage(
                      image: AssetImage("assets/logo.png"),
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
                menuItem(Icons.home, "Inicio", 0),
                menuItem(Icons.restaurant_menu, "Menú", 1),
                menuItem(Icons.shopping_cart, "Carrito", 2),
                menuItem(Icons.receipt_long, "Pedidos", 3),
                menuItem(Icons.favorite, "Favoritos", 4),
                menuItem(Icons.person, "Perfil", 5),
                const Spacer(),
                GestureDetector(
                  onTap: cerrarSesion,
                  child: menuItem(
                    Icons.logout,
                    "Cerrar Sesión",
                    -1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: obtenerPantalla(),
            ),
          ),
        ],
      ),
    );
  }
}

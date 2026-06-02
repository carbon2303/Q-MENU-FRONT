import 'package:flutter/material.dart';
import 'login_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int paginaActual = 0;

  final List<Map<String, dynamic>> platillos = [
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
  ];

  void agregarPlatillo() {
    TextEditingController nombreController = TextEditingController();
    TextEditingController precioController = TextEditingController();
    TextEditingController imagenController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Agregar Platillos"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: "Nombre",
                ),
              ),
              TextField(
                controller: precioController,
                decoration: const InputDecoration(
                  labelText: "Precio",
                ),
              ),
              TextField(
                controller: imagenController,
                decoration: const InputDecoration(
                  labelText: "URL Imagen",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  platillos.add({
                    "nombre": nombreController.text,
                    "precio": precioController.text,
                    "imagen": imagenController.text,
                  });
                });

                Navigator.pop(context);
              },
              child: const Text("Guardar"),
            ),
          ],
        );
      },
    );
  }

  void eliminarPlatillo(int index) {
    setState(() {
      platillos.removeAt(index);
    });
  }

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
    String titulo,
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
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: seleccionado ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: seleccionado ? Colors.white : Colors.orange,
            ),
            const SizedBox(width: 12),
            Text(
              titulo,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: seleccionado ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            tarjetaInfo(
              "Platillos",
              platillos.length.toString(),
              Icons.restaurant,
            ),
            const SizedBox(width: 20),
            tarjetaInfo(
              "Pedidos",
              "15",
              Icons.shopping_cart,
            ),
            const SizedBox(width: 20),
            tarjetaInfo(
              "Clientes",
              "28",
              Icons.people,
            ),
          ],
        ),
      ],
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

  Widget pantallaPlatillos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Gestión de Platillos",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton.icon(
              onPressed: agregarPlatillo,
              icon: const Icon(Icons.add),
              label: const Text("Agregar"),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: GridView.builder(
            itemCount: platillos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: .8,
            ),
            itemBuilder: (context, index) {
              final platillo = platillos[index];

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        child: Image.network(
                          platillo["imagen"],
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Text(
                            platillo["nombre"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            platillo["precio"],
                            style: const TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () => eliminarPlatillo(index),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            label: const Text(
                              "Eliminar",
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

  Widget pantallaPedidos() {
    // Datos simulados para la vista de administración
    final List<Map<String, dynamic>> pedidos = [
      {
        "id": "#1023",
        "mesa": "Mesa 4",
        "total": "\$350",
        "estado": "En preparación",
        "colorEstado": Colors.orange,
        "items": ["2 Hamburguesas", "1 Papas", "2 Refrescos"]
      },
      {
        "id": "#1024",
        "mesa": "Mesa 8",
        "total": "\$120",
        "estado": "Listo",
        "colorEstado": Colors.green,
        "items": ["3 Tacos", "1 Coca Cola"]
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Panel de Pedidos",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: pedidos.length,
            itemBuilder: (context, index) {
              final pedido = pedidos[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pedido ${pedido['id']} - ${pedido['mesa']}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: pedido['colorEstado'],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              pedido['estado'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 25),
                      ...List.generate(
                        pedido['items'].length,
                        (i) => Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "• ${pedido['items'][i]}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const Divider(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total a cobrar: ${pedido['total']}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () {
                              // Acción para cambiar estado o finalizar
                            },
                            child: const Text(
                              "Completar",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Nueva vista para los clientes
  Widget pantallaClientes() {
    final List<Map<String, dynamic>> clientes = [
      {
        "nombre": "Carlos Mendoza",
        "telefono": "555-0192",
        "mesa": "Mesa 4",
        "visitas": "12 visitas",
      },
      {
        "nombre": "Ana Sofía Ruiz",
        "telefono": "555-0483",
        "mesa": "Mesa 8",
        "visitas": "5 visitas",
      },
      {
        "nombre": "Juan Pedro Gómez",
        "telefono": "555-0711",
        "mesa": "Para llevar",
        "visitas": "22 visitas",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Control de Clientes",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: clientes.length,
            itemBuilder: (context, index) {
              final cliente = clientes[index];

              return Card(
                margin: const EdgeInsets.only(bottom: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  leading: const CircleAvatar(
                    backgroundColor: Colors.orange,
                    radius: 25,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  title: Text(
                    cliente["nombre"],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("Tel: ${cliente['telefono']}"),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          cliente["mesa"],
                          style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        cliente["visitas"],
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget contenidoPrincipal() {
    switch (paginaActual) {
      case 0:
        return dashboard();

      case 1:
        return pantallaPlatillos();

      case 2:
        return pantallaPedidos();

      case 3:
        // Solución integrada directamente en el case para evitar errores de funciones faltantes
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Control de Clientes",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: const ListTile(
                      leading: CircleAvatar(backgroundColor: Colors.orange, child: Icon(Icons.person, color: Colors.white)),
                      title: Text("Carlos Mendoza", style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("Tel: 555-0192"),
                      trailing: Text("Mesa 4", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: const ListTile(
                      leading: CircleAvatar(backgroundColor: Colors.orange, child: Icon(Icons.person, color: Colors.white)),
                      title: Text("Ana Sofía Ruiz", style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text("Tel: 555-0483"),
                      trailing: Text("Mesa 8", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );

      case 4:
        return const Center(
          child: Text(
            "Ventas",
            style: TextStyle(fontSize: 30),
          ),
        );

      case 5:
        return const Center(
          child: Text(
            "Configuración",
            style: TextStyle(fontSize: 30),
          ),
        );

      default:
        return dashboard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
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
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage("assets/logo.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "ADMIN PANEL",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                menuItem(Icons.dashboard, "Dashboard", 0),
                menuItem(Icons.restaurant_menu, "Platillos", 1),
                menuItem(Icons.shopping_cart, "Pedidos", 2),
                menuItem(Icons.people, "Clientes", 3),
                menuItem(Icons.bar_chart, "Ventas", 4),
                menuItem(Icons.settings, "Configuración", 5),
                const Spacer(),
                GestureDetector(
                  onTap: cerrarSesion,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Cerrar Sesión",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: contenidoPrincipal(),
            ),
          ),
        ],
      ),
    );
  }
}
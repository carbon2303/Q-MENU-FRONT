import 'package:flutter/material.dart';
import '../widgets/dish_card.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Menú",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// BUSCADOR
            TextField(
              decoration: InputDecoration(
                hintText: "Buscar platillo...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 30),

            /// TITULO
            const Text(
              "Platillos Populares",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            /// GRID
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.78,
                children: const [
                  DishCard(
                    name: "Hamburguesa",
                    price: "\$120",
                    image:
                        "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
                  ),
                  DishCard(
                    name: "Pizza",
                    price: "\$180",
                    image:
                        "https://images.unsplash.com/photo-1513104890138-7c749659a591",
                  ),
                  DishCard(
                    name: "Tacos",
                    price: "\$90",
                    image:
                        "https://images.unsplash.com/photo-1552332386-f8dd00dc2f85",
                  ),
                  DishCard(
                    name: "Pasta",
                    price: "\$140",
                    image:
                        "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

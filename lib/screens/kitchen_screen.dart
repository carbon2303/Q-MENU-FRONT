import 'package:flutter/material.dart';

class KitchenScreen extends StatelessWidget {
  const KitchenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EA),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Kitchen Display System",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: [
            orderCard(
              table: "Mesa 4",
              order: "#1023",
              items: [
                "2 Hamburguesas",
                "1 Papas",
                "2 Refrescos",
              ],
              time: "12 min",
              statusColor: Colors.orange,
            ),
            orderCard(
              table: "Mesa 8",
              order: "#1024",
              items: [
                "3 Tacos",
                "1 Coca Cola",
              ],
              time: "5 min",
              statusColor: Colors.green,
            ),
            orderCard(
              table: "Mesa 1",
              order: "#1025",
              items: [
                "1 Pizza Familiar",
                "2 Pastas",
              ],
              time: "18 min",
              statusColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget orderCard({
    required String table,
    required String order,
    required List<String> items,
    required String time,
    required Color statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                table,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Text(
            order,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),

          const Divider(height: 30),

          /// ITEMS
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "• ${items[index]}",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          /// BOTON
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Marcar como listo",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_app/detail.dart';
import 'package:my_app/customItem.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userName = ModalRoute.of(context)?.settings.arguments;
    final List<CustomItem> data = [
      CustomItem(
          id: 0,
          title: "Phone",
          brand: "Apple",
          model: "Iphone 14 Pro Max",
          photoUrl:
              "https://images.unsplash.com/photo-1523206489230-c012c64b2b48?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGhvbmV8ZW58MHwxfDB8fHww",
          price: 300.99),
      CustomItem(
          title: "Laptop",
          id: 1,
          brand: "Asus",
          model: "Vivobook",
          photoUrl:
              "https://images.unsplash.com/photo-1576103200868-2dd3eec3f333?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bWFjYm9va3xlbnwwfDF8MHx8fDA%3D",
          price: 400)
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome " + userName.toString()),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detail(),
                  settings: RouteSettings(
                    arguments: data[index],
                  ),
                ),
              );
            },
            child: Card(
              child: ListTile(
                title: Text(data[index].title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID: ${data[index].id}"),
                    Text("Price: \$${data[index].price.toString()}"),
                  ],
                ),
                leading: Image.network(
                  data[index].photoUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

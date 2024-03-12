import 'package:flutter/material.dart';
import 'package:my_app/customItem.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CustomItem item =
        ModalRoute.of(context)?.settings.arguments as CustomItem;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.brand),
      ),
      body: Column(children: [
        AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            item.photoUrl,
            width: double.infinity,

            fit: BoxFit
                .cover, // Resmi istenen boyuta uyacak şekilde boyutlandırma
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32,vertical: 32),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Title:"),
                  Text(item.title),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Model:"),
                  Text(item.model),
                ],
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Price:"),
                  Text(item.price.toString()+"\$"),
                ],
              ),
              SizedBox(height: 24),
               ElevatedButton(
                onPressed: () => {},
                child: Text('Sepete Ekle'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        5), // İstenilen yuvarlaklık değerini ayarlayın
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

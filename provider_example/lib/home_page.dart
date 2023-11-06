import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/constants/mock_item_list.dart';

import 'cart_page.dart';
import 'cart_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Shopping'),
        actions: [
          Row(
            children: [
              Consumer<CartProvider>(builder: (context, provider, child) {
                return Text("${provider.items.length}");
              }),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_cart)),
            ],
          ),
        ],
      ),
      body: Center(
          child: ListView.builder(
              itemCount: mockItemList.length,
              itemBuilder: ((context, index) => ListTile(
                    title: Text(mockItemList[index].item),
                    subtitle: Text("Price: ${mockItemList[index].price}"),
                    trailing: IconButton(
                        onPressed: () {
                          context
                              .read<CartProvider>()
                              .addItem(mockItemList[index]);
                        },
                        icon: const Icon(Icons.add)),
                  )))),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';
import 'models/item_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ItemModel> itemList = context.read<CartProvider>().items;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: itemList.isEmpty
                ? const Center(
                    child: Text('Empty'),
                  )
                : ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    itemCount: itemList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(itemList[index].item),
                          Text("${itemList[index].price}"),
                        ],
                      );
                    }),
          ),
          ListTile(
            title: const Text(
              "Total price: ",
              style: TextStyle(fontSize: 30),
            ),
            trailing: Text(
              "${context.read<CartProvider>().totalPrice}",
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}



// class CartPage extends StatelessWidget {
//   const CartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<ItemModel> itemList = [];
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text('Cart'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: itemList.isEmpty
//                 ? const Center(
//                     child: Text('Empty'),
//                   )
//                 : ListView.builder(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                     itemCount: itemList.length,
//                     itemBuilder: (context, index) {
//                       return Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(itemList[index].item),
//                           Text("${itemList[index].price}"),
//                         ],
//                       );
//                     }),
//           ),
//           const ListTile(
//             title: Text(
//               "Total price: ",
//               style: TextStyle(fontSize: 30),
//             ),
//             trailing: Text(
//               "0",
//               style: TextStyle(fontSize: 30),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

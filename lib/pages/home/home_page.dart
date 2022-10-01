import 'package:flutter/material.dart';
import 'package:sumission_dicoding/pages/models/list_product.dart';

import 'detail_product.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        shadowColor: Colors.indigo,
        backgroundColor: Colors.white,
        title: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 5,
          ),
          width: MediaQuery.of(context).size.width * 0.6,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black12.withOpacity(0.05),
            borderRadius: BorderRadius.circular(25),
          ),
          child: const TextField(
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Search product',
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(
                vertical: 20,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black38,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.black38,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: const ListProduct(),
    );
  }
}

class ListProduct extends StatelessWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final ProductlistItem product = productList[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailProduct(product: product);
                },
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.only(bottom: 10),
            shadowColor: Colors.indigo,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide.none,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    product.imageAsset,
                    height: 150,
                    width: 150,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(product.price),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: productList.length,
    );
  }
}

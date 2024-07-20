import 'package:e_commerce_exam/view/extension.dart';
import 'package:e_commerce_exam/view/utils/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({super.key});

  @override
  State<Detailpage> createState() => _DetailPageState();
}

class _DetailPageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map product = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('CartPage');
            },
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ),
            ),
          ),
        ),
        title: const Text(
          'About Product',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Image(
            image: NetworkImage(product['thumbnail']),
          ),
          20.toHeight(),
          Align(
            alignment: Alignment.center,
            child: Text(
              product['title'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          5.toHeight(),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 10, color: Colors.grey, blurRadius: 20)
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          " M.R.P: ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.grey),
                        ),
                        2.toWidth(),
                        Text(
                          "${(product['price'] + (product['price'] * (product['discountPercentage'] / 100))).toStringAsFixed(2)} \$",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey),
                        ),
                        const Spacer(),
                      ],
                    ),
                    1.toHeight(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Price: ${product['price']} \$",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    5.toHeight(),
                    Container(
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 2)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(1),
                            child: RatingBar.builder(
                              initialRating: product['rating'].toDouble(),
                              direction: Axis.horizontal,
                              itemSize: 17,
                              allowHalfRating: true,
                              itemCount: 1,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                          ),
                          Text(
                            "${product['rating']}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    5.toHeight(),
                    Text(product['description']),
                    10.toHeight(),
                    const Text(
                      "Product information",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    5.toHeight(),
                    Text(
                      "Brand       :  ${product['brand']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    3.toHeight(),
                    Text(
                      "Weight     :  ${product['weight']} Grams",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    3.toHeight(),
                    Text(
                      "Catagory  :  ${product['category']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: const Text(
                              'Buy Now',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (!cartitem.contains(product)) {
                                cartitem.add(product);
                                product['qty'] = 1;
                              }
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: const Text(
                              'Add To Cart',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

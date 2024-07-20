import 'package:e_commerce_exam/view/extension.dart';
import 'package:e_commerce_exam/view/utils/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String selected = "All Products";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Home Page",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('CartPage');
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 45,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  20,
                ),
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.search_outlined,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: DropdownButton(
                value: selected,
                onChanged: (val) {
                  setState(() {
                    selected = val.toString();
                  });
                },
                items: [
                  const DropdownMenuItem(
                    value: 'All Products',
                    child: Text('All Products'),
                  ),
                  ...allCategory.map((e) {
                    return DropdownMenuItem(
                      child: Text(e.tcase),
                      value: e,
                    );
                  }),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: allProduct.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 0,
                  childAspectRatio: 0.55,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final e = allProduct[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('detail_page', arguments: e);
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(3, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                              height: size.height * 0.16,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.35),
                                    blurRadius: 15,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(
                                    e['thumbnail'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            10.toHeight(),
                            Text(
                              e['title'],
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            8.toHeight(),
                            Row(
                              children: [
                                const Text('Price :'),
                                Text(
                                  "\$ ${e['price'].toString()}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            5.toHeight(),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: RatingBar.builder(
                                initialRating: e['rating'].toDouble(),
                                direction: Axis.horizontal,
                                itemSize: 12,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                            ),
                            8.toHeight(),
                            SizedBox(
                              width: size.width * 0.30,
                              child: TextButton(
                                onPressed: () {
                                  (!cartitem.contains(e))
                                      ? cartitem.add(e)
                                      : false;
                                },
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
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

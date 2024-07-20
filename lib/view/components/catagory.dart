// import 'package:e_commerce_exam/view/extension.dart';
// import 'package:e_commerce_exam/view/utils/product.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//
// Widget Catagory(
//     {required Size size,
//     required,
//     required selected,
//     RangeValues slidervalue = const RangeValues(1, 10000)}) {
//   return Column(
//     children: [
//       Expanded(
//         child: GridView.builder(
//           itemCount: allProduct.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 10,
//             crossAxisSpacing: 0,
//             childAspectRatio: 0.55,
//           ),
//           itemBuilder: (BuildContext context, int index) {
//             final e = allProduct[index];
//             return GestureDetector(
//               onTap: () {
//                 Navigator.of(context).pushNamed('detail_page', arguments: e);
//               },
//               child: Container(
//                 margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.grey,
//                       blurRadius: 5,
//                       offset: Offset(3, 3),
//                     ),
//                   ],
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     children: [
//                       Container(
//                         height: size.height * 0.16,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Color.fromRGBO(0, 0, 0, 0.35),
//                               blurRadius: 15,
//                               offset: Offset(0, 5),
//                             ),
//                           ],
//                           image: DecorationImage(
//                             image: NetworkImage(
//                               e['thumbnail'],
//                             ),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       10.toHeight(),
//                       Text(
//                         e['title'],
//                         textAlign: TextAlign.start,
//                         maxLines: 2,
//                         style: const TextStyle(
//                           overflow: TextOverflow.ellipsis,
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       8.toHeight(),
//                       Row(
//                         children: [
//                           const Text('Price :'),
//                           Text(
//                             "\$ ${e['price'].toString()}",
//                             style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       5.toHeight(),
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: RatingBar.builder(
//                           initialRating: e['rating'].toDouble(),
//                           direction: Axis.horizontal,
//                           itemSize: 12,
//                           allowHalfRating: true,
//                           itemCount: 5,
//                           itemBuilder: (context, _) => const Icon(
//                             Icons.star,
//                             color: Colors.amber,
//                           ),
//                           onRatingUpdate: (rating) {},
//                         ),
//                       ),
//                       8.toHeight(),
//                       SizedBox(
//                         width: size.width * 0.30,
//                         child: TextButton(
//                           onPressed: () {
//                             (!cartitem.contains(e)) ? cartitem.add(e) : false;
//                           },
//                           style: TextButton.styleFrom(
//                             backgroundColor: Colors.blue,
//                           ),
//                           child: const Text(
//                             'Buy Now',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     ],
//   );
// }

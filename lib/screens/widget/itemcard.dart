import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String description;
  final int total;
  final int amount;

  const ItemCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.total,
      required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => ListItemDetails(
        //             title: cardTitle,
        //             description: cardDescription,
        //           )),
        // );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 10,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          description,
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                    const Image(
                        image: AssetImage("assets/images/company.jpeg")),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Theme.of(context).primaryColorLight,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Totals: ${total.toString()}"),
                    Text(
                      '\$ ${amount.toString()}',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// Scaffold(
//       body: Container(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Card(
//             elevation: 5.0,
//             child: SizedBox(
//               height: 90,
//               child: Row(
//                 children: [
//                   const SizedBox(
//                     width: 10.0,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         title,
//                         style: TextStyle(
//                             fontSize: 16.0, fontWeight: FontWeight.w700),
//                       ),
//                       Text(
//                         description,
//                         style: TextStyle(fontSize: 12.0),
//                       ),
//                       SizedBox(
//                         height: 10.0,
//                       ),
//                       Image(
//                           image: AssetImage("assets/images/company.jpeg")),
//                     ],
//                   ),
//                   // const Expanded(child: SizedBox()),
//                   Container(
//                       decoration: BoxDecoration(
//                           color: Colors.blueAccent,
//                           borderRadius: const BorderRadius.only(
//                               topRight: Radius.circular(5),
//                               bottomRight: Radius.circular(5))),
//                       height: 90,
//                       width: 79,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         // crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Totals ${total.toString()}',
//                             style: TextStyle(fontSize: 12.0),
//                           ),
//                           Text(
//                             '\$ ${amount.toString()}',
//                             style: TextStyle(fontSize: 18.0),
//                           ),
//                         ],
//                       ))
//                 ],
//               ),
//             ),
//           ),
//         ],
//       )),
//     );
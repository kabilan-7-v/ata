// // ignore_for_file: use_key_in_widget_constructors

// import 'package:flutter/material.dart';

// class Tickethistory extends StatelessWidget {
//   const Tickethistory({super.key});
//   final int value = 55;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         backgroundColor: Colors.grey[200],
//         leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: const Icon(Icons.arrow_back_ios)),
//         elevation: 0,
//         scrolledUnderElevation: 0,
//         title: const Text(
//           "Ticket History",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 155, child: EventCard()),
//             SizedBox(height: 155, child: EventCard()),
//             SizedBox(height: 155, child: EventCard()),
//             SizedBox(height: 155, child: EventCard()),
//             SizedBox(height: 155, child: EventCard()),
//             SizedBox(height: 155, child: EventCard()),
//             SizedBox(height: 155, child: EventCard()),

//             // customcontanier(
//             //     context, "Yoga Day", "55", "C5,C6", "6th July, 2024 - 4:00 PM"),
//             // customcontanier(context, "Flowers Day", "65", "A5,A6,A8",
//             //     "6th July, 2024 - 4:00 PM"),
//             // customcontanier(context, "Sports Day", "205", "H5,C6,G7",
//             //     "6th July, 2024 - 4:00 PM"),
//             // customcontanier(context, "Pongal Celebration", "82", "J2,C6",
//             //     "6th July, 2024 - 4:00 PM"),
//             // customcontanier(context, "Bogi Celebration", "15", "B1,B2,B3",
//             //     "6th July, 2024 - 4:00 PM"),
//           ],
//         ),
//       ),
//     );
//   }

//   // Widget customcontanier(BuildContext context, eventname, amount, seats, date) {
//   //   return Padding(
//   //     padding: const EdgeInsets.symmetric(vertical: 10),
//   //     child: Container(
//   //       decoration: const BoxDecoration(
//   //           color: Colors.white,
//   //           borderRadius: BorderRadius.only(topRight: Radius.circular(150))),
//   //       child: Padding(
//   //         padding: const EdgeInsets.only(left: 8),
//   //         child: Column(
//   //           crossAxisAlignment: CrossAxisAlignment.start,
//   //           children: [
//   //             customtext(15, 30, "Event Name",
//   //                 const Color.fromRGBO(96, 95, 95, 1), 14, FontWeight.normal),
//   //             customtext(35, 30, eventname,
//   //                 const Color.fromRGBO(225, 104, 17, 1), 16, FontWeight.w500),
//   //             customtext(85, 30, "Date", const Color.fromRGBO(96, 95, 95, 1),
//   //                 14, FontWeight.normal),
//   //             customtext(110, 30, date, const Color.fromRGBO(96, 95, 95, 1), 17,
//   //                 FontWeight.bold),
//   //           ],
//   //         ),
//   // Column(
//   //   children: [
//   //     // Container(
//   //     //   height: 15,
//   //     //   width: 15,
//   //     //   decoration: const BoxDecoration(
//   //     //       color: ataBackgroundcolor,
//   //     //       shape: BoxShape.circle),
//   //     // ),
//   //     customline(10),
//   //     customline(15),
//   //     customline(20),
//   //     customline(25),
//   //     customline(30),
//   //     customline(35),
//   //     customline(40),
//   //     customline(45),
//   //     customline(50),
//   //     customline(55),
//   //     customline(60),
//   //     customline(65),
//   //     customline(70),
//   //     customline(75),
//   //     customline(80),
//   //     customline(85),
//   //     customline(90),
//   //     customline(95),
//   //     customline(100),
//   //     customline(105),
//   //     customline(110),
//   //     customline(115),
//   //     customline(120),
//   //     customline(125),
//   //     customline(130),
//   //     customline(135),
//   //     customline(140),
//   //     customline(145),
//   //     customline(150),
//   //     customline(155),
//   //     // Container(
//   //     //   height: 15,
//   //     //   width: 15,
//   //     //   decoration: const BoxDecoration(
//   //     //       color: ataBackgroundcolor,
//   //     //       shape: BoxShape.circle),
//   //     // ),
//   //   ],
//   // ),
//   //     const SizedBox(
//   //       width: 25,
//   //     ),
//   //     Column(
//   //       crossAxisAlignment: CrossAxisAlignment.start,
//   //       children: [
//   //         customtext(
//   //             15,
//   //             320,
//   //             "Total Amount",
//   //             const Color.fromRGBO(96, 95, 95, 1),
//   //             14,
//   //             FontWeight.normal),
//   //         customtext(
//   //             38,
//   //             320,
//   //             "\$$amount",
//   //             const Color.fromRGBO(96, 95, 95, 1),
//   //             14,
//   //             FontWeight.bold),
//   //         customtext(
//   //             85,
//   //             320,
//   //             "Seats",
//   //             const Color.fromRGBO(96, 95, 95, 1),
//   //             14,
//   //             FontWeight.normal),
//   //         customtext(
//   //             110,
//   //             320,
//   //             seats,
//   //             const Color.fromRGBO(96, 95, 95, 1),
//   //             16,
//   //             FontWeight.bold),
//   //       ],
//   //     )
//   //   ],
//   // ),
//   //       ),
//   //     ),
//   //   );
//   // }

// //   customline(double height) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 1),
// //       child: Container(
// //         height: 3,
// //         width: 2,
// //         decoration: const BoxDecoration(
// //           color: ataBackgroundcolor,
// //         ),
// //       ),
// //     );
// //   }

// //   customtext(double x, double y, text, color, double size, bold) {
// //     return Text(
// //       text,
// //       style: TextStyle(
// //         fontSize: size,
// //         color: color,
// //         fontWeight: bold,
// //       ),
// //     );
// //   }
// // }
// }

// class EventCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: Center(
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 2,
//                 blurRadius: 5,
//                 offset: const Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Row for Event Name and Total Amount
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Event Name",
//                           style: TextStyle(
//                               fontSize: 12, color: Colors.grey.shade700),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           "Yoga Day",
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.deepOrange),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text(
//                           "Total Amount",
//                           style: TextStyle(
//                               fontSize: 12, color: Colors.grey.shade700),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           "\$55",
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               // Row for Date and Seats
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Date",
//                           style: TextStyle(
//                               fontSize: 12, color: Colors.grey.shade700),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           "6th July, 2024 - 4:00 PM",
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text(
//                           "Seats",
//                           style: TextStyle(
//                               fontSize: 12, color: Colors.grey.shade700),
//                         ),
//                         const SizedBox(height: 4),
//                         const Text(
//                           "C5, C6",
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w500),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

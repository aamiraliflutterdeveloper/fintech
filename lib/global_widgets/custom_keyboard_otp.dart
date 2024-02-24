// import 'package:fintech_app/screens/blue_bg_screens/otp_screen/count_down_timer.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// import '../constants/assets_path.dart';
// import '../screens/account_verification_screen/account_verification_screen.dart';
// import 'keyboard_key.dart';
//
// class CustomKeyboardOTP extends StatefulWidget {
//   @override
//   _CustomKeyboardOTPState createState() => _CustomKeyboardOTPState();
// }
//
// class _CustomKeyboardOTPState extends State<CustomKeyboardOTP>
//     with TickerProviderStateMixin {
//   List<List<dynamic>>? keys;
//   String? amount;
//   AnimationController? _controller;
//   int levelClock = 30;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//         vsync: this,
//         duration: Duration(
//             seconds:
//                 levelClock) // gameData.levelClock is a user entered number elsewhere in the applciation
//         );
//     _controller!.forward();
//
//     keys = [
//       ['1', '2', '3'],
//       ['4', '5', '6'],
//       ['7', '8', '9'],
//       ['.', '0', Icon(Icons.cancel)],
//     ];
//
//     amount = '';
//   }
//
//   onKeyTap(val) {
//     if (val == '0' && amount!.length == 0) {
//       return;
//     }
//
//     setState(() {
//       amount = (amount! + val);
//     });
//   }
//
//   onBackspacePress() {
//     if (amount!.length == 0) {
//       return;
//     }
//
//     setState(() {
//       amount = amount!.substring(0, amount!.length - 1);
//     });
//   }
//
//   renderKeyboard() {
//     return keys!
//         .map(
//           (x) => Row(
//             children: x.map(
//               (y) {
//                 return Expanded(
//                   child: KeyboardKey(
//                     label: y,
//                     value: y,
//                     onTap: (val) {
//                       if (val is Widget) {
//                         onBackspacePress();
//                       } else {
//                         onKeyTap(val);
//                       }
//                     },
//                   ),
//                 );
//               },
//             ).toList(),
//           ),
//         )
//         .toList();
//   }
//
//   String display = '';
//   renderAmount() {
//     TextStyle style = TextStyle(
//       fontSize: 30.0,
//       fontWeight: FontWeight.bold,
//       color: display.isEmpty ? Color(0xFFC7C7CC) : Colors.black,
//     );
//
//     if (this.amount!.length > 0) {
//       NumberFormat f = NumberFormat('#,###');
//
//       display = f.format(int.parse(amount!));
//       style = style.copyWith(
//         color: Colors.black,
//       );
//     }
//
//     return Expanded(
//       child: Container(
//         height: 161,
//         color: Color(0xFFF1F1F1),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     display.isEmpty ? '0000000' : display,
//                     style: style,
//                   ),
//                   SizedBox(
//                     width: 50,
//                   ),
//                   display.length < 11
//                       ? Container(
//                           color: Colors.white,
//                         )
//                       : Image.asset(
//                           AssetsPath.phoneVerified,
//                           height: 17,
//                           width: 17,
//                         ),
//                 ],
//               ),
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//                   child: Text(
//                     "Please dont share your code",
//                     style: TextStyle(
//                       fontFamily: 'Roboto-Regular',
//                       fontWeight: FontWeight.bold,
//                       fontSize: 14,
//                       letterSpacing: .5,
//                       color: Color(0xFF323232),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Countdown(
//                   animation: StepTween(
//                     begin: levelClock, // THIS IS A USER ENTERED NUMBER
//                     end: 0,
//                   ).animate(_controller!),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * .6,
//       child: Column(
//         children: [
//           renderAmount(),
//           ...renderKeyboard(),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 15),
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: 57.0,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30.0),
//                   color: Colors.white,
//                   border: Border.all(color: Color(0xFF255AA8), width: 2)),
//               child: FlatButton(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Continue",
//                         style: TextStyle(
//                             color: display.length < 11
//                                 ? Color(0xFF255AA8)
//                                 : Colors.white,
//                             fontSize: 20),
//                       ),
//                       Image.asset(
//                         display.length < 11
//                             ? AssetsPath.blueArrow
//                             : AssetsPath.whiteArrow,
//                         width: 25,
//                       )
//                     ],
//                   ),
//                 ),
//                 textColor: Color(0xFF255AA8),
//                 color: display.length < 11
//                     ? Colors.transparent
//                     : Color(0xFF255AA8),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0)),
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => AccountVerificationScreen()));
//                 },
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

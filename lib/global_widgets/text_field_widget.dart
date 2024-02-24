import 'package:flutter/material.dart';

class CustomWidgets {
  static Widget textField({title, textController}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(
              title.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 2,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Resevior Name",
                fillColor: Color(0xFFF1F1F1),
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color(0xFFF1F1F1), width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Custom Text Field'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(30),
//           child: Column(
//             children: [
//               CustomWidgets.textField('Single-Line Text Field'),
//               SizedBox(
//                 height: 10,
//               ),
//               CustomWidgets.textField('Multi-Line Text Filed', lines: 3),
//               SizedBox(
//                 height: 10,
//               ),
//               CustomWidgets.textField('Password Field', isPassword: true),
//               SizedBox(
//                 height: 10,
//               ),
//               CustomWidgets.textField('Number Password Field',
//                   isPassword: true, isNumber: true, length: 10),
//               SizedBox(
//                 height: 10,
//               ),
//               CustomWidgets.textField('Corner Radius', cornerRadius: 10.0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:leadingmanagementsystem/utils/colors.dart';
// import 'package:url_launcher/url_launcher.dart';

// class LeadsAdminPage extends StatefulWidget {
//   const LeadsAdminPage({super.key});

//   @override
//   State<LeadsAdminPage> createState() => _LeadsAdminPageState();
// }

// class _LeadsAdminPageState extends State<LeadsAdminPage> {
//   @override
//   void initState() {
//    func();
//     super.initState();
//   }
//   func()async{
//       Uri mail = Uri.parse("https://cherritech.us/proelevators/admin/authentication/?staff_user_id=1&staff_logged_in=1&apifrom=leadlist");
//                       if (await launchUrl(mail)) {
//                           //email app opened
//                       }else{
//                           //
//                       }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appcolor,
//       ),
//     );
//   }
// }
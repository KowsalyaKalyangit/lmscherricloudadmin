import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/leads_view_controller.dart';

import 'package:leadingmanagementsystem/utils/textstyles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/leads_details_controller.dart';
import 'lead_assign.dart';
import 'leads_details_page.dart';

class LeadPage extends StatefulWidget {
  const LeadPage({super.key});

  @override
  State<LeadPage> createState() => _LeadPageState();
}

class _LeadPageState extends State<LeadPage> {
  LeadsDetailsController leadsDetailsController =
      Get.put(LeadsDetailsController());
      LeadsViewController leadsViewController=Get.put(LeadsViewController());
  var status = ['Converted', 'Pending'];
  @override
  void initState() {
    leadsDetailsController.leadsDetailsController();
leadsViewController.leadsViewController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appcolor,
        title: Text(
          'Leads',
          style: toptitleStyle,
        ),
      ),
       
     
      body: Obx(() {
        if (leadsDetailsController.isLeadsDetailsLoad.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (leadsDetailsController.getleadsdetails[0].data.isEmpty) {
          return Center(
            child:InkWell(
               onTap: () async{
                                       Uri mail = Uri.parse(leadsViewController.getleadsviewstatus[0].data[0].link.toString());
                      if (await launchUrl(mail)) {
                          //email app opened
                      }else{
                          //
                      }
                                        // Get.to(LeadsDetailsPage(
                                        //     name: data.name.toString(),
                                        //     id: data.id.toString()));
                                      },
              child: Container(
                height: 5.0.hp,
                width: 30.0.wp,
                decoration: BoxDecoration(
                  color: appcolor,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Center(child: Text('Add New Lead',style: subtitleStylecolor,),),
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 8),
            child: ListView.builder(
                itemCount:
                    leadsDetailsController.getleadsdetails[0].data.length,
                itemBuilder: (context, index) {
                  var data =
                      leadsDetailsController.getleadsdetails[0].data[index];
                  return Stack(
                    children: [
                      Container(
                          height: 20.0.hp,
                          width: 100.0.wp,
                          child: Card(
                            color: appcolor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(05)),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Name :",
                                            style: listtitlecolor,
                                          ),
                                          Text(
                                            data.name,
                                            style: listtitlecolor,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Email : ",
                                            style: listtitlecolor,
                                          ),
                                          Text(
                                            data.email,
                                            style: listtitlecolor,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Phone : ",
                                            style: listtitlecolor,
                                          ),
                                          Text(
                                            data.phonenumber == ''
                                                ? 'XXXXX'
                                                : data.phonenumber,
                                            style: listtitlecolor,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Company : ",
                                            style: listtitlecolor,
                                          ),
                                          Text(
                                            data.customer,
                                            style: listtitlecolor,
                                          ),
                                        ],
                                      ),
                                    ),
                                    CustomPaint(
                                      size: Size(355, 1), // Size of the line
                                      painter: DottedLinePainter(),
                                    ),
                                    InkWell(
                                      onTap: () async{
                                       Uri mail = Uri.parse(leadsViewController.getleadsviewstatus[0].data[0].link.toString());
                      if (await launchUrl(mail)) {
                          //email app opened
                      }else{
                          //
                      }
                                        // Get.to(LeadsDetailsPage(
                                        //     name: data.name.toString(),
                                        //     id: data.id.toString()));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 2),
                                        child: Text(
                                          'View Leads',
                                          style: GoogleFonts.jost(
                                              textStyle: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                      decorationColor: Colors.blue,
                                                  fontSize: 10.00.sp,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                      Positioned(
                        right: 10,
                        top: 8,
                        child: Container(
                          height: 4.0.hp,
                          width: 25.0.wp,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: data.status == 'Final Status'
                                  ? Colors.green[900]
                                  : data.status == 'Proposal Submited'
                                      ? Colors.amber[900]
                                      : data.status == 'Customer'
                                          ? Colors.amber[700]
                                          : Colors.red.shade400),
                          child: Center(
                            child: Text(
                              data.status,
                              style: statusstyle,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }),
          );
        }
      }),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final dashWidth = 4;
    final dashSpace = 5;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

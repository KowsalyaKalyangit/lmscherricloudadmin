import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:leadingmanagementsystem/utils/textstyles.dart';
import 'package:leadingmanagementsystem/utils/utils.dart';

import '../../controller/dashboard_controller.dart';

class LeadsViewList extends StatefulWidget {
  const LeadsViewList({super.key});

  @override
  State<LeadsViewList> createState() => _LeadsViewListState();
}

class _LeadsViewListState extends State<LeadsViewList> {
  DashboardController dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor,
        automaticallyImplyLeading: false,
        title: Text(
          'Leads List',
          style: toptitleStyle,
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: screenbackground,
          ),
        ),
      ),
      body: 
      dashboardController.getdashboarddetails[0].leadslist.isEmpty?Center(child: Text('No data Found',),):
      ListView.builder(
          itemCount:
              dashboardController.getdashboarddetails[0].leadslist.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, leadindex) {
            var leaddata =
                dashboardController.getdashboarddetails[0].leadslist[leadindex];
            leadindex = leadindex + 1;

            return Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Card(
                child: Container(
                  height: 6.0.hp,
                  width: 100.0.wp,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 15.0.wp,
                          child: CircleAvatar(
                              radius: 15,
                              child: Text(
                                leadindex.toString(),
                                style: listview,
                              ))),
                      SizedBox(
                        width: 5.0.wp,
                      ),
                      Container(
                          width: 35.0.wp,
                          child: Text(
                            leaddata.name,
                            style: listview,
                          )),
                      Container(
                          height: 3.0.hp,
                          width: 30.0.wp,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color:   leaddata.status=='Final Status'?Colors.green[300]:
                        leaddata.status=='Proposal Submited'?Colors.purple[300]:leaddata.status=='Customer'?Colors.amber[300]
                       : Colors.red.shade300),
                          child: Center(
                              child: Text(
                            leaddata.status!,
                            style: formhintstylecolor,
                          ))),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

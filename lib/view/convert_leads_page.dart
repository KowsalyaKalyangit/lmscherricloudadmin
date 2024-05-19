 import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/conveted_leads_controller.dart';

import '../utils/textstyles.dart';

class ConvertedLeadsScreen extends StatefulWidget {
  const ConvertedLeadsScreen({super.key});

  @override
  State<ConvertedLeadsScreen> createState() => _ConvertedLeadsScreenState();
}

class _ConvertedLeadsScreenState extends State<ConvertedLeadsScreen> {
  ConvertedLeadsController convertedLeadsController=Get.put(ConvertedLeadsController());
  @override
  void initState() {
   convertedLeadsController.convertedLeadsController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back,color: screenbackground,)),
        backgroundColor: appcolor,title: Text('Converted Leads',style: toptitleStyle,),),
        body: Obx((){
if(convertedLeadsController.isleadLoad.value){
  return Center(child: CircularProgressIndicator(),);
}
else if(convertedLeadsController.getnotification[0].data.isEmpty){
  return Center(child: Text('No Data Found'),);
}
else{
          return Padding(
            padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 8),
            child: ListView.builder(
              itemCount:convertedLeadsController.getnotification[0].data.length,
              itemBuilder: (context,index){
              return Stack(
                children: [
                  Container(
                    height: 18.0.hp,
                    width: 100.0.wp,
                     
                    child: Card(
                      color: appcolor,
                      shape: RoundedRectangleBorder(
                        
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(children: [
                   convertedLeadsController.getnotification[0].data[index].profileimg==''||convertedLeadsController.getnotification[0].data[index].profileimg.isEmpty?
                   Image.asset('assets/logo.png',height: 8.0.hp,width: 20.0.wp,):
                        Image.network(convertedLeadsController.getnotification[0].data[index].profileimg.toString(),height: 8.0.hp,width: 20.0.wp,),
                        SizedBox(width: 2.0.wp,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Row(
                            children: [
                              Text('Name:',style: listtitlecolor,),
                               Text(convertedLeadsController.getnotification[0].data[index].name.toString(),style: listtitlecolor,),
                            ],
                           ),
                            Row(
                            children: [
                              Text('email:',style: listtitlecolor,),
                               Text(convertedLeadsController.getnotification[0].data[index].email.toString(),style: listtitlecolor,),
                            ],
                           ),Row(
                            children: [
                              Text('Phone:',style: listtitlecolor,),
                               Text(convertedLeadsController.getnotification[0].data[index].phonenumber.toString(),style: listtitlecolor,),
                            ],
                           ),Row(
                            children: [
                              Text('Company:',style: listtitlecolor,),
                               Text(convertedLeadsController.getnotification[0].data[index].company.toString(),style: listtitlecolor,),
                            ],
                           ),
                             Row(
                            children: [
                              Text('Assigned by:',style: formstyle,),
                               Text(convertedLeadsController.getnotification[0].data[index].assignedby.toString(),style: listtitlecolor,),
                            ],
                           ),
                          ],
                        )
                      ],),
                    )
                    
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        height: 4.0.hp,
                        width: 25.0.wp,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color:  Colors.green[600] ),
                        child: Center(
                          child:  Text(convertedLeadsController.getnotification[0].data[index].status.toString(),style: listtitlecolor,),
                        ),
                      ),
                    )
                ],
              );
            }),
          );
  }}),
    );
  }
}

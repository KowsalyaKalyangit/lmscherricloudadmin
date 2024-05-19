
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
 
import 'package:leadingmanagementsystem/model/leads_view_response.dart';
 
import 'package:leadingmanagementsystem/service/leads_view_service.dart';
  

class LeadsViewController extends GetxController{
  List<LeadsViewModel> _leadsviewstatus=[];
  List<LeadsViewModel> get getleadsviewstatus=>_leadsviewstatus;
   RxBool isleadsviewstatusLoad = true.obs;
   LeadsViewService leadsViewService=LeadsViewService();
  Future leadsViewController() async {
    isleadsviewstatusLoad(true);
    try {
      var response = await leadsViewService.leadsViewService();
      log(response.toString());
      if (response != null) {
        _leadsviewstatus.clear();
        print('res---------------$response');
        _leadsviewstatus.add(response);
       
           
      
        isleadsviewstatusLoad(false);
        
         
      } else {
        isleadsviewstatusLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
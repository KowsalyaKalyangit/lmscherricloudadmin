
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/agreement_response.dart';
import 'package:leadingmanagementsystem/service/agreement_service.dart';
 
 
 
import 'package:leadingmanagementsystem/service/leads_view_service.dart';
  

class AgreementController extends GetxController{
  List<AgreementModel> _agreementdetails=[];
  List<AgreementModel> get getagreementdetails=>_agreementdetails;
   RxBool isagreemnentLoad = true.obs;
   AgreementService agreementService=AgreementService();
  Future agreementController() async {
    isagreemnentLoad(true);
    try {
      var response = await agreementService.agreementService();
      log(response.toString());
      if (response != null) {
        _agreementdetails.clear();
        print('res---------------$response');
        _agreementdetails.add(response);
       
           
      
        isagreemnentLoad(false);
        
         
      } else {
        isagreemnentLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
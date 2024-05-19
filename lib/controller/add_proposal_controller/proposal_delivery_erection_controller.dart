
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/Add_proposal/proposal_delivery_response.dart';
 
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_load_service.dart';
 
 
 

import '../../model/Add_proposal/proposal_erection_response.dart';
import '../../model/Add_proposal/proposal_load_amt_response.dart';
 
import '../../service/add_proposal_service/proposal_delivery_service.dart';
import '../../service/add_proposal_service/proposal_erectiin_service.dart';
import '../../service/add_proposal_service/proposal_load_amt_service.dart';
import '../../utils/common_variable.dart';
 
class ProposalDeliveryErectionController extends GetxController{
  List<ProposalDeliveryModel> _proposaldelivery=[];
  List<ProposalDeliveryModel> get getproposaldeliverylist=>_proposaldelivery;
   RxBool isproposaldeliveryload = true.obs;
   ProposalDeliveryService proposalDeliveryService=ProposalDeliveryService();
//dropdown
 List<ProposalErectionModel> _proposalerection = [];
  List<ProposalErectionModel> get getproposalerection => _proposalerection;
  RxBool isproposaerectionLoad = true.obs;
  ProposalErectionService proposalErectionService =
      ProposalErectionService();

  Future proposalDeliveryController() async {
    isproposaldeliveryload(true);
    try {
      var response = await proposalDeliveryService.proposalDeliveryService();
      log(response.toString());
      if (response != null) {
        _proposaldelivery.clear();
        print('res---------------$response');
        _proposaldelivery.add(response);
        log(response);
       
           
      
        isproposaldeliveryload(false);
        
         
      } else {
        isproposaldeliveryload(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  //dropdown click event
 Future proposalErectionController() async {
    isproposaerectionLoad(true);
    try {
      var response = await proposalErectionService.proposalErectionService();
      log(response.toString());
      if (response != null) {
        _proposalerection.clear();
        print('res---------------$response');
        _proposalerection.add(response);
        log(response);
       
           
      
        isproposaerectionLoad(false);
        
         
      } else {
        isproposaerectionLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
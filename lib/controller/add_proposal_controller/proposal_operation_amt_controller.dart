
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_edit_controller.dart';
 
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_load_service.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_operation_amt_service.dart';
 
 
 
 

import '../../model/Add_proposal/proposal_load_response.dart';
import '../../model/Add_proposal/proposal_operation_amt_response.dart';
 
import '../../utils/common_variable.dart';
 
class ProposalOperationAmtController extends GetxController{
  List<ProposalOpersationAmtModel> _proposaloperationamt=[];
  List<ProposalOpersationAmtModel> get getproposaloperationamt=>_proposaloperationamt;
   RxBool isproposaspeedamtLoad = true.obs;
   ProposalOperationAmtService proposalOperationAmtService=ProposalOperationAmtService();
   var speeddata;
   ProposalEditController proposalEditController=Get.put(ProposalEditController());
  Future proposalOperationAmtController({operationid,typeid,total,subtotal}) async {
    isproposaspeedamtLoad(true);
    try {
      var response = await proposalOperationAmtService.proposalOperationAmountService(operationid:operationid,total: total,subtotal: subtotal,typeid:typeid);
      log(response.toString());
      if (response != null) {
        _proposaloperationamt.clear();
        print('res---------------$response');
        _proposaloperationamt.add(response);
        log('ooouuuttttppuuttt--------${_proposaloperationamt[0].data[0].total.toString()}');
        proposalEditController.subtotal(_proposaloperationamt.first.data.first.subtotal.toString());
          proposalEditController.total(_proposaloperationamt.first.data.first.total.toString());
       commonVariable.commonapidata.value=_proposaloperationamt[0].data[0].subtotal.toString();
         commonVariable.commontotal.value=_proposaloperationamt[0].data[0].total.toString();
           
      
        isproposaspeedamtLoad(false);
        
         
      } else {
        isproposaspeedamtLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
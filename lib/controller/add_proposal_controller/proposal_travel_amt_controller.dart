import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_edit_controller.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_travel_amt_service.dart';

import '../../model/Add_proposal/proposal_travel_amt_response.dart';
import '../../utils/common_variable.dart';

class ProposalTravelAmtController extends GetxController {
  List<ProposalTravelAmtModel> _proposaltravelamt = [];
  List<ProposalTravelAmtModel> get getproposaltravelamt => _proposaltravelamt;
  RxBool isproposltravelamtLoad = true.obs;
  ProposalTravelAmountService proposalTravelAmountService =
      ProposalTravelAmountService();
      ProposalEditController proposalEditController=Get.put(ProposalEditController());
  var speeddata;
  Future proposaltravelAmtController({travelid, specid, total, subtotal}) async {
    isproposltravelamtLoad(true);
    try {
      var response =
          await proposalTravelAmountService.proposalTravelAmountService(
              travelid: travelid,
              specid: specid,
              total: total,
              subtotal: subtotal);
      log(response.toString());
      if (response != null) {
        _proposaltravelamt.clear();
        print('res---------------$response');
        _proposaltravelamt.add(response);
        proposalEditController.stopid(_proposaltravelamt.first.data.first.stop.toString());
          proposalEditController.openid(_proposaltravelamt.first.data.first.opening.toString());
          proposalEditController.subtotal(_proposaltravelamt.first.data.first.subtotal.toString());
           proposalEditController.total(_proposaltravelamt.first.data.first.total.toString());
commonVariable.commonapidata.value=_proposaltravelamt[0].data[0].subtotal.toString();
commonVariable.commontotal.value=_proposaltravelamt[0].data[0].total.toString();
        isproposltravelamtLoad(false);
      } else {
        isproposltravelamtLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}

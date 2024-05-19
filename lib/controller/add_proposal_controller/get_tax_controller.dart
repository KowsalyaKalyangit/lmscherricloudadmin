import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';

import '../../model/Add_proposal/get_tax_response.dart';

import '../../service/add_proposal_service/get_tax_service.dart';

class ProposalTaxDrpDwnController extends GetxController {
  List<DrpDwnModel> _proposaltaxdrpdwn = [];
  List<DrpDwnModel> get gettaxdrpdwn => _proposaltaxdrpdwn;

  RxBool istaxdrpdwnLoad = true.obs;
  ProposalTaxDropDwnService proposalTaxService = ProposalTaxDropDwnService();
  Future proposaltaxdrpdwnController() async {
    istaxdrpdwnLoad(true);
    try {
      var response = await proposalTaxService.proposalTaxDrpDwnService();
      log(response.toString());
      if (response != null) {
        _proposaltaxdrpdwn.clear();
        print('res---------------$response');
        _proposaltaxdrpdwn.add(response);

        istaxdrpdwnLoad(false);
      } else {
        istaxdrpdwnLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}

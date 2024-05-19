import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_edit_controller.dart';
import 'package:leadingmanagementsystem/model/Add_proposal/proposal_tax_response.dart';

import '../../service/add_proposal_service/proposal_tax_service.dart';
import '../../utils/common_variable.dart';

class ProposalTaxController extends GetxController {
  List<ProposalTaskModel> _proposaltax = [];
  List<ProposalTaskModel> get getproposaltax => _proposaltax;
  RxBool isproposaltaxLoad = true.obs;
  RxString taxamount=''.obs;
  ProposalTaxService proposalTaxService = ProposalTaxService();
  ProposalEditController proposalEditController=Get.put(ProposalEditController());
  Future proposalTaxController({taxid, subtotal, total}) async {
    isproposaltaxLoad(true);
    try {
      var response = await proposalTaxService.proposalTaxService(
          taxid: taxid, subtotal: subtotal, total: total);
      log(response.toString());
      if (response != null) {
        _proposaltax.clear();
        print('res---------------$response');
        _proposaltax.add(response);
        taxamount.value=_proposaltax.first.data.first.taxamount.toString();
proposalEditController.taxid(_proposaltax.first.data.first.id.toString());
proposalEditController.subtotal(_proposaltax.first.subTotalAmount.toString());
proposalEditController.totaltax(_proposaltax.first.data.first.taxamount.toString());
        commonVariable.commonapidata.value =
            _proposaltax[0].data[0].taxamount.toString();
        commonVariable.commontotal.value =
            _proposaltax[0].totalAmount.toString();

        isproposaltaxLoad(false);
      } else {
        isproposaltaxLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}

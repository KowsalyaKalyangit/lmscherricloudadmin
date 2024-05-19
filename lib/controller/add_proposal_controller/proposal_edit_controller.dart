import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/service/add_proposal_service/proposal_update_service.dart';
import 'package:leadingmanagementsystem/utils/common_variable.dart';

import '../../model/Add_proposal/proposal_edit_response.dart';

import '../../model/Add_proposal/proposal_update_response.dart';
import '../../service/add_proposal_service/proposal_edit_service.dart';

class ProposalEditController extends GetxController {
  List<ProposalEditModel> _proposalEdit = [];
  List<ProposalEditModel> get getproposalEdit => _proposalEdit;
  RxBool isproposalEditLoad = true.obs;
  ProposalEditService proposalEditService = ProposalEditService();
  TextEditingController subject = TextEditingController();
  TextEditingController toname = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController zip = TextEditingController();
  TextEditingController tomail = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController oepntill = TextEditingController();
  TextEditingController leadname = TextEditingController();
  //...
  TextEditingController hoistwaysize = TextEditingController();
  TextEditingController carsize = TextEditingController();
  TextEditingController units = TextEditingController();
  //TextEditingController eretionname = TextEditingController();
  TextEditingController powersupply = TextEditingController();

  RxString type = ''.obs;
  RxString load = ''.obs;
  RxString loadid = ''.obs;
  RxString speed = ''.obs;
  RxString travel = ''.obs;
  RxString operation = ''.obs;
  RxString operationid = ''.obs;
  RxString control = ''.obs;
  RxString controlid = ''.obs;
  RxString machine = ''.obs;
  RxString machineid = ''.obs;
  RxString total = ''.obs;
  RxString subtotal = ''.obs;
  RxString typename = ''.obs;
  RxString specificationname = ''.obs;
  RxString specificationid = ''.obs;
  RxString passenger = ''.obs;
  RxString carenclosure = ''.obs;
  RxString hoistwaydoors = ''.obs;
  RxString entrance = ''.obs;
  RxString dooroperation = ''.obs;
  RxString speedid = ''.obs;
  RxString travelid = ''.obs;
  RxString stopid = ''.obs;
  RxString stopname = ''.obs;
  RxString openid = ''.obs;
  RxString openname = ''.obs;
  RxString delivery = ''.obs;
  RxString erection = ''.obs;
  RxString taxid = ''.obs;
  RxString taxname = ''.obs;
  RxString totaltax = ''.obs;
    RxString taxamount= ''.obs;

  ProposalUpdateService proposalUpdateService = ProposalUpdateService();
  List<ProposalUpdateModel> _proposalupdate = [];
  List<ProposalUpdateModel> get getproposalUpdate => _proposalupdate;
  RxBool isproposalUpdateLoad = true.obs;

  Future proposalEditController() async {
    isproposalEditLoad(true);
    try {
      var response = await proposalEditService.proposalEditService();
      log(response.toString());
      if (response != null) {
        _proposalEdit.add(response);

        subject.text = _proposalEdit[0].data[0].subject;
        leadname.text = _proposalEdit[0].data[0].lead;
        address.text = _proposalEdit[0].data[0].address;
        city.text = _proposalEdit[0].data[0].city;
        state.text = _proposalEdit[0].data[0].state;
        country.text = _proposalEdit[0].data[0].country;
        zip.text = _proposalEdit[0].data[0].zip;
        tomail.text = _proposalEdit[0].data[0].toemail;
        phone.text = _proposalEdit[0].data[0].phone;
        date.text =
            '${DateTime.parse(_proposalEdit[0].data[0].date.toString()).year.toString()}-${DateTime.parse(_proposalEdit[0].data[0].date.toString()).month.toString()}-${DateTime.parse(_proposalEdit[0].data[0].date.toString()).day}';
        // date.text = _getproposalrelated[0].data[0].date.toString();
        oepntill.text =
            '${DateTime.parse(_proposalEdit[0].data[0].openTill.toString()).year.toString()}-${DateTime.parse(_proposalEdit[0].data[0].openTill.toString()).month.toString()}-${DateTime.parse(_proposalEdit[0].data[0].openTill.toString()).day}';
        type.value = _proposalEdit[0].data[0].typeid;
        load.value = _proposalEdit[0].data[0].loadid;
        loadid.value = _proposalEdit[0].data[0].loadid;
        speedid.value = _proposalEdit[0].data[0].speedid;
        speed.value = _proposalEdit[0].data[0].speed;
        travel.value = _proposalEdit[0].data[0].travel;
        travelid.value = _proposalEdit[0].data[0].travelid;
        operation.value = _proposalEdit[0].data[0].operation;
        operationid.value = _proposalEdit[0].data[0].operationid;
        control.value = _proposalEdit[0].data[0].control;
        controlid.value = _proposalEdit[0].data[0].controlid;
        machine.value = _proposalEdit[0].data[0].machine;
        machineid.value = _proposalEdit[0].data[0].machineid;
        hoistwaysize.text = _proposalEdit[0].data[0].hoistwaysize;
        carsize.text = _proposalEdit[0].data[0].carsize;
        delivery.value = _proposalEdit[0].data[0].deliveryid;
        erection.value = _proposalEdit[0].data[0].erectionid;
        powersupply.text = _proposalEdit[0].data[0].powerSupply;
        specificationname.value = _proposalEdit[0].data[0].specification;
        specificationid.value = _proposalEdit[0].data[0].specificationid;
        typename.value = _proposalEdit[0].data[0].type;
        passenger.value = _proposalEdit[0].data[0].passenger;
        carenclosure.value = _proposalEdit[0].data[0].carenclosure;
        hoistwaydoors.value = _proposalEdit[0].data[0].hoistwaydoors;
        entrance.value = _proposalEdit[0].data[0].entrances;
        dooroperation.value = _proposalEdit[0].data[0].dooroperation;
        stopid.value = _proposalEdit[0].data[0].stopid;
        stopname.value = _proposalEdit[0].data[0].stop;
        openid.value = _proposalEdit[0].data[0].openingid;
        openname.value = _proposalEdit[0].data[0].opening;
        units.text = _proposalEdit[0].data[0].units;
        taxid.value = _proposalEdit[0].data[0].taxid;
        taxname.value = _proposalEdit[0].data[0].taxname;
        subtotal.value = _proposalEdit[0].data[0].subtotal.toString();
        total.value = _proposalEdit[0].data[0].total.toString();
        totaltax.value = _proposalEdit[0].data[0].totaltax.toString();
        
        // commonVariable.commonapidata.value = _proposalEdit[0].data[0].subtotal;
        commonVariable.commontotal.value = _proposalEdit[0].data[0].total;
        isproposalEditLoad(false);
      } else {
        isproposalEditLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future proposalupdateController(
      {proposalid,
      leadid,
      
       
      status,
      currency,
      liftpriceid,
      loadid,
      speedid,
      travelid,
      stopid,
      openingid,
      controlid,
      operationid,
      machineid,
      
      delivery,
      erection,
       
      taxid}) async {
    isproposalUpdateLoad(true);
    try {
      var response = await proposalUpdateService.proposalUpdateService(
        proposalid: proposalid,
        leadid: leadid,
        subject:subject.text,
        total: total.value,
        subtotal: subtotal.value,
        taxamount: totaltax.value,
        open_till: oepntill.text,
        date: date.text,
        proposal_to: toname.text,
        country: country.text,
        zip: zip.text,
        state: state.text,
        city: city.text,
        address: address.text,
        email: tomail.text,
        phone: phone.text,
        status: status,
        currency: currency,
        liftpriceid: liftpriceid,
        loadid: loadid,
        speedid: speedid,
        travelid: travelid,
        stopid: stopid,
        openingid: openingid,
        controlid: controlid,
        operationid: operationid,
        machineid: machineid,
        hoistwaysize: hoistwaysize.text,
        carsize: carsize.text,
        delivery: delivery,
        erection: erection,
        power_supply: powersupply.text,
        units: units.text,
        taxid: taxid,
      );
      log(response.toString());
      if (response != null) {
        _proposalupdate.clear();
        print('res---------------$response');
        _proposalupdate.add(response);
        log(response);

        isproposalUpdateLoad(false);
      } else {
        isproposalUpdateLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}

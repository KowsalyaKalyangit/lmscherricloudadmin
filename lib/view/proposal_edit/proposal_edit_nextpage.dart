import 'package:leadingmanagementsystem/allpackages.dart';
//import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_load_amt_controller.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_load_controller.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_open_controller.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_speed_amount_controller.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_stop_controller.dart';
import 'package:leadingmanagementsystem/model/Add_proposal/proposal_speed_amount_response.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';
import 'package:leadingmanagementsystem/view/proposal_edit/edit_bal.dart';

import '../../controller/add_proposal_controller/add_item_proposal_controller.dart';
import '../../controller/add_proposal_controller/get_addlistitem_controller.dart';
import '../../controller/add_proposal_controller/get_tax_controller.dart';
import '../../controller/add_proposal_controller/proposal_control_controller.dart';
import '../../controller/add_proposal_controller/proposal_create_controller.dart';
import '../../controller/add_proposal_controller/proposal_delivery_erection_controller.dart';
import '../../controller/add_proposal_controller/proposal_edit_controller.dart';
import '../../controller/add_proposal_controller/proposal_machine_controller.dart';

import '../../controller/add_proposal_controller/proposal_operation_amt_controller.dart';
import '../../controller/add_proposal_controller/proposal_operation_controller.dart';
import '../../controller/add_proposal_controller/proposal_speed_controller.dart';
import '../../controller/add_proposal_controller/proposal_tax_controller.dart';
import '../../controller/add_proposal_controller/proposal_travel_amt_controller.dart';
import '../../controller/add_proposal_controller/proposal_travel_controller.dart';
import '../../utils/common_variable.dart';

class ProposalEditNextPage extends StatefulWidget {
  const ProposalEditNextPage(
      {super.key,
      this.proposalid,
      this.leadid,
      this.subjectname,
      this.opentillname,
      this.datename,
      this.proposaltoname,
      this.countryname,
      this.zipname,
      this.statename,
      this.emailname,
      this.phonename,
      this.status,
      this.cityname,
      this.addressname,
      this.currencyname});
  final String? proposalid;
  final String? leadid;
  final String? subjectname;
  final String? opentillname;
  final String? datename;
  final String? proposaltoname;
  final String? countryname;
  final String? zipname;
  final String? statename;
  final String? cityname;
  final String? addressname;
  final String? emailname;
  final String? phonename;
  final String? status;
  final String? currencyname;

  @override
  State<ProposalEditNextPage> createState() => _ProposalEditNextPageState();
}

class _ProposalEditNextPageState extends State<ProposalEditNextPage> {
  ProposalEditController proposalEditController =
      Get.put(ProposalEditController());
  AddItemProposalController addItemProposalController =
      Get.put(AddItemProposalController());
  GetAddItemListController getAddItemListController =
      Get.put(GetAddItemListController());
  ProposalLoadController proposalLoadController =
      Get.put(ProposalLoadController());
  ProposalSpeedController proposalSpeedController =
      Get.put(ProposalSpeedController());
  ProposalTravelController proposalTravelController =
      Get.put(ProposalTravelController());
  ProposalStopController proposalStopController =
      Get.put(ProposalStopController());
  ProposalOpenController proposalOpenController =
      Get.put(ProposalOpenController());
  ProposalControlController proposalControlController =
      Get.put(ProposalControlController());
  ProposalOperationController proposalOperationController =
      Get.put(ProposalOperationController());
  ProposalMachineController proposalMachineController =
      Get.put(ProposalMachineController());
  ProposalSpeedAmtController proposalSpeedAmtController =
      Get.put(ProposalSpeedAmtController());

  ProposalTravelAmtController proposalTravelAmtController =
      Get.put(ProposalTravelAmtController());

  ProposalCreateController proposalCreateController =
      Get.put(ProposalCreateController());
  ProposalOperationAmtController proposalOperationAmtController =
      Get.put(ProposalOperationAmtController());

  ProposalDeliveryErectionController proposalDeliveryErectionController =
      Get.put(ProposalDeliveryErectionController());
       ProposalTaxDrpDwnController proposalTaxdrpdownController =
      Get.put(ProposalTaxDrpDwnController());
       ProposalTaxController proposalTaxController =
      Get.put(ProposalTaxController());
  var selectedOptions = [];
  var listitem;
  var listvalue;

  var discount_type_name;
  var editadditem;
  var selectedindex;
  var proposalload;
  var travel;
  var travelindex;
  var proposalstop;
  var proposalopen;
  var proposalControl;
  var proposalOperation;
  var proposalMachine;
  var speedvalue;
  // var addcon=true;
  // var loadcon=true;
  // var speedcon=true;
  // var travelcon=true;
  bool travelclick = true;

  @override
  void initState() {
     
    func();
    super.initState();
  }

  func() {
    proposalEditController.proposalEditController();
    addItemProposalController.addItemProposalController();

    proposalLoadController.proposalloadController();

    proposalSpeedController.proposalSpeedController();

    proposalTravelController.proposalTravelController();

    proposalStopController.proposalStopController();

    proposalOpenController.proposalOpenController();

    proposalOperationController.proposalOperationController();
    proposalControlController.proposalControlController();
    proposalMachineController.proposalMachineController();
    proposalDeliveryErectionController.proposalDeliveryController();
     proposalDeliveryErectionController.proposalErectionController();
     proposalTaxdrpdownController.proposaltaxdrpdwnController();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appcolor,
        automaticallyImplyLeading: false,
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
      body: Obx(() {
        if (addItemProposalController.isadditemLoad.value ||
            // proposalLoadController.isproposaLoad.value&&
            proposalSpeedController.isproposalspeedLoad.value ||
            proposalTravelController.isproposaltravelLoad.value ||
            proposalControlController.isproposalControlLoad.value ||
            proposalMachineController.isproposalMachineLoad.value&&
            proposalDeliveryErectionController.isproposaldeliveryload.value&&
            proposalDeliveryErectionController.isproposaerectionLoad.value||
            proposalOpenController.isproposalOpenLoad.value||
            proposalOperationController.isproposalOperationLoad.value
            ) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (addItemProposalController.getadditemproposal.isEmpty ||
            proposalLoadController.getproposalloadlist.isEmpty ||
            proposalSpeedController.getproposalSpeed.isEmpty ||
            proposalTravelController.getproposalTravel.isEmpty ||
            proposalControlController.getproposalControl.isEmpty ||
            proposalMachineController.getproposalMachine.isEmpty||
            proposalDeliveryErectionController.getproposaldeliverylist.isEmpty||
            proposalDeliveryErectionController.getproposalerection.isEmpty||
            proposalOpenController.getproposalOpen.isEmpty||
            proposalOperationController.getproposalOperation.isEmpty) {
          return Center(
            child: Text('No Data Found'),
          );
        } else {
          return Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(
                      'Add Item',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 7.00.hp,
                              width: 90.00.wp,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: const Color(0xFFECE9E9),
                                  width: MediaQuery.of(context).size.height *
                                      0.001,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value:
                                      proposalEditController.type.value.isEmpty
                                          ? null
                                          : proposalEditController.type.value,
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 10.00.sp,
                                          color: forminputcolor,
                                          fontWeight: FontWeight.w500)),
                                  hint: Text('Add Item',
                                      style: GoogleFonts.jost(
                                          textStyle: TextStyle(
                                              fontSize: 10.00.sp,
                                              color: formhintcolor,
                                              fontWeight: FontWeight.w500))),
                                  onChanged: (newValue) {
                                    setState(() {
                                      if (newValue != null) {
                                        setState(() {
                                          proposalEditController.type.value =
                                              newValue.toString();
                                          print('newwvalue');
                                          print(newValue.toString());
                                          print('clickkkk');

                                          getAddItemListController
                                              .getAddItemListController(
                                                  liftid: newValue.toString());
                                          selectedindex = 0;

                                          // addcon=true;
                                        });
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    selectedindex == 0
                                        ? Icons.arrow_drop_up_outlined
                                        : Icons.arrow_drop_down,
                                    size: 20,
                                    color: const Color(0xFF737070),
                                  ),
                                  items: addItemProposalController
                                          .getadditemproposal[0].data.isEmpty
                                      ? []
                                      : addItemProposalController
                                          .getadditemproposal[0].data
                                          .map<DropdownMenuItem<String>>(
                                              (value) {
                                          return DropdownMenuItem<String>(
                                            value: value.id.toString(),
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 0, right: 4),
                                                child: Text(
                                                    value.optionname.toString(),
                                                    style: GoogleFonts.jost(
                                                        textStyle: TextStyle(
                                                            fontSize: 10.00.sp,
                                                            color:
                                                                forminputcolor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)))),
                                          );
                                        }).toList(),
                                ),
                              )),
                        ],
                      ),
                    ]),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    // getAddItemListController.isadditemlistLoad.value
                    //     ? Center(
                    //         child: Container(),
                    //       )
                    //     : getAddItemListController.getadditemproposal.isEmpty
                    //         ? Text('No data Found'):
                    //: selectedindex == 0?
                    Container(
                      height: 26.0.hp,
                      width: 100.0.wp,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: formhintcolor)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.0.hp,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                height: 2.00.hp,
                                width: 25.00.wp,
                                child: Text(
                                  'Type*',
                                  style: socialbutton,
                                ),
                              ),
                              Container(
                                // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                height: 2.00.hp,
                                width: 25.00.wp,
                                child: Text(
                                  'Specification*',
                                  style: socialbutton,
                                ),
                              ),
                              Container(
                                // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                height: 2.00.hp,
                                width: 25.00.wp,
                                child: Text(
                                  'Passenger*',
                                  style: socialbutton,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.0.hp,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                height: 4.00.hp,
                                width: 25.00.wp,
                                decoration: BoxDecoration(
                                    color: teal.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0xffD9D9D9))),
                                child: Center(
                                    child: Text(proposalEditController
                                        .typename.value
                                        .toString())),
                              ),
                              Container(
                                // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                height: 4.00.hp,
                                width: 25.00.wp,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: teal.withOpacity(0.1),
                                    border: Border.all(
                                        color: const Color(0xffD9D9D9))),
                                child: Center(
                                    child: Text(proposalEditController
                                        .specificationname.value
                                        .toString())),
                              ),
                              Container(
                                // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                height: 4.00.hp,
                                width: 25.00.wp,

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: teal.withOpacity(0.1),
                                    border: Border.all(
                                        color: const Color(0xffD9D9D9))),
                                child: Center(
                                    child: Text(proposalEditController
                                        .passenger.value
                                        .toString())),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.0.hp,
                          ),
                          Row(
                            children: [
                              Container(
                                // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                height: 2.00.hp,
                                width: 48.00.wp,
                                child: Text(
                                  ' Car Enclosure*',
                                  style: socialbutton,
                                ),
                              ),
                              Container(
                                // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                height: 2.00.hp,
                                width: 25.00.wp,
                                child: Text(
                                  'Hoistway Doors*',
                                  style: socialbutton,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.0.hp,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                height: 4.00.hp,
                                width: 40.00.wp,
                                decoration: BoxDecoration(
                                    color: teal.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0xffD9D9D9))),
                                child: Center(
                                    child: Text(proposalEditController
                                        .carenclosure.value
                                        .toString())),
                              ),
                              Container(
                                // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                height: 4.00.hp,
                                width: 40.00.wp,
                                decoration: BoxDecoration(
                                    color: teal.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0xffD9D9D9))),
                                child: Center(
                                    child: Text(proposalEditController
                                        .hoistwaydoors.value
                                        .toString())),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.0.hp,
                          ),
                          Row(
                            children: [
                              Container(
                                // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                height: 2.00.hp,
                                width: 48.00.wp,
                                child: Text(
                                  'Entrance *',
                                  style: socialbutton,
                                ),
                              ),
                              Container(
                                // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                height: 2.00.hp,
                                width: 25.00.wp,
                                child: Text(
                                  'Door Operation *',
                                  style: socialbutton,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.0.hp,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                height: 5.00.hp,
                                width: 40.00.wp,
                                decoration: BoxDecoration(
                                    color: teal.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0xffD9D9D9))),
                                child: Center(
                                    child: Text(proposalEditController
                                        .entrance.value
                                        .toString())),
                              ),
                              Container(
                                // color: const Color(0xffD9D9D9).withOpacity(0.1),
                                height: 4.00.hp,
                                width: 40.00.wp,
                                decoration: BoxDecoration(
                                    color: teal.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0xffD9D9D9))),
                                child: Center(
                                    child: Text(proposalEditController
                                        .dooroperation.value
                                        .toString())),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                    //: Container()
                    ,

                    Text(
                      'Load*',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 7.00.hp,
                              width: 90.00.wp,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: const Color(0xFFECE9E9),
                                  width: MediaQuery.of(context).size.height *
                                      0.001,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: proposalEditController
                                          .loadid.value.isEmpty
                                      ? null
                                      : proposalEditController.loadid.value,
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 10.00.sp,
                                          color: forminputcolor,
                                          fontWeight: FontWeight.w500)),
                                  hint: Text('Load',
                                      style: GoogleFonts.jost(
                                          textStyle: TextStyle(
                                              fontSize: 10.00.sp,
                                              color: formhintcolor,
                                              fontWeight: FontWeight.w500))),
                                  onChanged: (newValue) {
                                    setState(() {
                                      if (newValue != null) {
                                        setState(() {
                                          proposalEditController.loadid.value =
                                              newValue.toString();
                                          print('newwvalue');
                                          print(newValue.toString());
                                          print('clickkkk');

                                          proposalLoadController
                                              .proposalLoadAmtController(
                                                  loadid: newValue,
                                                  total: commonVariable
                                                      .commonapidata
                                                      .toString(),
                                                  subtotal: commonVariable
                                                      .commontotal
                                                      .toString());

                                          //speedcon=true;
                                        });
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: const Color(0xFF737070),
                                  ),
                                  items: proposalLoadController
                                          .getproposalloadlist[0].data.isEmpty
                                      ? []
                                      : proposalLoadController
                                          .getproposalloadlist[0].data
                                          .map<DropdownMenuItem<String>>(
                                              (value) {
                                          return DropdownMenuItem<String>(
                                            value: value.loadid.toString(),
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 0, right: 4),
                                                child: Text(
                                                    value.optionname.toString(),
                                                    style: GoogleFonts.jost(
                                                        textStyle: TextStyle(
                                                            fontSize: 10.00.sp,
                                                            color:
                                                                forminputcolor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)))),
                                          );
                                        }).toList(),
                                ),
                              )),
                        ],
                      ),
                    ]),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Text(
                      'Speed*',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 7.00.hp,
                              width: 90.00.wp,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                  color: const Color(0xFFECE9E9),
                                  width: MediaQuery.of(context).size.height *
                                      0.001,
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: proposalEditController
                                          .speedid.value.isEmpty
                                      ? null
                                      : proposalEditController.speedid.value,
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 10.00.sp,
                                          color: forminputcolor,
                                          fontWeight: FontWeight.w500)),
                                  hint: Text('Speed',
                                      style: GoogleFonts.jost(
                                          textStyle: TextStyle(
                                              fontSize: 10.00.sp,
                                              color: formhintcolor,
                                              fontWeight: FontWeight.w500))),
                                  onChanged: (newValue) {
                                    setState(() {
                                      if (newValue != null) {
                                        setState(() {
                                          proposalEditController.speedid.value =
                                              newValue.toString();
                                          print('newwvalue');
                                          print(newValue.toString());
                                          print('clickkkk');

                                          proposalSpeedAmtController
                                              .proposalSpeedAmtController(
                                                  speedid: newValue,
                                                  total: commonVariable
                                                      .commonapidata
                                                      .toString(),
                                                  subtotal: commonVariable
                                                      .commontotal
                                                      .toString());

                                          //speedcon=true;
                                        });
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: const Color(0xFF737070),
                                  ),
                                  items: proposalSpeedController
                                          .getproposalSpeed[0].data.isEmpty
                                      ? []
                                      : proposalSpeedController
                                          .getproposalSpeed[0].data
                                          .map<DropdownMenuItem<String>>(
                                              (value) {
                                          return DropdownMenuItem<String>(
                                            value: value.speedid.toString(),
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 0, right: 4),
                                                child: Text(
                                                    value.name.toString(),
                                                    style: GoogleFonts.jost(
                                                        textStyle: TextStyle(
                                                            fontSize: 10.00.sp,
                                                            color:
                                                                forminputcolor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500)))),
                                          );
                                        }).toList(),
                                ),
                              )),
                        ],
                      ),
                    ]),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Text(
                      'Travel*',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(children: [
                      Container(
                          height: 7.00.hp,
                          width: 90.00.wp,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: const Color(0xFFECE9E9),
                              width: MediaQuery.of(context).size.height * 0.001,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value:
                                  proposalEditController.travelid.value.isEmpty
                                      ? null
                                      : proposalEditController.travelid.value,
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 10.00.sp,
                                      color: forminputcolor,
                                      fontWeight: FontWeight.w500)),
                              hint: Text('Travel',
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 10.00.sp,
                                          color: formhintcolor,
                                          fontWeight: FontWeight.w500))),
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    setState(() {
                                      proposalEditController.travelid.value =
                                          newValue.toString();
                                      print('newwvalue');
                                      print(newValue.toString());
                                      travelclick = false;
                                      print('clickkkk');

                                      proposalTravelAmtController
                                          .proposaltravelAmtController(
                                              travelid: proposalEditController
                                                  .travelid.value,
                                              specid: proposalEditController
                                                  .specificationid.value
                                                  .toString(),
                                              total: commonVariable
                                                  .commonapidata
                                                  .toString(),
                                              subtotal: commonVariable
                                                  .commontotal
                                                  .toString());
                                      travelclick = true;

                                      // travelcon=true;
                                    });
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                color: const Color(0xFF737070),
                              ),
                              items: proposalTravelController
                                      .getproposalTravel[0].data.isEmpty
                                  ? []
                                  : proposalTravelController
                                      .getproposalTravel[0].data
                                      .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value.travelid.toString(),
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 0, right: 4),
                                            child: Text(value.name.toString(),
                                                style: GoogleFonts.jost(
                                                    textStyle: TextStyle(
                                                        fontSize: 10.00.sp,
                                                        color: forminputcolor,
                                                        fontWeight:
                                                            FontWeight.w500)))),
                                      );
                                    }).toList(),
                            ),
                          )),
                    ]),
                    SizedBox(
                      height: 0.5.hp,
                    ),

                    travelclick
                        ? Row(children: [
                            Row(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 1.0.wp,
                                  ),
                                  Container(
                                      height: 5.00.hp,
                                      width: 40.00.wp,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        border: Border.all(
                                          color: const Color(0xFFECE9E9),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.001,
                                        ),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: proposalEditController
                                                  .stopid.value.isEmpty
                                              ? null
                                              : proposalEditController
                                                  .stopid.value,
                                          style: GoogleFonts.jost(
                                              textStyle: TextStyle(
                                                  fontSize: 10.00.sp,
                                                  fontWeight: FontWeight.w500)),
                                          hint: Text('stop'),
                                          onChanged: (newValue) {
                                            setState(() {
                                              if (newValue != null) {
                                                setState(() {
                                                  proposalEditController
                                                          .stopid.value =
                                                      newValue.toString();
                                                  print('newwvalue');
                                                  print(newValue.toString());

                                                  print('clickkkk');
                                                });
                                              }
                                            });
                                          },
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            size: 20,
                                            color: const Color(0xFF737070),
                                          ),
                                          items: proposalOpenController
                                                  .getproposalOpen[0]
                                                  .data
                                                  .isEmpty
                                              ? []
                                              : proposalOpenController
                                                  .getproposalOpen[0].data
                                                  .map<
                                                      DropdownMenuItem<
                                                          String>>((value) {
                                                  return DropdownMenuItem<String>(
                                                      value: value.name
                                                          .toString(),
                                                      child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 0,
                                                                  right: 4),
                                                          child: Text(value.name,
                                                              style: GoogleFonts.jost(
                                                                  textStyle: TextStyle(
                                                                      fontSize:
                                                                          10.00
                                                                              .sp,
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500)))));
                                                }).toList(),
                                        ),
                                      )),
                                ],
                              ),
                            ]),
                            SizedBox(
                              width: 5.0.wp,
                            ),
                            Row(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 5.00.hp,
                                      width: 40.00.wp,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        border: Border.all(
                                          color: const Color(0xFFECE9E9),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.001,
                                        ),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: proposalEditController
                                                  .openid.value.isEmpty
                                              ? null
                                              : proposalEditController
                                                  .openid.value,
                                          style: GoogleFonts.jost(
                                              textStyle: TextStyle(
                                                  fontSize: 10.00.sp,
                                                  fontWeight: FontWeight.w500)),
                                          hint: Text('Opening'),
                                          onChanged: (newValue) {
                                            setState(() {
                                              if (newValue != null) {
                                                setState(() {
                                                  proposalEditController
                                                          .openid.value =
                                                      newValue.toString();
                                                  print('newwvalue');
                                                  print(newValue.toString());
                                                  print('clickkkk');
                                                });
                                              }
                                            });
                                          },
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            size: 20,
                                            color: const Color(0xFF737070),
                                          ),
                                          items: proposalOpenController
                                                  .getproposalOpen[0]
                                                  .data
                                                  .isEmpty
                                              ? []
                                              : proposalOpenController
                                                  .getproposalOpen[0].data
                                                  .map<
                                                      DropdownMenuItem<
                                                          String>>((value) {
                                                  return DropdownMenuItem<String>(
                                                      value: value.name
                                                          .toString(),
                                                      child: Container(
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 0,
                                                                  right: 4),
                                                          child: Text(value.name,
                                                              style: GoogleFonts.jost(
                                                                  textStyle: TextStyle(
                                                                      fontSize:
                                                                          10.00
                                                                              .sp,
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500)))));
                                                }).toList(),
                                        ),
                                      )),
                                ],
                              ),
                            ]),
                          ])
                        : Container(),

                    Text(
                      'Operation*',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(children: [
                      Container(
                          height: 7.00.hp,
                          width: 90.00.wp,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: const Color(0xFFECE9E9),
                              width: MediaQuery.of(context).size.height * 0.001,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: proposalEditController
                                      .operationid.value.isEmpty
                                  ? null
                                  : proposalEditController.operationid.value,
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 10.00.sp,
                                      color: forminputcolor,
                                      fontWeight: FontWeight.w500)),
                              hint: Text('operation',
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 10.00.sp,
                                          color: formhintcolor,
                                          fontWeight: FontWeight.w500))),
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    setState(() {
                                      proposalEditController.operationid.value =
                                          newValue;

                                      print('clickkkk');
                                      // commonVariable.commonapidata.value='output';
                                      proposalOperationAmtController
                                          .proposalOperationAmtController(
                                              operationid: newValue,
                                              typeid: proposalEditController
                                                  .type.value
                                                  .toString(),
                                              total: commonVariable
                                                  .commonapidata
                                                  .toString(),
                                              subtotal: commonVariable
                                                  .commontotal
                                                  .toString());
                                      // travelcon=true;
                                    });
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                color: const Color(0xFF737070),
                              ),
                              items: proposalOperationController
                                      .getproposalOperation[0].data.isEmpty
                                  ? []
                                  : proposalOperationController
                                      .getproposalOperation[0].data
                                      .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value.operationid.toString(),
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 0, right: 4),
                                            child: Text(value.name.toString(),
                                                style: GoogleFonts.jost(
                                                    textStyle: TextStyle(
                                                        fontSize: 10.00.sp,
                                                        color: forminputcolor,
                                                        fontWeight:
                                                            FontWeight.w500)))),
                                      );
                                    }).toList(),
                            ),
                          )),
                    ]),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Text(
                      'Control*',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(children: [
                      Container(
                          height: 7.00.hp,
                          width: 90.00.wp,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: const Color(0xFFECE9E9),
                              width: MediaQuery.of(context).size.height * 0.001,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value:
                                  proposalEditController.controlid.value.isEmpty
                                      ? null
                                      : proposalEditController.controlid.value,
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 10.00.sp,
                                      color: forminputcolor,
                                      fontWeight: FontWeight.w500)),
                              hint: Text('Control',
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 10.00.sp,
                                          color: formhintcolor,
                                          fontWeight: FontWeight.w500))),
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    setState(() {
                                      proposalEditController.controlid.value =
                                          newValue.toString();
                                      print('newwvalue');
                                      print(newValue.toString());
                                      print('clickkkk');
                                      travelindex = 1;
                                    });
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                color: const Color(0xFF737070),
                              ),
                              items: proposalControlController
                                      .getproposalControl[0].data.isEmpty
                                  ? []
                                  : proposalControlController
                                      .getproposalControl[0].data
                                      .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value.controlid.toString(),
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 0, right: 4),
                                            child: Text(value.name.toString(),
                                                style: GoogleFonts.jost(
                                                    textStyle: TextStyle(
                                                        fontSize: 10.00.sp,
                                                        color: forminputcolor,
                                                        fontWeight:
                                                            FontWeight.w500)))),
                                      );
                                    }).toList(),
                            ),
                          )),
                    ]),
                    SizedBox(
                      height: 1.0.hp,
                    ),

                    Text(
                      'Machine*',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(children: [
                      Container(
                          height: 7.00.hp,
                          width: 90.00.wp,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: const Color(0xFFECE9E9),
                              width: MediaQuery.of(context).size.height * 0.001,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value:
                                  proposalEditController.machineid.value.isEmpty
                                      ? null
                                      : proposalEditController.machineid.value,
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 10.00.sp,
                                      color: forminputcolor,
                                      fontWeight: FontWeight.w500)),
                              hint: Text('Machine',
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 10.00.sp,
                                          color: formhintcolor,
                                          fontWeight: FontWeight.w500))),
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    setState(() {
                                      proposalEditController.machineid.value =
                                          newValue.toString();
                                      print('newwvalue');
                                      print(newValue.toString());
                                      print('clickkkk');
                                      travelindex = 1;
                                    });
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                color: const Color(0xFF737070),
                              ),
                              items: proposalMachineController
                                      .getproposalMachine[0].data.isEmpty
                                  ? []
                                  : proposalMachineController
                                      .getproposalMachine[0].data
                                      .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value.machineid.toString(),
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 0, right: 4),
                                            child: Text(value.name.toString(),
                                                style: GoogleFonts.jost(
                                                    textStyle: TextStyle(
                                                        fontSize: 10.00.sp,
                                                        color: forminputcolor,
                                                        fontWeight:
                                                            FontWeight.w500)))),
                                      );
                                    }).toList(),
                            ),
                          )),
                    ]),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Text(
                      'Hoistway Size*',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Container(
                      color: const Color(0xffD9D9D9).withOpacity(0.1),
                      height: 7.00.hp, width: 100.00.wp,
                      // padding: const EdgeInsets.only(
                      //   left: 20,
                      //   right: 20,
                      // ),
                      child: TextFormField(
                        controller: proposalEditController.hoistwaysize,
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 10.00.sp,
                                color: forminputcolor,
                                fontWeight: FontWeight.w500)),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  const BorderSide(color: appcolor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xffC6C6C6).withOpacity(0.5),
                                  width: 1),
                            ),
                            fillColor: const Color(0xffC6C6C6),
                            hintText: '',
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintStyle: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: formhintcolor,
                                    fontWeight: FontWeight.w500)),
                            border: const OutlineInputBorder(
                              gapPadding: 4,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Text(
                      'Car Size*',
                      style: listtitlefont,
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Container(
                      color: const Color(0xffD9D9D9).withOpacity(0.1),
                      height: 7.00.hp, width: 100.00.wp,
                      // padding: const EdgeInsets.only(
                      //   left: 20,
                      //   right: 20,
                      // ),
                      child: TextFormField(
                        controller: proposalEditController.carsize,
                        style: GoogleFonts.jost(
                            textStyle: TextStyle(
                                fontSize: 10.00.sp,
                                color: forminputcolor,
                                fontWeight: FontWeight.w500)),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide:
                                  const BorderSide(color: appcolor, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color:
                                      const Color(0xffC6C6C6).withOpacity(0.5),
                                  width: 1),
                            ),
                            fillColor: const Color(0xffC6C6C6),
                            hintText: '',
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintStyle: GoogleFonts.jost(
                                textStyle: TextStyle(
                                    fontSize: 10.00.sp,
                                    color: formhintcolor,
                                    fontWeight: FontWeight.w500)),
                            border: const OutlineInputBorder(
                              gapPadding: 4,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Text(
                      'Delivery*',
                      style: listtitlefont,
                    ),

                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(children: [
                      Container(
                          height: 7.00.hp,
                          width: 90.00.wp,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: const Color(0xFFECE9E9),
                              width: MediaQuery.of(context).size.height * 0.001,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: proposalEditController.delivery.value.isEmpty?null:proposalEditController.delivery.value,
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 10.00.sp,
                                      color: forminputcolor,
                                      fontWeight: FontWeight.w500)),
                              hint: Text('Control',
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 10.00.sp,
                                          color: formhintcolor,
                                          fontWeight: FontWeight.w500))),
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    setState(() {
                                      proposalEditController.delivery.value = newValue.toString();
                                      print('newwvalue');
                                      print(newValue.toString());
                                      print('clickkkk');
                                      travelindex = 1;
                                    });
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                color: const Color(0xFF737070),
                              ),
                              items: proposalDeliveryErectionController
                                      .getproposaldeliverylist[0].data.isEmpty
                                  ? []
                                  : proposalDeliveryErectionController
                                      .getproposaldeliverylist[0].data
                                      .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value.deliveryid.toString(),
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 0, right: 4),
                                            child: Text(value.name.toString(),
                                                style: GoogleFonts.jost(
                                                    textStyle: TextStyle(
                                                        fontSize: 10.00.sp,
                                                        color: forminputcolor,
                                                        fontWeight:
                                                            FontWeight.w500)))),
                                      );
                                    }).toList(),
                            ),
                          )),
                    ]),
                     SizedBox(
                      height: 1.0.hp,
                    ),
                    Text(
                      'Delivery*',
                      style: listtitlefont,
                    ),

                    SizedBox(
                      height: 1.0.hp,
                    ),
                    Row(children: [
                      Container(
                          height: 7.00.hp,
                          width: 90.00.wp,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: const Color(0xFFECE9E9),
                              width: MediaQuery.of(context).size.height * 0.001,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: proposalEditController.erection.value.isEmpty?null:proposalEditController.erection.value,
                              style: GoogleFonts.jost(
                                  textStyle: TextStyle(
                                      fontSize: 10.00.sp,
                                      color: forminputcolor,
                                      fontWeight: FontWeight.w500)),
                              hint: Text('Erection',
                                  style: GoogleFonts.jost(
                                      textStyle: TextStyle(
                                          fontSize: 10.00.sp,
                                          color: formhintcolor,
                                          fontWeight: FontWeight.w500))),
                              onChanged: (newValue) {
                                setState(() {
                                  if (newValue != null) {
                                    setState(() {
                                      proposalEditController.erection.value = newValue.toString();
                                      print('newwvalue');
                                      print(newValue.toString());
                                      print('clickkkk');
                                      travelindex = 1;
                                    });
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                color: const Color(0xFF737070),
                              ),
                              items: proposalDeliveryErectionController
                                      .getproposalerection[0].data.isEmpty
                                  ? []
                                  : proposalDeliveryErectionController
                                      .getproposalerection[0].data
                                      .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value.erectionid.toString(),
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 0, right: 4),
                                            child: Text(value.name.toString(),
                                                style: GoogleFonts.jost(
                                                    textStyle: TextStyle(
                                                        fontSize: 10.00.sp,
                                                        color: forminputcolor,
                                                        fontWeight:
                                                            FontWeight.w500)))),
                                      );
                                    }).toList(),
                            ),
                          )),
                    ]),

                      SizedBox(
                    height: 1.0.hp,
                  ),
                  Text(
                    'Power Supply*',
                    style: listtitlefont,
                  ),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Container(
                    color: const Color(0xffD9D9D9).withOpacity(0.1),
                    height: 7.00.hp, width: 100.00.wp,
                    // padding: const EdgeInsets.only(
                    //   left: 20,
                    //   right: 20,
                    // ),
                    child: TextFormField(
                      controller: proposalEditController.powersupply,
                      style: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontSize: 10.00.sp,
                              color: forminputcolor,
                              fontWeight: FontWeight.w500)),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                const BorderSide(color: appcolor, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                                color: const Color(0xffC6C6C6).withOpacity(0.5),
                                width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          hintText: '',
                          contentPadding: const EdgeInsets.only(left: 10),
                          hintStyle: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 10.00.sp,
                                  color: formhintcolor,
                                  fontWeight: FontWeight.w500)),
                          border: const OutlineInputBorder(
                            gapPadding: 4,
                          )),
                    )),
                      SizedBox(
                    height: 1.0.hp,
                  ),
                  Text(
                    'No.of Units*',
                    style: listtitlefont,
                  ),
                  SizedBox(
                    height: 1.0.hp,
                  ),
                  Container(
                    color: const Color(0xffD9D9D9).withOpacity(0.1),
                    height: 7.00.hp, width: 100.00.wp,
                    // padding: const EdgeInsets.only(
                    //   left: 20,
                    //   right: 20,
                    // ),
                    child: TextFormField(
                      controller: proposalEditController.units,
                      style: GoogleFonts.jost(
                          textStyle: TextStyle(
                              fontSize: 10.00.sp,
                              color: forminputcolor,
                              fontWeight: FontWeight.w500)),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                const BorderSide(color: appcolor, width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(
                                color: const Color(0xffC6C6C6).withOpacity(0.5),
                                width: 1),
                          ),
                          fillColor: const Color(0xffC6C6C6),
                          hintText: '',
                          contentPadding: const EdgeInsets.only(left: 10),
                          hintStyle: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 10.00.sp,
                                  color: formhintcolor,
                                  fontWeight: FontWeight.w500)),
                          border: const OutlineInputBorder(
                            gapPadding: 4,
                          )),
                    ),),

                      Container(
                  alignment: Alignment.bottomRight,
                  height: 4.0.hp,
                  width: 50.0.wp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: formhintcolor)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Sub Total: ',
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 8.00.sp,
                                  color: toptitlecolor,
                                  fontWeight: FontWeight.w800)),
                        ),

                        //  proposalSpeedAmtController.getproposalspeedamt.isEmpty?Text('null'):  proposalSpeedAmtController.getproposalspeedamt[0].from=='speedamount'?Text( proposalSpeedAmtController.getproposalspeedamt[0].data[0].subtotal.toString()):
                        //   getAddItemListController.getadditemproposal.isEmpty?Text(''):Text(getAddItemListController.getadditemproposal[0].data[0].subtotal.toString())
                        //getAddItemListController.getadditemproposal.isEmpty?Text('click'):

                       Obx(
                              () => Text(
                                  '${proposalEditController.subtotal.value.toString()}'),
                            
                        
      )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.0.hp,
                ),

                     
                Obx(() {
                  if (proposalTaxdrpdownController.istaxdrpdwnLoad.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (proposalTaxdrpdownController
                      .gettaxdrpdwn.isEmpty) {
                    return Center(
                      child: Text('No data Found'),
                    );
                  } else {
                    return Row(
                      children: [
                        Container(
                          height: 6.0.hp,
                          width: 60.0.wp,
                          decoration: BoxDecoration(
                              border: Border.all(color: formhintcolor),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            children: [
                              Text(listitem.toString()),
                              // Text('Selected Options: ${selectedOptions.join(', ')}'),
                        
                              Container(
                                height: 6.0.hp,
                                width: 40.0.wp,
                                child: DropdownButtonFormField(
                                  key: GlobalKey(),
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                        
                                  isExpanded: true,
                                  // hint:   Text('select tax',style:formhintstyle,),
                                  value: selectedOptions.isEmpty
                                      ? null
                                      : selectedOptions,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOptions = value as List;
                                    });
                                  },
                                  items: proposalTaxdrpdownController
                                          .gettaxdrpdwn[0].data.isEmpty
                                      ? []
                                      : proposalTaxdrpdownController
                                          .gettaxdrpdwn[0].data
                                          .map((option) {
                                            
                                              
                                         
                        
                                          
                                          return DropdownMenuItem(
                                            key: UniqueKey(),
                                            value: option,
                                            child: StatefulBuilder(
                                                builder: (context, setstate) {
                                                   
                                              return CheckboxListTile(
                                                title: Text(
                                                  option.taxrate.toString(),
                                                  style: listtitle,
                                                ),
                                                value: option.bval,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    // if (value != null && value) {
                                                    //   selectedOptions.add(option);
                                                    // } else {
                                                    //   selectedOptions.remove(option);
                                                    // }
                                                      listvalue=value;
                                                    var item =
                                                        proposalTaxdrpdownController
                                                            .gettaxdrpdwn[0].data
                                                            .indexOf(option);
                                                    print(item);
                                                    proposalTaxdrpdownController
                                                        .gettaxdrpdwn[0]
                                                        .data[item]
                                                        .bval = value ?? false;
                                                    print(
                                                        proposalTaxdrpdownController
                                                            .gettaxdrpdwn[0]
                                                            .data[item]
                                                            .bval);
                                                    // if(item==0){
                                                    //   setState(() {
                                                    //     proposalTaxController.gettaxdrpdwn[0].data[1]
                                                    // .bval = true;
                                                    //   });
                                                    // }
                                                    //  if(item==1){
                                                    //   setState(() {
                                                    //     proposalTaxController.gettaxdrpdwn[0].data[0]
                                                    // .bval = true;
                                                    //   });
                                                    // }
                                                    if (item == 0) {
                                                      proposalTaxdrpdownController
                                                          .gettaxdrpdwn[0]
                                                          .data[0]
                                                          .bval = true;
                                                      proposalTaxdrpdownController
                                                          .gettaxdrpdwn[0]
                                                          .data[1]
                                                          .bval = true;
                                                      proposalTaxdrpdownController
                                                          .gettaxdrpdwn[0]
                                                          .data[2]
                                                          .bval = false;
                                                       listitem='${proposalTaxdrpdownController.gettaxdrpdwn[0].data[0].name} ${proposalTaxdrpdownController.gettaxdrpdwn[0].data[1].name}';
                                                       proposalTaxController.proposalTaxController(taxid: '0,1',subtotal: proposalEditController.subtotal.value,total: proposalEditController.total.value);
                                                    }
                                                    if (item == 1) {
                                                      proposalTaxdrpdownController
                                                          .gettaxdrpdwn[0]
                                                          .data[1]
                                                          .bval = true;
                                                      proposalTaxdrpdownController
                                                          .gettaxdrpdwn[0]
                                                          .data[0]
                                                          .bval = true;
                                                      proposalTaxdrpdownController
                                                          .gettaxdrpdwn[0]
                                                          .data[2]
                                                          .bval = false;
                                                      listitem='${proposalTaxdrpdownController.gettaxdrpdwn[0].data[0].name} ${proposalTaxdrpdownController.gettaxdrpdwn[0].data[1].name}';
                                                      proposalTaxController.proposalTaxController(taxid: 0,subtotal: proposalEditController.subtotal.value,total: proposalEditController.total.value);
                                                    }
                                                    if (item == 2) {
                                                      proposalTaxdrpdownController
                                                          .gettaxdrpdwn[0]
                                                          .data[0]
                                                          .bval = false;
                                                      proposalTaxdrpdownController
                                                          .gettaxdrpdwn[0]
                                                          .data[1]
                                                          .bval = false;
                                                      listitem =
                                                          '${proposalTaxdrpdownController.gettaxdrpdwn[0].data[2].name}';
                                                          proposalTaxController.proposalTaxController(taxid: item,subtotal: proposalEditController.subtotal.value,total: proposalEditController.total.value);
                                                    }
                                                    // else{
                                                    //    proposalTaxController.gettaxdrpdwn[0].data[2].bval=false;
                                                    // }
                                                  });
                                                },
                                              );
                                            }),
                                          );
                                        }).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 5.0.hp,
                          width: 30.0.wp,
                          child: Text(proposalEditController.totaltax.value.toString(),style: listtitle,),
                        )
                      ],
                    );
                  }
                }),
                SizedBox(
                  height: 1.0.hp,
                ),
                 Container(
                  alignment: Alignment.bottomRight,
                  height: 4.0.hp,
                  width: 50.0.wp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: formhintcolor)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Total: ',
                          style: GoogleFonts.jost(
                              textStyle: TextStyle(
                                  fontSize: 8.00.sp,
                                  color: toptitlecolor,
                                  fontWeight: FontWeight.w800)),
                        ),

                        //  proposalSpeedAmtController.getproposalspeedamt.isEmpty?Text('null'):  proposalSpeedAmtController.getproposalspeedamt[0].from=='speedamount'?Text( proposalSpeedAmtController.getproposalspeedamt[0].data[0].subtotal.toString()):
                        //   getAddItemListController.getadditemproposal.isEmpty?Text(''):Text(getAddItemListController.getadditemproposal[0].data[0].subtotal.toString())
                        //getAddItemListController.getadditemproposal.isEmpty?Text('click'):

                       Obx(
                              () => Text(
                                  '${proposalEditController.total.value.toString()}'),
                            
                        
      )
                      ],
                    ),
                  ),
                ),
                ElevatedButton(onPressed: (){
                  proposalEditController.proposalupdateController(controlid:proposalEditController.controlid.value,
                  proposalid: widget.proposalid.toString(),leadid: widget.leadid.toString(),status: widget.statename.toString(),currency: widget.currencyname.toString(),
delivery:proposalEditController.delivery.value,erection: proposalEditController.erection.value ,
liftpriceid: proposalEditController.type.value,loadid: proposalEditController.loadid.value,
machineid: proposalEditController.machineid.value,openingid: proposalEditController.openid.value,
operationid: proposalEditController.operationid.value,speedid: proposalEditController.speedid.value,
stopid: proposalEditController.stopid.value,taxid: proposalEditController.taxid.value,
travelid: proposalEditController.delivery.value,

                   );
                }, child: Text('Update'))
                  ])));
        }
      }),
    );
  }
}

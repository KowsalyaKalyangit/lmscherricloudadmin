// import '../../allpackages.dart';
// import '../../controller/add_proposal_controller/add_item_proposal_controller.dart';
// import '../../controller/add_proposal_controller/get_addlistitem_controller.dart';
// import '../../controller/add_proposal_controller/proposal_edit_controller.dart';
// import '../../controller/add_proposal_controller/proposal_operation_amt_controller.dart';
// import '../../controller/add_proposal_controller/proposal_operation_controller.dart';
// import '../../utils/common_variable.dart';
// import '../../utils/textstyles.dart';

// class ProposalEditBalPage extends StatefulWidget {
//   const ProposalEditBalPage({super.key,this.typeid});
//   final String ? typeid;


//   @override
//   State<ProposalEditBalPage> createState() => _ProposalEditBalPageState();
// }

// class _ProposalEditBalPageState extends State<ProposalEditBalPage> {
//   ProposalEditController proposalEditController =
//       Get.put(ProposalEditController());
//         ProposalOperationController proposalOperationController =
//       Get.put(ProposalOperationController());
//       ProposalOperationAmtController proposalOperationAmtController=Get.put(ProposalOperationAmtController());
//        AddItemProposalController addItemProposalController =
//       Get.put(AddItemProposalController());
//   GetAddItemListController getAddItemListController =
//       Get.put(GetAddItemListController());

//       @override
//   void initState() {
//    getfun();
//     super.initState();
//   }
//   getfun(){
//         proposalEditController.proposalEditController(proposalid:);
//     addItemProposalController.addItemProposalController();
//     getAddItemListController.getAddItemListController();
//      proposalOperationController.proposalOperationController();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(),
//     body: Obx((){
//       if(addItemProposalController.isadditemLoad.value&&
//         proposalOperationAmtController.isproposaspeedamtLoad.value){
//         return Center(child: Text('loadingg'),);
//       }
//       else if(
//         addItemProposalController.getadditemproposal.isEmpty ||
//         proposalOperationAmtController.getproposaloperationamt.isEmpty){
//          return Center(child: Text('No data Found'),);
//       }
//       else{
//     return Column(
//         children: [
//            Text(
//                       'Operation*',
//                       style: listtitlefont,
//                     ),
//                     SizedBox(
//                       height: 1.0.hp,
//                     ),
//                     Row(children: [
//                       Container(
//                           height: 7.00.hp,
//                           width: 90.00.wp,
//                           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5.0),
//                             border: Border.all(
//                               color: const Color(0xFFECE9E9),
//                               width: MediaQuery.of(context).size.height * 0.001,
//                             ),
//                           ),
//                           child: DropdownButtonHideUnderline(
//                             child: DropdownButton<String>(
//                               value: proposalEditController.operation.value.isEmpty?null: proposalEditController.operation.value,
//                               style: GoogleFonts.jost(
//                                   textStyle: TextStyle(
//                                       fontSize: 10.00.sp,
//                                       color: forminputcolor,
//                                       fontWeight: FontWeight.w500)),
//                               hint: Text('operation',
//                                   style: GoogleFonts.jost(
//                                       textStyle: TextStyle(
//                                           fontSize: 10.00.sp,
//                                           color: formhintcolor,
//                                           fontWeight: FontWeight.w500))),
//                               onChanged: (newValue) {
//                                 setState(() {
//                                   if (newValue != null) {
//                                     setState(() {
//                                        proposalEditController.operation.value = newValue;
                                   
//                                       print('clickkkk');
//       // commonVariable.commonapidata.value='output';
//                                       proposalOperationAmtController
//                                           .proposalOperationAmtController(
//                                               operationid: newValue,
//                                               typeid: widget
//                                                   .typeid
//                                                   .toString(),
//                                               total: commonVariable.commonapidata
//                                                   .toString(),
//                                               subtotal: commonVariable.commontotal
//                                                   .toString());
//                                       // travelcon=true;
//                                     });
//                                   }
//                                 });
//                               },
//                               icon: Icon(
//                                 Icons.arrow_drop_down,
//                                 size: 20,
//                                 color: const Color(0xFF737070),
//                               ),
//                               items: proposalOperationController
//                                       .getproposalOperation[0].data.isEmpty
//                                   ? []
//                                   : proposalOperationController
//                                       .getproposalOperation[0].data
//                                       .map<DropdownMenuItem<String>>((value) {
//                                       return DropdownMenuItem<String>(
//                                         value: value.operationid.toString(),
//                                         child: Container(
//                                             margin: const EdgeInsets.only(
//                                                 left: 0, right: 4),
//                                             child: Text(value.name.toString(),
//                                                 style: GoogleFonts.jost(
//                                                     textStyle: TextStyle(
//                                                         fontSize: 10.00.sp,
//                                                         color: forminputcolor,
//                                                         fontWeight:
//                                                             FontWeight.w500)))),
//                                       );
//                                     }).toList(),
//                             ),
//                           )),
//                     ]),
//                     SizedBox(
//                       height: 1.0.hp,
//                     ),
      
//         ],
//         );
//   }})
//     );
//   }
// }
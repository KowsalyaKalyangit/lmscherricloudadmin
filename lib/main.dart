 


import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/add_proposal_controller/proposal_tax_controller.dart';
import 'package:leadingmanagementsystem/service/background_service.dart';

import 'package:leadingmanagementsystem/utils/routes.dart';
import 'package:leadingmanagementsystem/view/splash_screen.dart';

 
 
import 'package:permission_handler/permission_handler.dart';

import 'controller/add_proposal_controller/get_tax_controller.dart';


Future main(List<String> args) async {

  WidgetsFlutterBinding.ensureInitialized();
  // await initializeService();


 await Permission.microphone.request();
  await Permission.storage.request();


  runApp(const MyApp());
}

String? token;
checkLogin() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  token = sharedPreferences.getString(Constants.token);
  log('tokeen');
  log(token.toString());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    print('tokennnnn----${token}');

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: Routes.routes,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: Colors.transparent,
          ),
          splashColor: Colors.transparent,
          textTheme: GoogleFonts.jostTextTheme(Theme.of(context).textTheme),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white, // transparent status bar
            systemNavigationBarColor: Colors.black, // navigation bar color
            statusBarIconBrightness: Brightness.dark, // status bar icons' color
            systemNavigationBarIconBrightness:
                Brightness.dark, //navigation bar icons' color
          ),
          child: SplashScreen()
          ,
        ));
  }
}

                                       
class MultiSelectDropdown extends StatefulWidget {
  const MultiSelectDropdown({super.key});

  @override
  State<MultiSelectDropdown> createState() => _MultiSelectDropdownState();
}

class _MultiSelectDropdownState extends State<MultiSelectDropdown> {
 var selectedOptions = [];
 var listitem;
   List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  ProposalTaxDrpDwnController proposalTaxController = Get.put(ProposalTaxDrpDwnController());
  @override
  void initState() {
    proposalTaxController.proposaltaxdrpdwnController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        if (proposalTaxController.istaxdrpdwnLoad.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (proposalTaxController.gettaxdrpdwn.isEmpty) {
          return const Center(
            child: Text('No data Found'),
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(child: Text(listitem.toString()))
,                  Container(
                    height: 10.0.hp,
                    width: 40.0.wp,
                    child: DropdownButtonFormField(
                                
                      isExpanded: true,
                      hint: const Text('Select Options'),
                      value: selectedOptions.isEmpty ? null : selectedOptions,
                      onChanged: (value) {
                        setState(() {
                          selectedOptions = value as List;
                        });
                      },
                      items: proposalTaxController.gettaxdrpdwn[0].data.isEmpty
                          ? []
                          : proposalTaxController.gettaxdrpdwn[0].data.map((option) {
                              return DropdownMenuItem(
                                value: option,
                                child: StatefulBuilder(
                                  builder: (BuildContext
                                    context,StateSetter
                                    setstate) {
                                    return CheckboxListTile(
                                      title: Text(option.name),
                                      value: option.bval,
                                      onChanged: (bool? value) {
                                        setState(() {
                                           
                                          var item = proposalTaxController
                                              .gettaxdrpdwn[0].data
                                              .indexOf(option);
                                          print(item);
                                         
                                          proposalTaxController.gettaxdrpdwn[0].data[item]
                                              .bval = value ?? false;
                                          print(proposalTaxController
                                              .gettaxdrpdwn[0].data[item].bval);
                                               
                                              if(item==0){
                                               proposalTaxController.gettaxdrpdwn[0].data[0].bval=true;
                                                proposalTaxController.gettaxdrpdwn[0].data[1].bval=true;
                                                 proposalTaxController.gettaxdrpdwn[0].data[2].bval=false;
                                                  listitem='${proposalTaxController.gettaxdrpdwn[0].data[0].name} ${proposalTaxController.gettaxdrpdwn[0].data[1].name}';
                                              }
                                               if(item==1){
                                               proposalTaxController.gettaxdrpdwn[0].data[1].bval=true;
                                                proposalTaxController.gettaxdrpdwn[0].data[0].bval=true;
                                                proposalTaxController.gettaxdrpdwn[0].data[2].bval=false;
                                                 listitem='${proposalTaxController.gettaxdrpdwn[0].data[0].name} ${proposalTaxController.gettaxdrpdwn[0].data[1].name}';
                                              }
                                              if(item==2){
                                               proposalTaxController.gettaxdrpdwn[0].data[0].bval=false;
                                                proposalTaxController.gettaxdrpdwn[0].data[1].bval=false;
                                                listitem='${proposalTaxController.gettaxdrpdwn[0].data[2].name}';
                                              }
                                               
                                        });
                                      },
                                    );
                                  }
                                ),
                              );
                            }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              
            ],
          );
        }
      }),
    );
  }
}
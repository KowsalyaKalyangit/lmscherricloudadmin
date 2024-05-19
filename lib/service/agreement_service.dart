import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:leadingmanagementsystem/model/agreement_response.dart';

import '../allpackages.dart';

class AgreementService {
  Future agreementService({dashboard}) async {
    log('enterrrrr');
    try {
      var data = {"dashboard": "getagreement", "staffid": "1"};
      var jsonencode = jsonEncode(data);

      log(data.toString());
      log('dddddddddddd');

      var response =
          await http.post(Uri.parse(Urls.lead_country), body: jsonencode);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: jsonresponse['message']);
        return AgreementModel.fromJson(jsonresponse);
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}

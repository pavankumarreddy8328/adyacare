
import 'package:get/get.dart';

class API extends GetConnect{

  final url = "https://api.thecatapi.com";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    httpClient.baseUrl = "https://api.thecatapi.com";
    httpClient.defaultContentType = "application/json";

  }

  Map<String, String> headers(){
    return {
      "x-api-key" : "live_sfUJRlYqYdXaOsSuZB37K8b8XgyxK3kYNymsa2ngJmD5tK7Qg2h44vnhCPdCj142"
    };
  }

 
}
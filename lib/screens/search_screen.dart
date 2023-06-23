
import 'package:adyacare/controllers/controllers_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchDelegate extends SearchDelegate{

  HomeController homeController = Get.find();
 @override
  // TODO: implement keyboardType
  TextInputType? get keyboardType => TextInputType.text;

 
  @override
  // TODO: implement textInputAction
  TextInputAction get textInputAction => TextInputAction.done;

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => "Search";

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return ThemeData(
      primaryColor: const Color(0xFF9B51E0),
     
      inputDecorationTheme: const InputDecorationTheme(
        
        border: InputBorder.none,
        labelStyle: TextStyle(color: Color(0xFF9B51E0),
        ),
        floatingLabelStyle: TextStyle(color: Color(0xFF9B51E0),
        ),
        helperStyle: TextStyle(color: Color(0xFF9B51E0),
        ),
        counterStyle: TextStyle(color: Color(0xFF9B51E0),
        ),
       hintStyle: TextStyle(
      fontStyle: FontStyle.italic,
      color: Color(0xFF9B51E0)
    )
      ),
      appBarTheme: const AppBarTheme(

        backgroundColor: Color(0xFF020381),
      ),);
  }

  


  @override
  // TODO: implement searchFieldStyle
  TextStyle? get searchFieldStyle => const TextStyle(
    fontStyle: FontStyle.italic,
    color: Colors.black
  );
  

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
     return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
   IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults

   
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
   return Container();
  }

  

}
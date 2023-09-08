// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:vita_sprint/constants/app_colors.dart';
// import 'package:vita_sprint/data/recipes/recipe_model.dart';
// import 'package:vita_sprint/data/recipes/recipe_remote_service.dart';
// import 'package:vita_sprint/screens/home/widgets/recipe_list_item.dart';
//
// class ExploreTab extends StatefulWidget {
//   const ExploreTab({super.key});
//
//   @override
//   State<ExploreTab> createState() => _ExploreTabState();
// }
//
// class _ExploreTabState extends State<ExploreTab> {
//   int _selectedIndex = 0;
//
//   void updateIndex(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   List<RecipeModel>? recipes;
//   List<dynamic> users = [];
//   var isLoaded = false;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchUsers();
//   }
//
//   void fetchUsers() async {
//     print('fetchUsers called');
//     final url = Uri.parse('https://tasty.p.rapidapi.com/recipes/list');
//     final headers = {
//       'X-RapidAPI-Key': '9e866bf40cmsh449f4c8e047320ap166e3fjsnce28506720c6',
//       'X-RapidAPI-Host': 'tasty.p.rapidapi.com',
//     };
//     //const url = 'https://randomuser.me/api/?results=20';
//     //final uri = Uri.parse(url);
//     final response = await http.get(url, headers: headers);
//     final body = response.body;
//     final json = jsonDecode(body);
//     setState(() {
//       users = json['results'];
//       isLoaded = true;
//     });
//   }
//
//   getData() async {
//     // recipes = await RecipeRemoteService().fetchRecipe().then((recipe) {
//     //   print('Recipe title: ${recipe.name}');
//     //   print('Recipe description: ${recipe.id}');
//     // }).catchError((error) {
//     //   print('x Error: $error');
//     // });
//     recipes?.add(await RecipeRemoteService().fetchRecipe());
//     if (recipes != null) {
//       setState(() {
//         isLoaded = true;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Column(
//       children: [
//         Container(
//           margin: EdgeInsets.all(24),
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: AppColors.bgColor1,
//             ),
//             borderRadius: BorderRadius.all(Radius.circular(24)),
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Expanded(
//                 child: _selectedIndex == 0
//                     ? ActiveTabButton(
//                         text: "Recipes",
//                         onTap: () {
//                           updateIndex(0);
//                         },
//                       )
//                     : PassiveTabButton(
//                         text: "Recipes",
//                         onTap: () {
//                           updateIndex(0);
//                         },
//                       ),
//               ),
//               Expanded(
//                   child: _selectedIndex == 1
//                       ? ActiveTabButton(
//                           text: "Articles",
//                           onTap: () {
//                             updateIndex(1);
//                           },
//                         )
//                       : PassiveTabButton(
//                           text: "Articles",
//                           onTap: () {
//                             updateIndex(1);
//                           },
//                         ))
//             ],
//           ),
//         ),
//         Visibility(
//             replacement: CircularProgressIndicator(),
//             visible: isLoaded,
//             child: Expanded(
//               child: ListView.builder(
//                 itemCount: users.length,
//                 itemBuilder: (context, index) {
//                   final user = users[index];
//                   final name = user['name'];
//                   final des = user['description'];
//                   final thumb_url = user['thumbnail_url'];
//                   return RecipeListItem(des: des,name: name,thumb_url: thumb_url,);
//                 },
//               ),
//             ))
//       ],
//     ));
//   }
// }
//
// class ActiveTabButton extends StatelessWidget {
//   String text;
//   VoidCallback onTap;
//   ActiveTabButton({super.key, required this.text, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: AppColors.appBlue,
//           border: Border.all(
//             color: Colors.transparent,
//           ),
//           borderRadius: BorderRadius.all(Radius.circular(24)),
//         ),
//         padding: EdgeInsets.only(top: 12, bottom: 12, left: 32, right: 32),
//         child: Text(text, textAlign: TextAlign.center),
//       ),
//     );
//   }
// }
//
// class PassiveTabButton extends StatelessWidget {
//   String text;
//   VoidCallback onTap;
//   PassiveTabButton({super.key, required this.text, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: Colors.transparent,
//           ),
//           borderRadius: BorderRadius.all(Radius.circular(24)),
//         ),
//         padding: EdgeInsets.only(top: 12, bottom: 12, left: 32, right: 32),
//         child: Text(text, textAlign: TextAlign.center),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

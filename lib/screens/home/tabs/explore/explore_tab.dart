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

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitasprint/blocs/recipes/recipe_bloc.dart';
import 'package:vitasprint/constants/app_colors.dart';
import 'package:vitasprint/screens/home/widgets/recipe_item.dart';

import '../../../../data/remote/repositories/recipe_repository.dart';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Import your RecipeBloc and RecipeState classes here

class ExploreTab extends StatefulWidget {
  ExploreTab({Key? key}) : super(key: key);

  @override
  _ExploreTabState createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab> {
  @override
  Widget build(BuildContext context) {
    return  ExploreView();
  }
}

class ExploreView extends StatelessWidget {
  ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 150,
              decoration: const BoxDecoration(
                  color: AppColors.green1,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(32),bottomLeft: Radius.circular(32))
              ),
            ),

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white38,
              ),
              margin: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
              child: Text("search...",style: TextStyle(color: Colors.black45),),
            )
          ],
        ),
        RecipeListView(),
      ],
    );
  }
}

class RecipeListView extends StatefulWidget {
  const RecipeListView({super.key});

  @override
  State<RecipeListView> createState() => _RecipeListViewState();
}

class _RecipeListViewState extends State<RecipeListView> {
  final ref = FirebaseDatabase.instance.ref('recipes');
  late final RecipeBloc recipeBloc;

  @override
  void initState() {
    super.initState();
    recipeBloc = RecipeBloc(RecipeRepository());
    recipeBloc.appLaunch();
  }

  @override
  void dispose() {
    recipeBloc
        .close(); // Don't forget to close the bloc to prevent memory leaks.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => recipeBloc,
      child: BlocBuilder<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoading) {
            return const Expanded(
                child: Center(child: CircularProgressIndicator()));
          } else if (state is RecipeLoaded) {
            final data = state.data;
            return Expanded(
                child: ListView.builder(
              shrinkWrap: false,
              padding: EdgeInsets.only(top: 12),
              itemCount: data.length,
              itemBuilder: (context, index) {
                // Build your list item using the data
                return RecipeItem(
                    name: data[index].name,
                    des: data[index].description,
                    time: data[index].cookingTime.toString());
              },
            ));
          } else if (state is RecipeError) {
            return Text(state.error);
          } else {
            return Text('Initial State');
          }
        },
      ),
    );
  }
}

/*
FirebaseAnimatedList(query: ref,
        itemBuilder: (context,snapshot, animation, index){
      return ListTile(
        title: Text(snapshot.child("name").value.toString()),
        subtitle: Text(snapshot.child("description").value.toString()),
      );
        }
    )
 */

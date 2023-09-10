import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitasprint/blocs/recipes/recipe_bloc.dart';
import 'package:vitasprint/constants/app_colors.dart';
import 'package:vitasprint/screens/home/widgets/recipe_item.dart';

import '../../../data/remote/repositories/recipe_repository.dart';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({Key? key}) : super(key: key);

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
  const ExploreView({super.key});

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
              padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.white38,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
              child: const Text("search...",style: TextStyle(color: Colors.black45),),
            )
          ],
        ),
        const RecipeListView(),
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
              padding: const EdgeInsets.only(top: 12),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return RecipeItem(
                    name: data[index].name,
                    des: data[index].description,
                    time: data[index].cookingTime.toString());
              },
            ));
          } else if (state is RecipeError) {
            return Text(state.error);
          } else {
            return const Expanded(child: Center(child: Text('Error'),));
          }
        },
      ),
    );
  }
}

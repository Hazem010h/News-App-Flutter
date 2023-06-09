import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/AppStates.dart';
import 'package:news_app/NewsCubit.dart';
import 'package:news_app/reusable_function.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,AppStates>(
      listener:(context,state){},
      builder:(context,state){

        NewsCubit cubit=NewsCubit.get(context);
        List articales=cubit.articales;

        return ConditionalBuilder(
        condition: articales.isNotEmpty,
        builder: (context)=> ListView.separated(
            itemBuilder: (context,index)=>buildArticaleItem(articales[index],context),
            separatorBuilder: (context,index)=>myDivider(),
            itemCount: 10,
        ),
        fallback: (context)=>const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    );
  }
}

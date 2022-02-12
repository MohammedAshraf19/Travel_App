import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/layout/cubit/cubit.dart';
import 'package:travel_app/layout/cubit/states.dart';
import '../modules/category_trips_screen.dart';
import 'package:travel_app/shared/components/components.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>TravelCubit(),
      child: BlocConsumer<TravelCubit,TravelStates>(
        listener: (context,state){},
        builder: (context,state){

          return GridView(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent:200,
                childAspectRatio: 7/8,
                crossAxisSpacing: 1,
                mainAxisSpacing: 0.5
            ),
            children:TravelCubit.get(context)
                .categoryModel
                .map((categoryData) =>categoryBuild(
                title: categoryData.title,
                imageUrl: categoryData.imageUrl,
                context: context,
              id: categoryData.id
            ))
                .toList() ,
          );
        },
      ),
    );
  }

  Widget categoryBuild({
   required String title,
    required String imageUrl,
    required String id,
    required BuildContext context
})=>InkWell(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> CategoryTripsScreen(title: title,imageUrl: imageUrl,id: id,)),
      );
    },
  child:   Padding(
    padding: const EdgeInsets.all(7.0),
    child:   Stack(



     //   alignment: Alignment.center,



        children:  [



          ClipRRect(



            borderRadius: BorderRadius.circular(15),



            child: Image(







              image: NetworkImage(







                imageUrl,







              ),







              fit: BoxFit.cover,







              height: 250,







             // width: 165,







            ),



          ),



           Container(







             padding: const EdgeInsets.all(5),







             decoration:  BoxDecoration(







               color: Colors.black.withOpacity(0.1),







               borderRadius: BorderRadius.circular(15),







             ),







             clipBehavior: Clip.antiAliasWithSaveLayer,







             alignment: Alignment.center,







             child: Text(







              title,







              style: const TextStyle(







                  color: Colors.white,







                  fontWeight: FontWeight.bold,







                  fontSize: 25







              ),







          ),







           ),



        ],



      ),
  ),
);
}

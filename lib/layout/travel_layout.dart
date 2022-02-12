import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/layout/cubit/cubit.dart';
import 'package:travel_app/layout/cubit/states.dart';
import 'package:travel_app/modules/filter_screen.dart';

class TravelLayout extends StatelessWidget {
  const TravelLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>TravelCubit(),
      child: BlocConsumer<TravelCubit,TravelStates>(
        listener: (context,state){},
        builder: (context,state)=>Scaffold(
          appBar: AppBar(
            title:Center(
              child: Text(
                  TravelCubit.get(context).name[TravelCubit.get(context).currentIndex],

              ),
            ) ,
          ),
          body: TravelCubit.get(context).screen[TravelCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: TravelCubit.get(context).currentIndex,
            backgroundColor: Colors.blue,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.amber,
            onTap: (index){
              TravelCubit.get(context).changeBottomNav(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                ),
                label: 'التصنيفات',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                label: 'المفضلات',
              ),
            ],
          ),
          drawer: Drawer(
    child: Column(
    children: [
      Container(
        height: 100,
        width: double.infinity,
        alignment: Alignment.center,
        color: Colors.amber,
        padding: const EdgeInsetsDirectional.only(top: 40),
        child: const Text(
          'دليلك السياحى',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30
          ),
        ),
      ),
     /* const DrawerHeader(

        decoration: BoxDecoration(
          color: Colors.amber,
        ),
        child: Text(
          'دليلك السياحى',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),
        ),
      ),*/
      const SizedBox(height: 10,),
      ListTile(
        leading: const Icon(
          Icons.wallet_giftcard,
          color: Colors.blue,
          size: 30,
        ),
        title: const Text(
          'الرحلات',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),

        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder:(context)=>const TravelLayout() ),
          );
        },
      ),
      ListTile(
        leading: const Icon(
          Icons.filter_alt_rounded,
          color: Colors.blue,
          size: 30,
        ),
        title: const Text(
          'التصنيفات',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),

        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder:(context)=>const FilterScreen() ),
          );
        },
      ),
    ],
    ),
          ),
        ),
      ),
    );
  }
}

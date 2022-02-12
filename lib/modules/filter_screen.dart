import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/layout/cubit/cubit.dart';
import 'package:travel_app/layout/cubit/states.dart';

import '../layout/travel_layout.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>TravelCubit(),
      child: BlocConsumer<TravelCubit,TravelStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
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
            appBar: AppBar(
              title: const Center(
                child:  Text(
                  'بحث التصفيه',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: (){},
                    icon: const Icon(
                        Icons.save_rounded
                    )
                ),
              ],
            ),
            body: Column(

              children: [
                const SizedBox(height: 50,),
                Expanded(
                  child: ListView(
                    children: [
                      SwitchListTile(
                          title:const Text(
                            'رحلات صيفيه',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ) ,
                          subtitle: Text(
                            'اظهار الرحلات في فصل الصيف فقط',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          value: TravelCubit.get(context).switchValue,
                          activeColor:  Colors.amber,
                          onChanged: (value){
                            TravelCubit.get(context).changeSwitchValue(value);
                          }
                      ),
                      SwitchListTile(
                          title:const Text(
                            'رحلات شتويه',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ) ,
                          subtitle: Text(
                            'اظهار الرحلات في فصل الشتاء فقط',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          value: TravelCubit.get(context).switchValue2,
                          activeColor:  Colors.amber,
                          onChanged: (value){
                            TravelCubit.get(context).changeSwitchValue2(value);
                          }
                      ),
                      SwitchListTile(
                          title:const Text(
                            'للعائلات',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ) ,
                          subtitle: Text(
                            'اظهار الرحلات للعائلات فقط',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          value: TravelCubit.get(context).switchValue3,
                          activeColor:  Colors.amber,
                          onChanged: (value){
                            TravelCubit.get(context).changeSwitchValue3(value);
                          }
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

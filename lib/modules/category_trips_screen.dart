import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/layout/cubit/cubit.dart';
import 'package:travel_app/layout/cubit/states.dart';
import 'package:travel_app/modules/trips_details_screen.dart';

class CategoryTripsScreen extends StatelessWidget {
   String id;
   String title;
   String imageUrl;
  CategoryTripsScreen({
    required this.title,
    required this.id,
    required this.imageUrl
});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>TravelCubit(),
      child: BlocConsumer<TravelCubit,TravelStates>(
        listener: (context,state){},
        builder: (context,state){
          final filterTrips = TravelCubit.get(context).tripModel.where((element){
            return element.categories.contains(id);
          }).toList();
          return Scaffold(
            appBar: AppBar(
              title:  Text(
                  title,
              ),
              leading: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_outlined,
                  )
              ),
            ),
            body: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>TripsDetailsScreen(
                        title: filterTrips[index].title,
                        activities: filterTrips[index].activities,
                        imageUrl: filterTrips[index].imageUrl,
                        program: filterTrips[index].program,
                        tripId: filterTrips[index].id,
                      )
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                      elevation: 5,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children:  [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child:  Image(
                                  image: NetworkImage(
                                    filterTrips[index].imageUrl,
                                  ),
                                  fit: BoxFit.cover,
                                  height: 200,
                                  width: double.infinity,
                                ),



                              ),



                              Container(







                                padding: const EdgeInsets.all(5),







                                decoration:  BoxDecoration(







                                  color: Colors.black.withOpacity(0.1),







                                  borderRadius: BorderRadius.circular(15),







                                ),







                                clipBehavior: Clip.antiAliasWithSaveLayer,







                                alignment: Alignment.bottomRight,







                                child:  Text(







                                  filterTrips[index].title,







                                  style: const TextStyle(







                                      color: Colors.white,







                                      fontWeight: FontWeight.bold,







                                      fontSize: 25







                                  ),







                                ),







                              ),



                            ],



                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    children:  [
                                      const Icon(
                                        Icons.calendar_today,
                                        color: Colors.amber,
                                      ),
                                      const SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        '${filterTrips[index].duration} ايام',
                                        style: const TextStyle(
                                            fontSize: 15
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if(filterTrips[index].isInSummer&&!filterTrips[index].isInWinter)
                                  Expanded(
                                    child: Row(
                                      children:  const [
                                        Icon(
                                          Icons.wb_sunny,
                                          color: Colors.amber,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          'الصيف',
                                          style: TextStyle(
                                              fontSize: 15
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if(filterTrips[index].isInWinter&&!filterTrips[index].isInSummer)
                                  Expanded(
                                    child: Row(
                                      children:  const [
                                        Icon(
                                          Icons.ice_skating_outlined,
                                          color: Colors.amber,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          'الشتاء',
                                          style: TextStyle(
                                              fontSize: 15
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if(filterTrips[index].isInWinter&&filterTrips[index].isInSummer||!filterTrips[index].isInWinter&&!filterTrips[index].isInSummer)
                                  Expanded(
                                    child: Row(
                                      children:  const [
                                        Icon(
                                          Icons.wb_sunny,
                                          color: Colors.amber,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          'ربيع',
                                          style: TextStyle(
                                              fontSize: 15
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                if(filterTrips[index].isForFamilies)
                                  Expanded(
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.family_restroom_rounded,
                                          color: Colors.amber,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          'Expensive',
                                          style: TextStyle(
                                              fontSize: 15
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if(!filterTrips[index].isForFamilies)
                                  Expanded(
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.family_restroom_rounded,
                                          color: Colors.amber,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          'نقاه',
                                          style: TextStyle(
                                              fontSize: 15
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context,index)=>const SizedBox(height: 1,),
              itemCount: filterTrips.length,
            ),
          );
        },
      ),
    );
  }
}

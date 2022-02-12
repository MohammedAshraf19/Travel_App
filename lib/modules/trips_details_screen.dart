import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/layout/cubit/cubit.dart';
import 'package:travel_app/layout/cubit/states.dart';

class TripsDetailsScreen extends StatelessWidget {
  String imageUrl;
  List<String> activities;
  List<String> program;
  String title;
  String tripId;
  TripsDetailsScreen({
    required this.tripId,
    required this.imageUrl,
    required this.title,
    required this.program,
    required this.activities,
});

  @override
  Widget build(BuildContext context) {
  //  bool isFavourite = TravelCubit.get(context).favourite;
    return BlocProvider(
      create: (BuildContext context)=>TravelCubit(),
      child: BlocConsumer<TravelCubit,TravelStates>(
        listener: (context,state){},
        builder: (context,state){
            return Scaffold(
            appBar: AppBar(
              title: const Center(
                child:  Text(
                    'شاطئ الغرام'
                ),
              ),
              leading: IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_outlined,
                  )
              ),
              elevation: 0,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                 Image(
                  image: NetworkImage(
                    imageUrl,
                  ),
                  width: double.infinity,
                  height: 210,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'الانشطه',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,

                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    elevation: 5,
                    borderOnForeground: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child:ListView.separated(
                        itemBuilder:(context,index)=> Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            activities[index],
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w300
                            ),
                          ),
                        ) ,
                        separatorBuilder: (context,index)=>Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey[200],
                        ),
                        itemCount: activities.length
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'البرنامج اليومى',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,

                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    elevation: 5,
                    borderOnForeground: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child:ListView.separated(
                        itemBuilder:(context,index)=> Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            scrollDirection:  Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:   [
                                 CircleAvatar(
                                  child: Text(
                                    'يوم${index+1}',
                                    style: const TextStyle(
                                        color: Colors.lightBlue,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  backgroundColor: Colors.amber,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  program[index],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w300
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ) ,
                        separatorBuilder: (context,index)=>Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey[200],
                        ),
                        itemCount: program.length
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                TravelCubit.get(context).isFavourite();
              },
              mini: true,
              child:  Icon(
               TravelCubit.get(context).favourite?Icons.star :Icons.star_outline_sharp,
                color: Colors.black,
                size: 20,
              ),
              backgroundColor: Colors.amber,
            ),
          );
        },
      ),
    );
  }
}

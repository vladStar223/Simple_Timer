import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'block/swich_bloc.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: BlocProvider(
        create: (context) => SwichBloc(),
        child: Stack(
          children: [
            const Background(),
            Column(
              children: [
                const SizedBox(height: 150,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Таймер', style: TextStyle(fontSize: 50,color: Colors.white),),
                  ],
                ),
                const SizedBox(height: 50,),
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueAccent,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(35)),
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    child: BlocBuilder<SwichBloc, SwichState>(
                      builder: (context, state) {
                        var mi = (state.duration/60).floor().toString().padLeft(2,'0');
                        var sec = (state.duration%60).floor().toString().padLeft(2,'0');
                        return Center(child:
                        Text('$mi:$sec',style: const TextStyle(fontSize: 50,color: Colors.white),
                    
                        ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(
                  height: 60,
                ),
                BlocBuilder<SwichBloc, SwichState>(
                  builder: (context, state) {
                    if(state is SwichInitial){
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              BlocProvider.of<SwichBloc>(context).add(SwichStartedEvent());
                            },
                            child: const Icon(Icons.not_started_outlined, size: 50,color: Colors.white,),
                          ),
                        ],
                      );
                    }
                    else{
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              BlocProvider.of<SwichBloc>(context).add(SwichPauseEvent(state.duration));
                            },
                            child: const Icon(Icons.pause, size: 50,color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                BlocProvider.of<SwichBloc>(context).add(SwichStartedEvent());
                              },
                              child: const Icon(Icons.restart_alt, size: 50,color: Colors.white))
                        ],
                      );

                    }

                  },
                )
              ],
            ),
          ],
        )
      ),
    );
    throw UnimplementedError();
  }

}


class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.blue.shade500,
            ],
          ),
        ),
      ),
    );
  }
}
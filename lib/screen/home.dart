import 'package:flutter/material.dart';
import 'package:tmdb_api/API/api.dart';
import 'package:tmdb_api/screen/move_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Future <List<Movie>> upcomingMovies;
  late Future <List<Movie>> PopularMovies;
  late Future <List<Movie>> TopRatedMovies;
  @override

  void initState(){
    upcomingMovies = Api().getUpComingMovies();
    PopularMovies = Api().getPopularMovies();
    TopRatedMovies = Api().getTopRatedMovies();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 7, 19),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 35, 92),
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
        title: const Text('MovieDB'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded)),
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications)
      )],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Upcoming', 
              style: TextStyle(
                fontSize: 15, 
                color: Colors.white)
                ,),
                FutureBuilder(future: upcomingMovies, 
                builder: (context, snapshot){
                  if (!snapshot.hasData){
                    return const Center(
                      child: CircularProgressIndicator(),);
                  }
                  final movies = snapshot.data!;
                  
                  return CarouselSlider.builder(
                    itemCount: movies.length, 
                    itemBuilder: (context, index, movieIndex){
                      final movie = movies [index];
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: 
                        Image.network("https://image.tmdb.org/t/p/original/${movie.backDropPath}"),
                        
                        
                      );
                    }, 
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 1.4,
                      autoPlayInterval: const Duration(seconds: 5)
                    ));
                }

                
                ),
                const Text("Popular", style: TextStyle(fontSize: 15, color: Colors.white),),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 200,
                  child: FutureBuilder(
                    future: PopularMovies,
                   builder: (context, snapshot){
                    if (!snapshot.hasData){
                      return const Center(
                        child: CircularProgressIndicator(),);
                    }
                    final movies = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index){
                        final movie = movies [index];

                        return Container(
                          width: 150,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network("https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                            height: 12,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            ),
                          ),
                        );
                        
                      }
                  );}
                   ),
                ),
                const Text("Top Rated", style: TextStyle(fontSize: 15, color: Colors.white),),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 200,
                  child: FutureBuilder(
                    future: TopRatedMovies,
                   builder: (context, snapshot){
                    if (!snapshot.hasData){
                      return const Center(
                        child: CircularProgressIndicator(),);
                    }
                    final movies = snapshot.data!;
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index){
                        final movie = movies [index];

                        return Container(
                          width: 150,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network("https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                            height: 12,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            ),
                            
                          ), 
                          
                        );
                
                
  }
                  );
   } )
  )
  ],
            
          ),
        ),
      ),
    );
  }
}
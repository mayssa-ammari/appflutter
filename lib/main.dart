

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
//import 'package:percent_indicator/percent_indicator.dart';
//import 'package:cupertino_icons/cupertino_icons.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TrainingJournalScreen(),
    );
  }
}

class TrainingJournalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Journal d\'entraînement'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CalendarSection(),
            StatsSection(),
            WeightStatisticsSection(),
            TrainingHistorySection(),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.blueGrey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.directions_bike), label: 'Entraînement'),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: 'Progression'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Nutrition'),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up), // Icône pour la progression
            label: 'Progression',
          ),
        ],
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.yellow,
        backgroundColor: Colors.grey,

      ),
    );
  }
}



class CalendarSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 100,  // Fixe la hauteur pour que le scroller ne prenne pas tout l'espace vertical
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 30, // Par exemple, pour afficher 30 jours
        itemBuilder: (context, index) {
          return Container(
            width: 60, // Largeur fixe pour chaque date
            margin: EdgeInsets.only(right: 8.0), // Espace entre les éléments
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _getDayOfWeek(index), // Fonction pour obtenir le jour de la semaine
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text('${1 + index}'),
                SizedBox(height: 8.0),
                Icon(
                  Icons.circle,
                  size: 8.0,
                  color: index == 3 ? Colors.yellow : Colors.grey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Fonction pour obtenir le jour de la semaine à partir de l'index
  String _getDayOfWeek(int index) {
    List<String> days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return days[index % 7];
  }
}


class StatsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatCard(title: 'Entraînement', value: '1h 35min', icon: Icons.fitness_center),
          StatCard(title: 'Calories', value: '820 Kcl', icon: Icons.local_fire_department),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  StatCard({required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 86.0,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 1, blurRadius: 7, offset: Offset(0, 3))],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.yellow, size: 20.0),
              SizedBox(width: 6.0),
              Text(title, style: TextStyle(fontSize: 14.0)),
            ],
          ),
          SizedBox(height: 6.0),
          Text(value, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class WeightStatisticsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Statistiques de poids'),
          SizedBox(height: 16.0),
          Container(
            height: 200.0,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 60),
                      FlSpot(1, 58),
                      FlSpot(2, 62),
                      FlSpot(3, 64),
                      FlSpot(4, 63),
                      FlSpot(5, 61),
                      FlSpot(6, 65),
                    ],
                    isCurved: true,
                    colors: [Colors.yellow],
                    barWidth: 4,
                    belowBarData: BarAreaData(show: true, colors: [Colors.yellow.withOpacity(0.3)]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class TrainingHistorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Historique d\'entraînement',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
          ),
          SizedBox(height: 16.0),

          Image.asset(
            'assets/history.jpg',
            width: 326.0,
            height: 139.0,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

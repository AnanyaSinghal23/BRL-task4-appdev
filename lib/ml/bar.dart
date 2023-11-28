


import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartPage extends StatelessWidget {
  final Map<String, double> dataMap = {
    "client": 81,
    "team": 71,
    "meeting": 56,
    "let": 53,
    "max": 47,
    "ready": 31,
    "submission": 31,
    "share": 27,
    "morning": 24,
    "project": 24,
    "lunch": 24,
    "ensure": 24,
    "follow": 24,
    "feedback": 23,
    "back": 23,
    "day": 23,
    "final": 23,
    "media": 21,
    "omitted": 21,
    "review": 21,
    "break": 20,
    "demo": 20,
    "progress": 19,
    "pm": 11,
    "time": 10,
    "check": 10,
    "end": 10,
    "discuss": 10,
    "work": 10,
    "forward": 10,
    "additional": 10,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Most Used Words Chart'),
      ),
      body: Column(
        children: [

            Expanded(
            child: BarChart(
              BarChartData(
                barGroups: dataMap.entries
                    .map((entry) => BarChartGroupData(
                          x: dataMap.keys.toList().indexOf(entry.key),
                          barRods: [
                            BarChartRodData(
                              toY: entry.value,
                              color: getRandomColor(),
                            
                            ),
                          ],
                        ))
                    .toList(),
                borderData: FlBorderData(show: true),
                // titlesData: FlTitlesData(
                //   bottomTitles: SideTitles(
                //     showTitles: true,
                //     getTitles: (value) => dataMap.keys.toList()[value.toInt()],
                //   ),
                 //
                 // leftTitles: SideTitles(showTitles: false),
        
                
              ),
            )
          ),
          
          SizedBox(height: 20),
         
          SizedBox(height: 20),
         
        ]
      )
              );
            
  }

  Color getRandomColor() {
    return Color.fromRGBO(
      50 + (dataMap.length * 5),
      100 + (dataMap.length * 10),
      150 + (dataMap.length * 15),
      1,
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class PieChartPage extends StatelessWidget {
//   final Map<String, double> dataMap = {

//   "client": 81,
//   "team": 71,
//   "meeting": 56,
//   "let": 53,
//   "max": 47,
//   "ready": 31,
//   "submission": 31,
//   "share": 27,
//   "morning": 24,
//   "project": 24,
//   "lunch": 24,
//   "ensure": 24,
//   "follow": 24,
//   "feedback": 23,
//   "back": 23,
//   "day": 23,
//   "final": 23,
//   "media": 21,
//   "omitted": 21,
//   "review": 21,
//   "break": 20,
//   "demo": 20,
//   "progress": 19,
//   // "tomorrow": 19,
//   // "thanks": 18,
//   // "shared": 17,
//   // "insights": 17,
//   // "great": 17,
//   // "updates": 16,
//   // "good": 15,
//   // "sprint": 15,
//   // "everything": 15,
//   // "tasks": 14,
//   // "requirements": 14,
//   // "today": 13,
//   // "optimizations": 13,
//   // "bug": 12,
//   // "performance": 12,
//   // "news": 11,
//   // "needed": 11,
//   // "1": 11,
//   // "30": 11,
//   "pm": 11,
//   "time": 10,
//   "check": 10,
//   "end": 10,
//   "discuss": 10,
//   "work": 10,
//   "forward": 10,
//   "additional": 10

//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Most Used Words Pie Chart'),
//       ),
//       body: Center(
//         child: PieChart(
//           swapAnimationDuration: Duration(milliseconds: 150), // Optional
//           PieChartData(
//             sectionsSpace: 5.0,
//             centerSpaceRadius: 30.0,
//             sections: dataMap.entries.map((entry) {
//               return PieChartSectionData(
//                 color: getRandomColor(),
//                 value: entry.value,
//                 title: entry.key,
//                 radius: 150.0,
//                 titleStyle: TextStyle(
//                   fontSize: 8.0,
//                   fontWeight: FontWeight.bold,
//                   color: const Color.fromARGB(255, 0, 0, 0),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }

//   Color getRandomColor() {
//     return Color.fromRGBO(
//       50 + (dataMap.length * 5),
//       100 + (dataMap.length * 10),
//       150 + (dataMap.length * 15),
//       1,
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class PieChartPage extends StatelessWidget {
//   final Map<String, double> dataMap = {
//     "client": 81,
//     "team": 71,
//     "meeting": 56,
//     "let": 53,
//     "max": 47,
//     "ready": 31,
//     "submission": 31,
//     "share": 27,
//     "morning": 24,
//     "project": 24,
//     "lunch": 24,
//     "ensure": 24,
//     "follow": 24,
//     "feedback": 23,
//     "back": 23,
//     "day": 23,
//     "final": 23,
//     "media": 21,
//     "omitted": 21,
//     "review": 21,
//     "break": 20,
//     "demo": 20,
//     "progress": 19,
//     "pm": 11,
//     "time": 10,
//     "check": 10,
//     "end": 10,
//     "discuss": 10,
//     "work": 10,
//     "forward": 10,
//     "additional": 10,
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Most Used Words Pie Chart'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: PieChart(
//               swapAnimationDuration: Duration(milliseconds: 150), // Optional
//               PieChartData(
//                 sectionsSpace: 5.0,
//                 centerSpaceRadius: 30.0,
//                 sections: dataMap.entries.map((entry) {
//                   return PieChartSectionData(
//                     color: getRandomColor(),
//                     value: entry.value,
//                     title: entry.key,
//                     radius: 150.0,
//                     titleStyle: TextStyle(
//                       fontSize: 8.0,
//                       fontWeight: FontWeight.bold,
//                       color: const Color.fromARGB(255, 0, 0, 0),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Expanded(
//             child: LineChart(

//               LineChartData(
//                 lineTouchData: LineTouchData(
//                   enabled: true,
//                   touchTooltipData: LineTouchTooltipData(
//                     tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
//                   ),
                
//                   // read about it in the LineChartData section
//                   ),
//               )
//                // Optional
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Color getRandomColor() {
//     return Color.fromRGBO(
//       50 + (dataMap.length * 5),
//       100 + (dataMap.length * 10),
//       150 + (dataMap.length * 15),
//       1,
//     );
//   }
// }

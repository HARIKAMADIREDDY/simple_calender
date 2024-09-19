import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart'; 

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    )

  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime today=DateTime.now();
  void _onDaySelected(DateTime day,DateTime focusedDay){
    setState(() {
      today=day;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
       AppBar(
        backgroundColor: Colors.grey,
        title: Text('welcome to calender may this day makes you more special'),),
      body: content(),
 );

  }
  @override
  // TODO: implement widget
  Widget content(){
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
          children: [
             Text("Selected Day = " + DateFormat('yyyy-MM-dd').format(today)),
            Container(
              child: TableCalendar(
                locale: "en_US",
                //rowHeight: 4,
               headerStyle: HeaderStyle(formatButtonVisible: false,titleCentered: true),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day)=> isSameDay(day, today),
                focusedDay: today, 
                firstDay: DateTime.utc(2010,10,16), 
                lastDay: DateTime.utc(2030,3,14),
                onDaySelected: _onDaySelected,
                
                ),
            ),
          ],
        
        ),
    );
    
    
  
  }
}


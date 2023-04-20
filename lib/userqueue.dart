import 'package:flutter/material.dart';

class UserQueuePage extends StatefulWidget {
  final int startHour;
  final int endHour;
  final DateTime bookingDate;
  List<DateTime> bookedTimes = [];

  UserQueuePage({
    required this.startHour,
    required this.endHour,
    required this.bookingDate,
  });

  bool canBook(DateTime time) {
    // Check if the time is within the booking hours
    if (time.hour < startHour || time.hour >= endHour) {
      return false;
    }

    // Check if the time is a multiple of 30 minutes
    if (time.minute % 30 != 0) {
      return false;
    }

    // Check if the time has already been booked
    if (bookedTimes.contains(time)) {
      return false;
    }

    return true;
  }

  bool book(DateTime time) {
    if (canBook(time)) {
      bookedTimes.add(time);
      return true;
    }
    return false;
  }

  @override
  _UserQueuePageState createState() => _UserQueuePageState();
}

class _UserQueuePageState extends State<UserQueuePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Queue'),
      ),
      body: ListView.builder(
        itemCount: (widget.endHour - widget.startHour) * 2,
        itemBuilder: (BuildContext context, int index) {
          final time = DateTime(
            widget.bookingDate.year,
            widget.bookingDate.month,
            widget.bookingDate.day,
            widget.startHour + index ~/ 2,
            index % 2 == 0 ? 0 : 30,
          );

          return ListTile(
            title: Text('${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}'),
            subtitle: widget.bookedTimes.contains(time) ? Text('Booked') : Text('Available'),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  widget.book(time);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
  onPressed: () {
    final showBooking = ShowBooking(context: context, userQueuePage: widget);
    showBooking.show();
  },
  child: Icon(Icons.list),
  ),
    );
  }
}

class ShowBooking {
  final BuildContext context;
  final UserQueuePage userQueuePage;

  ShowBooking({required this.context, required this.userQueuePage});

  void show() {
    final bookedTimes = userQueuePage.bookedTimes.map((time) =>
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}'
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your booked times:'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: bookedTimes.map((time) => Text(time)).toList(),
          ),
        );
      },
    );
  }
}



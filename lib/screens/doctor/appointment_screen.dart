import 'package:flutter/material.dart';

class AppointmentBookingScreen extends StatefulWidget {
  @override
  _AppointmentBookingScreenState createState() =>
      _AppointmentBookingScreenState();
}

class _AppointmentBookingScreenState extends State<AppointmentBookingScreen> {
  DateTime selectedDate = DateTime.now();
  String selectedTime = '09:00 AM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Appointment')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Info Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage('https://via.placeholder.com/60'),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dr. John Doe',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text('Cardiologist'),
                            Text('₹500 per consultation'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24),
              Text(
                'Select Date',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 16),

              // Date Selection
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    final date = DateTime.now().add(Duration(days: index));
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () => setState(() => selectedDate = date),
                        child: Container(
                          width: 80,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedDate.day == date.day
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(12),
                            color: selectedDate.day == date.day
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                          padding: EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                [
                                  'Mon',
                                  'Tue',
                                  'Wed',
                                  'Thu',
                                  'Fri',
                                  'Sat',
                                  'Sun'
                                ][date.weekday - 1],
                                style: TextStyle(
                                  color: selectedDate.day == date.day
                                      ? Colors.white
                                      : null,
                                ),
                              ),
                              Text(
                                date.day.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: selectedDate.day == date.day
                                      ? Colors.white
                                      : null,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 24),
              Text(
                'Select Time',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 16),

              // Time Slots Grid
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  final time =
                      '${9 + index}:00 ${index + 9 < 12 ? 'AM' : 'PM'}';
                  return InkWell(
                    onTap: () => setState(() => selectedTime = time),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: selectedTime == time
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: selectedTime == time
                            ? Theme.of(context).primaryColor
                            : null,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        time,
                        style: TextStyle(
                          color: selectedTime == time ? Colors.white : null,
                        ),
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement booking logic
                },
                child: Text('Confirm Booking'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

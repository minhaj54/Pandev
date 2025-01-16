import 'package:flutter/material.dart';

import '../../widgets/doctor/doctor_card.dart';

class DoctorsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Find Doctors'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, i) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: FilterChip(
                          label: Text([
                            'All',
                            'Cardiologist',
                            'Neurologist',
                            'Pediatrician'
                          ][i]),
                          onSelected: (_) {},
                        ),
                      ),
                      itemCount: 4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              for (int i = 0; i < 5; i++) DoctorCard(),
            ],
          ),
        ),
      ),
    );
  }
}

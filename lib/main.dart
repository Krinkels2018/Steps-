import 'package:flutter/material.dart';

void main() {
  runApp(const StepsApp());
}

class StepsApp extends StatelessWidget {
  const StepsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steps',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFCCF36B),
        ),
        useMaterial3: true,
      ),
      home: const StepsHome(),
    );
  }
}

class StepsHome extends StatefulWidget {
  const StepsHome({super.key});

  @override
  State<StepsHome> createState() => _StepsHomeState();
}

class _StepsHomeState extends State<StepsHome> {
  int dailyGoal = 10000;
  int currentSteps = 0;

  double get progress =>
      (currentSteps / dailyGoal).clamp(0.0, 1.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF4),
      appBar: AppBar(
        title: const Text(
          'STEPS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        backgroundColor: const Color(0xFFCCF36B),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            const Text(
              'Your Daily Steps',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Center(
              child: SizedBox(
                width: 220,
                height: 220,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 220,
                      height: 220,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 16,
                        backgroundColor: Colors.grey.shade200,
                        color: const Color(0xFFCCF36B),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$currentSteps',
                          style: const TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'of $dailyGoal steps',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            Card(
              child: ListTile(
                leading: const Icon(Icons.flag),
                title: const Text('Daily Goal'),
                subtitle: Text('$dailyGoal steps'),
                trailing: const Icon(Icons.edit),
                onTap: () {
                  setState(() {
                    dailyGoal =
                        dailyGoal == 10000 ? 15000 : 10000;
                  });
                },
              ),
            ),

            const SizedBox(height: 15),

            const Card(
              child: ListTile(
                leading: Icon(Icons.map),
                title: Text('Plan a Walking Route'),
                subtitle: Text(
                  'Calculate steps to your destination',
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),

            const SizedBox(height: 15),

            const Card(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('My Profile'),
                subtitle: Text(
                  'Personalise your step calculations',
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),

            const Spacer(),

            const Center(
              child: Text(
                'Every step counts!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

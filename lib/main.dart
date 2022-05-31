import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontSize: 24),
          button: TextStyle(fontSize: 24),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TimeOfDay startTime = const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 0, minute: 0);
  double lightSensorThreshold = 0;
  bool byMotionSensor = false;
  bool byTime = false;
  bool isTurnon = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Imbbed System',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            'Settings',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 200,
                child: Text(
                  'System',
                  textAlign: TextAlign.right,
                ),
              ),
              Tooltip(
                message: 'เปิดปิดระบบ',
                child: Switch(
                  value: isTurnon,
                  onChanged: (value) {
                    setState(() {
                      isTurnon = value;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 200,
                child: isTurnon
                    ? const Text(
                        'On',
                        style: TextStyle(color: Colors.blue),
                      )
                    : const Text(
                        'Off',
                        style: TextStyle(color: Colors.red),
                      ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 200,
                child: Text(
                  'Opening Time',
                  textAlign: TextAlign.right,
                ),
              ),
              Tooltip(
                message: 'ตั้งเวลาเปิดปิดหลอดไฟ',
                child: Switch(
                  value: byTime,
                  onChanged: (value) {
                    setState(() {
                      byTime = value;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 200,
                child: byTime
                    ? Row(
                        children: [
                          Tooltip(
                            message: 'ตั้งเวลาเปิดไฟ',
                            child: TextButton(
                              onPressed: () async {
                                TimeOfDay? newTime = await showTimePicker(
                                  context: context,
                                  initialTime: startTime,
                                  builder: (context, child) {
                                    return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(
                                          alwaysUse24HourFormat: true),
                                      child: child ?? Container(),
                                    );
                                  },
                                );
                                if (newTime != null) {
                                  setState(() {
                                    startTime = newTime;
                                  });
                                }
                              },
                              child: Text(
                                  '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}'),
                            ),
                          ),
                          const Text(
                            '-',
                            style: TextStyle(color: Colors.blue),
                          ),
                          Tooltip(
                            message: 'ตั้งเวลาปิดไฟ',
                            child: TextButton(
                              onPressed: () async {
                                TimeOfDay? newTime = await showTimePicker(
                                  context: context,
                                  initialTime: endTime,
                                  builder: (context, child) {
                                    return MediaQuery(
                                      data: MediaQuery.of(context).copyWith(
                                          alwaysUse24HourFormat: true),
                                      child: child ?? Container(),
                                    );
                                  },
                                );
                                if (newTime != null) {
                                  setState(() {
                                    endTime = newTime;
                                  });
                                }
                              },
                              child: Text(
                                  '${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}'),
                            ),
                          ),
                        ],
                      )
                    : const Text(
                        'Always',
                        style: TextStyle(color: Colors.blue),
                      ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 200,
                child: Text(
                  'Motion Sensor',
                  textAlign: TextAlign.right,
                ),
              ),
              Tooltip(
                message: 'เปิดปิดหลอดไฟด้วย เซนเวอร์จับการเคลื่อนไหว',
                child: Switch(
                  value: byMotionSensor,
                  onChanged: (value) {
                    setState(() {
                      byMotionSensor = value;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 200,
                child: byMotionSensor
                    ? const Text(
                        'On',
                        style: TextStyle(color: Colors.blue),
                      )
                    : const Text(
                        'Off',
                        style: TextStyle(color: Colors.red),
                      ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 300,
                child: Text(
                  'Light Threshold',
                  textAlign: TextAlign.right,
                ),
              ),
              Tooltip(
                message: 'ปรับค่าขั้นต่ำของแสงสว่างที่จะทำให้หลอดไฟติด',
                child: Slider(
                  value: lightSensorThreshold,
                  max: 100,
                  min: 0,
                  divisions: 100,
                  label: lightSensorThreshold.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      lightSensorThreshold = value;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 300,
                child: Text('Turn on when > ${lightSensorThreshold.round()} %'),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text('Human Count: 0'),
        ],
      ),
    );
  }
}
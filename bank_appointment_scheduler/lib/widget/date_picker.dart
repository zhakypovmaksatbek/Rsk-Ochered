import 'package:bank_appointment_scheduler/provider/category_provider.dart';
import 'package:bank_appointment_scheduler/widget/my_listweel_scrollview.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MyCustomDatePicker extends StatefulWidget {
  const MyCustomDatePicker({super.key});

  @override
  _MyCustomDatePickerState createState() => _MyCustomDatePickerState();
}

class _MyCustomDatePickerState extends State<MyCustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, provider, child) => Material(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${provider.selectedHour.toString().padLeft(2, '0')}:${provider.selectedMinute.toString().padLeft(2, '0')} ${provider.selectedDateTime.day}-${provider.selectedDateTime.month}-${provider.selectedDateTime.year}',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .15,
                      width: MediaQuery.of(context).size.width * .3,
                      child: _DaysListweelScrollView(),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: 150,
                      child: MyListWheelScrollView(
                        onSelectedItemChanged: (index) {
                          provider.setSelectedHour(index);
                        },
                        children: List.generate(24, (index) {
                          int hour = index;
                          return Center(
                            child: Text(
                              hour.toString().padLeft(2, '0'),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: 150,
                      child: MyListWheelScrollView(
                        onSelectedItemChanged: (index) {
                          provider.onSelectedItemChanged(
                              index); //Ар бир Индекс номер 5мүнөткө дал келүүсү үчүн
                        },
                        children: List.generate(60 ~/ 5, (index) {
                          // беш бештен көбөйүүсү үчүн
                          int minute = index * 5;
                          return Center(
                            child: Text(
                              minute.toString().padLeft(2, '0'),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              )
            ],
          ),
        ),
      ),
    );
  }

  ListWheelScrollView _DaysListweelScrollView() {
    var provider = context.watch<CategoryProvider>();

    return ListWheelScrollView(
      itemExtent: 35,
      diameterRatio: 1.7,
      perspective: 0.005,
      magnification: 1.2,
      overAndUnderCenterOpacity: 0.2,
      useMagnifier: true,
      physics: const FixedExtentScrollPhysics(),
      onSelectedItemChanged: (index) {
        provider.onSelectedDayItemChanged(index);
      },
      children: List.generate(7, (index) {
        DateTime date = DateTime.now().add(Duration(days: index));
        String dayOfWeek = _getDayOfWeek(date.weekday);
        return Center(
          child: Text(
            dayOfWeek,
            style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
          ),
        );
      }),
    );
  }

  String _getDayOfWeek(int weekday) {
    switch (weekday) {
      case 1:
        return 'Дүйшөмбү';
      case 2:
        return 'Шейшемби';
      case 3:
        return 'Шаршемби';
      case 4:
        return 'Бейшемби';
      case 5:
        return 'Жума';
      case 6:
        return 'Ишемби';
      case 7:
        return 'Жекшемби';
      default:
        return '';
    }
  }
}

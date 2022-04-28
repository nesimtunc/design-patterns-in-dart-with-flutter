import 'package:design_patterns_in_dart_with_flutter/creational/factory/travel_by.dart';
import 'package:design_patterns_in_dart_with_flutter/creational/factory/travel_planner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TravelScreen extends StatefulWidget {
  const TravelScreen({Key? key}) : super(key: key);

  @override
  State<TravelScreen> createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
  final _formKey = GlobalKey<FormState>();

  var _travelBy = TravelBy.car;

  int _passengerCount = 0;
  double _distance = 0;
  double _totalLuggageKg = 0;

  double _sum = 0;
  double get sum => _sum;
  set sum(double value) {
    setState(() {
      _sum = value;
    });
  }

  final formatCurrency = NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Travel Cost')),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  for (var by in TravelBy.values)
                    ListTile(
                      title: Text(by.toString().split('.')[1].toUpperCase()),
                      leading: Radio<TravelBy>(
                        value: by,
                        groupValue: _travelBy,
                        onChanged: (TravelBy? newValue) {
                          setState(() {
                            _travelBy = newValue!;
                          });
                        },
                      ),
                    ),
                  NumericField(
                    'Enter passenger count',
                    (String? value) {
                      if (value != null && value.isNotEmpty) {
                        _passengerCount = int.parse(value);
                      }
                    },
                  ),
                  NumericField(
                    'Distance (km)',
                    (String? value) {
                      if (value != null && value.isNotEmpty) {
                        _distance = double.parse(value);
                      }
                    },
                  ),
                  NumericField(
                    'Total Luggage Weight (kg)',
                    (String? value) {
                      if (value != null && value.isNotEmpty) {
                        _totalLuggageKg = double.parse(value);
                      }
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        calculateCost();
                      }
                    },
                    child: const Text('Calculate'),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    formatCurrency.format(sum),
                    style: Theme.of(context).textTheme.headline2,
                  )
                ],
              ),
            )),
      ),
    );
  }

  calculateCost() {
    final planner = TravelPlanner();
    final itenary = planner.createItenary(_travelBy);
    setState(() {
      sum = itenary.calculateCost(
        _passengerCount,
        _distance,
        _totalLuggageKg,
      );
    });
  }
}

class NumericField extends StatelessWidget {
  final String _title;
  final Null Function(String? value) _onChanged;

  const NumericField(this._title, this._onChanged, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: _title),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      validator: _validateInput,
      onChanged: _onChanged,
    );
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    return null;
  }
}

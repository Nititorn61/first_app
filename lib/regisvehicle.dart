import 'package:flutter/material.dart';

class RegisterVehiclePage extends StatefulWidget {
  @override
  _RegisterVehiclePageState createState() => _RegisterVehiclePageState();
}

class _RegisterVehiclePageState extends State<RegisterVehiclePage> {
  String _selectedBrand = 'Toyota';
  String _selectedModel = 'Vios';
  String _licensePlate = '';
  String _selectedProvince = 'กรุงเทพมหานคร';

  bool _isPickup = false;
  bool _isSedan = false;
  bool _isVan = false;
  bool _isOther = false;

  final List<String> _carBrands = ['Toyota', 'Honda', 'Mitsubishi', 'Nissan'];
  final Map<String, List<String>> _carModels = {
    'Toyota': ['Vios', 'Altis', 'Fortuner', 'Hilux'],
    'Honda': ['City', 'Civic', 'Jazz', 'CR-V'],
    'Mitsubishi': ['Triton', 'Pajero', 'Attrage', 'Magna'],
    'Nissan': ['Almera', 'March', 'Sunny', 'Navara']
  };

  Widget _buildCheckboxListTile({
    required String title,
    required bool value,
    required void Function(bool?)? onChanged,
  }) {
    return CheckboxListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget _buildDropdownButton<T>({
    required List<T> items,
    required T value,
    required Function(T?) onChanged,
  }) {
    return DropdownButton<T>(
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(item.toString()),
        );
      }).toList(),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ลงทะเบียนรถ'),
        backgroundColor: Colors.grey[300],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    size: 100,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCheckboxListTile(
                  title: 'รถกระบะ',
                  value: _isPickup,
                  onChanged: (value) {
                    setState(() {
                      _isPickup = value as bool;
                    });
                  },
                ),
                _buildCheckboxListTile(
                  title: 'รถเก๋ง',
                  value: _isSedan,
                  onChanged: (value) {
                    setState(() {
                      _isSedan = value as bool;
                    });
                  },
                ),
                _buildCheckboxListTile(
                  title: 'รถตู้',
                  value: _isVan,
                  onChanged: (value) {
                    setState(() {
                      _isVan = value as bool;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildDropdownButton(
              items: _carBrands,
              value: _selectedBrand,
              onChanged: (value) {
                setState(() {
                  _selectedBrand = value as String;
                  _selectedModel = _carModels[_selectedBrand]![0];
                });
              },
            ),
            SizedBox(height: 16),
            _buildDropdownButton(
              items: _carModels[_selectedBrand]!,
              value: _selectedModel,
              onChanged: (value) {
                setState(() {
                  _selectedModel = value as String;
                });
              },
            ),
            SizedBox(height: 16),
            TextField(
              onChanged: (value) {
                setState(() {
                  _licensePlate = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'ทะเบียนรถ',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            _buildDropdownButton(
              items: [
                'กรุงเทพมหานคร',
                'เชียงใหม่',
                'ขอนแก่น',
                'เพชรบูรณ์',
                'ภูเก็ต'
              ],
              value: _selectedProvince,
              onChanged: (value) {
                setState(() {
                  _selectedProvince = value as String;
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
// TODO: implement registration logic
              },
              child: Text('ลงทะเบียน'),
            ),
          ],
        ),
      ),
    );
  }
}

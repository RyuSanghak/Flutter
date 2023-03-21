import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';


String receiveData = "";

class BluetoothConnectPage extends StatefulWidget {
  @override
  _BluetoothConnectPageState createState() => _BluetoothConnectPageState();
}

class _BluetoothConnectPageState extends State<BluetoothConnectPage> {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  BluetoothDevice? _connectedDevice;
  BluetoothCharacteristic? _characteristic;



  @override
  void initState() {
    super.initState();
    _scanForDevices();
  }

  void _scanForDevices() async {
    await flutterBlue.startScan(timeout: Duration(seconds: 4));
    flutterBlue.scanResults.listen((results) {
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
      }
    });
  }

  void _connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect();
      List<BluetoothService> services = await device.discoverServices();
      for (BluetoothService service in services) {
        for (BluetoothCharacteristic characteristic
            in service.characteristics) {
          if (characteristic.uuid.toString() ==
              '00002a37-0000-1000-8000-00805f9b34fb') {
            _characteristic = characteristic;
          }
        }
      }
      await characteristic.setNotifyValue(true);
      characteristic.value.listen((data) {
        // Handle real-time data here
        print(data);
      });
      setState(() {
        _connectedDevice = device;
      });
      print('Connected to ${device.name}');
    } catch (e) {
      print('Error connecting to ${device.name}: $e');
    }
  }

  void _readData() async {
    List<int> value = await _characteristic!.read();
    print('Received data: $value');
  }

  Future refresh() async {
    setState(() {
      _scanForDevices();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
          title: Text('LABCO', style: TextStyle(color: Colors.blueAccent))),
      body: Column(
        children: [
          /*
          ElevatedButton(
            child: Text('Scan for Devices'),
            onPressed: _scanForDevices,
          ),
           */
          Divider(),
          Text('Connected to: ${_connectedDevice?.name ?? "none"}'),
          Divider(),
          /*
          ElevatedButton(
            child: Text('Read Data'),
            onPressed: _characteristic != null ? _readData : null,
          ),
          Divider(),
           */
          Expanded(
            child: StreamBuilder<List<BluetoothDevice>>(
              stream: flutterBlue.scanResults
                  .map((results) => results.map((r) => r.device).toList()),
              initialData: const [],
              builder: (BuildContext context,
                  AsyncSnapshot<List<BluetoothDevice>> snapshot) {
                return RefreshIndicator(
                  onRefresh: refresh,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: ListView.builder(
                          padding: EdgeInsets.fromLTRB(10, 20, 20, 10),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            BluetoothDevice device = snapshot.data![index];
                            return blueDeviceTile(device);
                          })),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget blueDeviceTile(BluetoothDevice device) {
    if (device.name.isNotEmpty) {
      return Column(children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: ListTile(
              title: Text(
                device.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              /*subtitle: Text(
                              device.id.toString(),
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red
                              ),
                            ),*/
              trailing: _connectedDevice?.id == device.id
                  ? Text(
                      'Connected',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    )
                  : null,
              onTap: () {
                _connectToDevice(device);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => blueDataPage()),
                  );
              },
              leading: Icon(
                Icons.bluetooth,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Divider(),
      ]);
    } else
      return Container();
  }

  Widget blueDataPage (){
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
            title: Text('LABCO', style: TextStyle(color: Colors.blueAccent))),

        body: Container(
            child:
            ElevatedButton(
              child: Text('Read Data'),
              onPressed: _characteristic != null ? _readData : null,
            ),


        )
    );
  }
}

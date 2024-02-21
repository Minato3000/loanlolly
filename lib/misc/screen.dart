import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(Screen());
}

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loanly',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loanly'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hello Raghu!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            PieChartSection(),
            SizedBox(height: 20),
            ActiveLendingsSection(),
          ],
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Message'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class PieChartSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You need to fill in the data and configure the chart according to your requirements.
    return Container(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              value: 30,
              color: Colors.red,
              title: 'Due',
            ),
            PieChartSectionData(
              value: 70,
              color: Colors.green,
              title: 'Received',
            ),
          ],
        ),
      ),
    );
  }
}

class ActiveLendingsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with your actual data source.
    List<Map<String, dynamic>> lendings = [
      {'name': 'Nitish Kumar', 'amount': 'INR 20,000', 'time': '2 Months', 'interest': '3.5%'},
      {'name': 'Naveen Kumar', 'amount': 'INR 50,000', 'time': '12 Months', 'interest': '2%'},
      {'name': 'Swetha', 'amount': 'INR 10,000', 'time': '5 Months', 'interest': '5%'},
    ];

    return Column(
      children: lendings.map((lending) => LendingCard(lending: lending)).toList(),
    );
  }
}

class LendingCard extends StatelessWidget {
  final Map<String, dynamic> lending;

  LendingCard({required this.lending});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(lending['name']),
        subtitle: Text('${lending['amount']} - ${lending['interest']}'),
        trailing: Text(lending['time']),
      ),
    );
  }
}

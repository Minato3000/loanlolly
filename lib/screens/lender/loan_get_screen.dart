import 'package:flutter/material.dart';
import 'package:loanlolly/widgets/custom_appbar_widget.dart';
import 'package:loanlolly/widgets/custom_drawer.dart';

class LoanGetScreen extends StatefulWidget {
  const LoanGetScreen({super.key});

  @override
  State<LoanGetScreen> createState() => _loangetState();
}

class _loangetState extends State<LoanGetScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
        onTap: () {
          // TODO: Handle onTap for this case
        },
        headerText: 'Request Loan Page',
      ),


      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('School Info',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                decoration: InputDecoration(
                  labelText: 'School Name',
                  hintText: 'Ex: Janani Matric Higher Sec School',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Flat No & Street Name',
                ),
              ),
              DropdownButtonFormField<String>(
                items: [
                  DropdownMenuItem(
                    child: Text("City 1"),
                    value: "City 1",
                  ),
                ],
                decoration: InputDecoration(
                  labelText: 'City',
                ),
                onChanged: (value) {
                  // Handle the new value here
                  // For now, just printing it
                  print(value);
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'State',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Pincode',
                ),
              ),
              SizedBox(height: 20),
              Text('Location',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Google Map Link',
                ),
              ),
              SizedBox(height: 20),
              Text('Contact Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle form submission
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

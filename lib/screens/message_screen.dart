import 'package:flutter/material.dart';
import 'package:loanlolly/widgets/custom_drawer.dart';

import '../widgets/custom_appbar_widget.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      appBar: CustomAppBar(
          scaffoldKey: _scaffoldKey, headerText: "Chats", onTap: () {}),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: NavigationSidebar(),
          ),
          Expanded(
            flex: 5,
            child: ChatInterface(),
          ),
        ],
      ),
    );
  }
}

class NavigationSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF243665), // Replace with the exact color code from the UI
      child: Column(
        children: [
          // Add the top part of the sidebar here, including the logo and search bar
          Expanded(
            child: ListView(
              children: [
                UserTile(userName: 'Person 1'),
                UserTile(userName: 'Person 2'),
                // Add more UserTile widgets as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  final String userName;

  const UserTile({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          // Add user profile image here
          ),
      title: Text(userName, style: TextStyle(color: Colors.white)),
      tileColor:
          Color(0xFF2A3A55), // Replace with the exact color code from the UI
    );
  }
}

class ChatInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Add padding and color as per the UI
      child: Column(
        children: [
          // Add the top bar of the chat interface here
          Expanded(
            child: Container(
                // This will be the chat messages area
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type Your Message',
                // Add styling as per the UI
              ),
            ),
          ),
        ],
      ),
    );
  }
}

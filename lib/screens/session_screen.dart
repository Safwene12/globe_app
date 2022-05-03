import 'package:flutter/material.dart';
import 'package:globe_app/data/session.dart';
import 'package:globe_app/data/sp_helper.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({Key? key}) : super(key: key);

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  final SPHelper helper = SPHelper();
  List<Session> sessions=[];

  @override
  void initState() {
    helper.init().then((value) {
      updateScreen();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Training Sessions',
        ),
      ),
      body: ListView(
        children: getContent(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add
        ),
        onPressed: (){
          showSessionDialog(context);
        },
      ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async{
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Insert training session'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: txtDescription,
                  decoration: InputDecoration(
                      hintText: 'description'
                  ),
                ),
                TextField(
                  controller: txtDuration,
                  decoration: InputDecoration(
                      hintText: 'duration'
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel'
              ),
              onPressed: (){
                Navigator.pop(context);
                txtDescription.text='';
                txtDuration.text='';
              },
            ),
            ElevatedButton(
              child: Text(
                'Save'
              ),
              onPressed: saveSession,
            )
          ],
        );
      },
    );
  }
  Future saveSession() async{
    DateTime now= DateTime.now();
    String today= '${now.year}-${now.month}-${now.day}';
    int id = helper.getCounter()+1;
    Session newSession= Session(id, today, txtDescription.text,
      int.tryParse(txtDuration.text)??0);
    helper.writeSession(newSession).then((_)  {
      updateScreen();
      helper.setCounter();
    });
    txtDescription.text="";
    txtDuration.text="";
    Navigator.pop(context);
  }
  List<Widget> getContent(){
    List<Widget> tiles=[];
    sessions.forEach((session) {
      print(session.description);
      tiles.add(
        Dismissible(
          key: UniqueKey(),
          onDismissed: (_){
            helper.deleteSession(session.id).then((value)  {
              updateScreen();
            });
          },
          child: ListTile(
            title: Text(session.description),
            subtitle: Text('${session.date} - duration ${session.duration} min'),
          ),
        )
      );
    });
    return tiles;
  }

  void updateScreen(){
    sessions=helper.getSession();
    print('sessions: ${sessions[0].duration}');
    setState(() {

    });
  }
}
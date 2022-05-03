class Session {
  int id=0;
  String date='';
  String description='';
  int duration=0;
  Session(this.id,this.date,this.description,this.duration);

  Session.fromJSON(Map<String,dynamic> sessionMap){
    id= sessionMap['id'] ?? 0;
    date= sessionMap['date'] ?? '';
    description= sessionMap['description'] ?? '';
    duration= sessionMap['duration'] ?? 0;
  }

  Map<String,dynamic> toJSON(){
    return{
      'id':id,
      'description':description,
      'date':date,
      'duration':duration
    };
  }
}
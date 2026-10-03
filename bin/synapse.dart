import 'dart:convert';
import 'dart:io';

const fileName='synapse.json';
List<Map<String,dynamic>> load(){final f=File(fileName);if(!f.existsSync())return [];return List<Map<String,dynamic>>.from(jsonDecode(f.readAsStringSync()));}
void save(List<Map<String,dynamic>> t)=>File(fileName).writeAsStringSync(const JsonEncoder.withIndent('  ').convert(t));
void help()=>print('SYNAPSE commands: add <task> | list | done <id> | search <word> | stats | help | exit');

void main(){
 final tasks=load(); print('SYNAPSE v1.0 — type help');
 while(true){
  stdout.write('synapse> '); final line=stdin.readLineSync()?.trim()??'';
  if(line=='exit')break; if(line=='help'){help();continue;}
  final p=line.split(RegExp(r'\s+')); final c=p.first;
  if(c=='add'){final title=line.length>4?line.substring(4).trim():'';if(title.isEmpty){print('Empty task');continue;}tasks.add({'id':tasks.length+1,'title':title,'done':false,'created':DateTime.now().toIso8601String()});save(tasks);print('Added #${tasks.last['id']}');}
  else if(c=='list'){for(final t in tasks)print('[${t['done']?'x':' '}] #${t['id']} ${t['title']}');}
  else if(c=='done'&&p.length==2){final id=int.tryParse(p[1]);final x=tasks.where((t)=>t['id']==id).toList();if(x.isEmpty)print('Not found');else{x.first['done']=true;save(tasks);print('Completed');}}
  else if(c=='search'&&p.length>1){final q=p.sublist(1).join(' ').toLowerCase();for(final t in tasks.where((t)=>t['title'].toString().toLowerCase().contains(q)))print('#${t['id']} ${t['title']}');}
  else if(c=='stats'){final d=tasks.where((t)=>t['done']==true).length;print('Total: ${tasks.length} | Done: $d | Open: ${tasks.length-d}');}
  else print('Unknown command. Type help.');
 }
}

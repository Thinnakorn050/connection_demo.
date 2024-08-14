// for json decode
import 'dart:convert';
// for http connection
import 'package:http/http.dart' as http;


void main() async {
  final url = Uri.parse('http://localhost:8000/expense');
  final response = await http.get(url);
  if (response.statusCode != 200) {
    print('Failed to retrieve the http package!');
    return;
  }
  // the body is JSON string
  final jsonResult = json.decode(response.body) as List;


  int total = 0;
  print("------------- All expenses ----------");
  for (var exp in jsonResult) {
    // print(exp['id'].runtimeType);
    // print(exp['item'].runtimeType);
    // print(exp['paid'].runtimeType);
    // print(exp['date'].runtimeType);


    // get datetime and convert to local time zone
    // cast by ‘as DateTime’ should also work
    final dt = DateTime.parse(exp['date']);
    final dtLocal = dt.toLocal();
    // print('${dtLocal.day}/${dtLocal.month}/${dtLocal.year}');
    // print('${dtLocal.hour}:${dtLocal.minute}');


    print(
        "${exp['id']}. ${exp['item']} : ${exp['paid']}฿ @ ${dtLocal.toString()}");
    // exp['paid'] is considered type of 'num' in dart, need to cast to 'int'
    total += exp['paid'] as int;
  }
  print("Total expenses = $total฿");
}


// การบ้านข้อสุดท้าย
// import 'dart:io';

// class Expense {
//   String description;
//   double amount;
//   DateTime date;

//   Expense(this.description, this.amount, this.date);
// }

// class User {
//   String username;
//   String password;
//   List<Expense> expenses = [];

//   User(this.username, this.password);
// }

// void main() {
//   User user = User('lisa', '1111');
//   user.expenses.add(Expense('lunch', 70, DateTime(2024, 8, 9, 12, 7, 33)));
//   user.expenses.add(Expense('coffee', 45, DateTime(2024, 8, 9, 13, 7, 33)));
//   user.expenses.add(Expense('rent', 1600, DateTime(2024, 8, 1, 7, 26, 53)));

//   if (login(user)) {
//     showMenu(user);
//   }
// }

// bool login(User user) {
//   print('===== Login =====');
//   // กำหนดค่าเองเพื่อทดสอบ
//   String username = 'lisa';
//   String password = '1111';

//   if (username == user.username && password == user.password) {
//     print('Login successful!');
//     return true;
//   } else {
//     print('Invalid credentials');
//     return false;
//   }
// }

// void showMenu(User user) {
//   while (true) {
//     print('\n========== Expense Tracking App ==========');
//     print('1. Show all');
//     print('2. Today\'s expense');
//     print('3. Exit');
//     stdout.write('Choose...: ');
//     String choice = stdin.readLineSync() ?? '';

//     switch (choice) {
//       case '1':
//         showAllExpenses(user);
//         break;
//       case '2':
//         showTodayExpenses(user);
//         break;
//       case '3':
//         print('Bye');
//         return;
//       default:
//         print('Invalid choice');
//     }
//   }
// }

// void showAllExpenses(User user) {
//   print('\n---------- All expenses ----------');
//   double total = 0;
//   for (var expense in user.expenses) {
//     print('${expense.description} : ${expense.amount}฿ - ${expense.date}');
//     total += expense.amount;
//   }
//   print('Total expenses = ${total}฿');
// }

// void showTodayExpenses(User user) {
//   print('\n---------- Today\'s expenses ----------');
//   DateTime today = DateTime(2024, 8, 9); // กำหนดวันที่คงที่
//   double total = 0;
//   for (var expense in user.expenses) {
//     if (expense.date.year == today.year &&
//         expense.date.month == today.month &&
//         expense.date.day == today.day) {
//       print('${expense.description} : ${expense.amount}฿ - ${expense.date}');
//       total += expense.amount;
//     }
//   }
//   print('Total expenses = ${total}฿');
// }

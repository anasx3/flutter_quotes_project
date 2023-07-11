// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_quotes_project/Widget/Card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

// class for card-quote(title, author)

class BestQuotes {
  String title;
  String author;

  BestQuotes({required this.title, required this.author});
}

class _QuotesState extends State<Quotes> {
  // list of all quotes

  List allQuotes = [
    BestQuotes(
        author: "Anas",
        title: "إنّ النجاح ليس كلّ شيء، إنما الرغبة في النجاح هي كلّ شيء."),
    BestQuotes(
        author: "Sultan",
        title:
            "الذي يدعي ان لغته هي افضل لغة برمجة، فاعلم انه مستخدم وليس مبرمج."),
    BestQuotes(
        author: "Sami",
        title: "إن كان لك نصيب في شيء، سيقلب الله كل الموازين لكي تحصل عليه  "),
    BestQuotes(
        author: "Salem",
        title:
            " اكبر خطأ يعتقده الكثير من المبرمجين هو امكانية كتابة برنامج دون اخطاء."),
    BestQuotes(
        author: "Faisal",
        title:
            "رضيت بالله ربا وبالإسلام دين وبمحمد صلى الله عليه وسلم نبياً. "),
    BestQuotes(
        author: "Bader",
        title: "حسبي الله لا إله إلا هو عليه توكلت وهو رب العرش العظيم."),
    BestQuotes(
        author: "Jawad",
        title: "اللَّهُمَّ صَلِّ وَسَلِّمْ وَبَارِكْ على نَبِيِّنَا مُحمَّد."),
    BestQuotes(
        author: "Othman", title: "الفشل هو التجربة التي تسبق النجاح، فلا تيأس"),
    BestQuotes(author: "Yasser", title: "ربي زدني علما"),
    BestQuotes(
        author: "Osama",
        title: "لايهم أن تكومن الاول , المهم ان تستمر وتعمل بجهد"),
    BestQuotes(
        author: "Abdulaziz", title: "المستقبل بيده وحده , ورزقك بن يأخذه غيرك"),
    BestQuotes(
        author: "Basm",
        title:
            " جوالك بعيد , تركيزك يزيد , وكل شيء بحياتك باذن الله راح يكون مفيد"),
    BestQuotes(
        author: "Raed",
        title:
            " لَا إلَه إلَّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِير"),
  ];
// To delete card-quote when clicking on delete icon
  delete(BestQuotes item) {
    setState(() {
      allQuotes.remove(item);
    });
  }

// To add new card-quote to the main screen when clicking on "ADD" in showModalBottomSheet
  addnewtask() {
    setState(() {
      allQuotes.add(
        BestQuotes(author: myController2.text, title: myController.text),
      );
    });
  }

// create 2 controllers to get the text from the textfield
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myController,
                        decoration: InputDecoration(hintText: "Add new quote"),
                        maxLength: 35,
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextField(
                        controller: myController2,
                        decoration: InputDecoration(
                          hintText: "Add author",
                        ),
                        maxLength: 35,
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            addnewtask();
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(fontSize: 23),
                          )),
                    ],
                  ),
                );
              },
              isScrollControlled: true);
        },
        backgroundColor: Color.fromARGB(255, 164, 184, 212),
        child: Icon(Icons.add),
      ),

      // 2

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(224, 8, 2, 2),
        title: Text("Best Quotes", style: TextStyle(fontSize: 29)),
      ),

      // 3

      body: SingleChildScrollView(
        child: Column(
          children: [
            ...allQuotes
                .map((item) => CardWidget(
                      // To pass the( item inside the list) to "card.dart" file
                      item: item,
                      // To pass (the delete function) to "card.dart" file
                      delete: delete,
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}

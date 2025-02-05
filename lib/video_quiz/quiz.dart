import 'package:flutter/material.dart';

import '../quiz_data.dart';

class Quiz extends StatefulWidget {
  final String language, module;
  final bool quiz;

  const Quiz({super.key, required this.language, required this.module, this.quiz = false});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int index = 0;
  var list = [];

  @override
  void initState() {
    super.initState();
    //////////////////

    if (widget.quiz) {
      if (widget.language == "Japanese") {
        list = widget.module == 'A'
            ? getJaQuizA()
            : widget.module == 'B'
                ? getJaQuizB()
                : widget.module == 'C'
                    ? getJaQuizC()
                    : getJaQuizD();
      } else if (widget.language == "German") {
        list = widget.module == 'A'
            ? getGeQuizA()
            : widget.module == 'B'
                ? getGeQuizB()
                : widget.module == 'C'
                    ? getGeQuizC()
                    : getGeQuizD();
      } else {
        list = widget.module == 'A'
            ? getEnQuizA()
            : widget.module == 'B'
                ? getEnQuizB()
                : widget.module == 'C'
                    ? getEnQuizC()
                    : getEnQuizD();
      }

      ////////////////////////
    } else {
      if (widget.language == "German") {
        list = widget.module == 'A'
            ? getVideoQuizA()
            : widget.module == 'B'
                ? getVideoQuizB()
                : widget.module == 'C'
                    ? getVideoQuizC()
                    : getVideoQuizD();
      } else {
        list = widget.module == 'A'
            ? getEnVideoQuizA()
            : widget.module == 'B'
                ? getEnVideoQuizB()
                : widget.module == 'C'
                    ? getEnVideoQuizC()
                    : getEnVideoQuizD();
      }
    }
    ///////////////
  }

  Map<String, int> ln = {
    'A': 1,
    'B': 2,
    'C': 3,
    'D': 4,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/hhBackground.png",
            fit: BoxFit.cover,
            height: double.maxFinite,
            width: double.maxFinite,
          ),
          Center(
            child: Container(
              width: list.length == index ? 850 : 650,
              height: 450,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    list.length == index ? "Thank You!" : list[index][0],
                    maxLines: 2,
                    style:
                        const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold),
                  ),

                  if (list.length == index)
                    Expanded(
                        child: ListView(
                          children: [
                            for (var da in list)
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("\n${da[0]}",
                                        style: const TextStyle(color: Colors.white, fontSize: 20)),
                                    const SizedBox(width: 20),
                                    showOption(da, 1, 'A'),
                                    showOption(da, 2, 'B'),
                                    if (da[3] != '') showOption(da, 3, 'C'),
                                    if (da[4] != '') showOption(da, 4, 'D'),
                                  ],
                                ),
                              ),
                          ],
                        )),

                  /////////
                  if (list.length != index) const SizedBox(height: 20),
                  if (list.length != index) option(index, 1, 'A'),
                  if (list.length != index) const SizedBox(height: 10),
                  if (list.length != index) option(index, 2, 'B'),
                  if (list.length != index && list[index][3] != '') const SizedBox(height: 10),
                  if (list.length != index && list[index][3] != '') option(index, 3, 'C'),
                  if (list.length != index && list[index][4] != '') const SizedBox(height: 10),
                  if (list.length != index && list[index][4] != '') option(index, 4, 'D'),

                  if (list.length != index) const Expanded(child: SizedBox(height: 20)),
                  /////////
                  if (list.length != index)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                            onPressed: () {
                              if (index > 0) setState(() => index--);
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: index == 0 ? Colors.white54 : Colors.white),
                              padding: const EdgeInsets.only(left: 20, right: 30),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back_ios_rounded,
                                    color: index == 0 ? Colors.white54 : Colors.white, size: 28),
                                const SizedBox(width: 12),
                                Text(
                                  'Previous',
                                  style: TextStyle(
                                      color: index == 0 ? Colors.white54 : Colors.white, fontSize: 30),
                                ),
                              ],
                            )),
                        Text(
                          "${index + 1}/${list.length}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold),
                        ),
                        OutlinedButton(
                            onPressed: list[index][6] == ''
                                ? null
                                : () {
                                    setState(() {
                                      index++;
                                    });
                                  },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                  color: list[index][6] == '' ? Colors.white54 : Colors.white),
                              padding: const EdgeInsets.only(left: 30, right: 20),
                            ),
                            child: Row(
                              children: [
                                Text(list.length == index + 1 ? "Done    " : 'Next     ',
                                    style: TextStyle(
                                        color: list[index][6] == '' ? Colors.white54 : Colors.white,
                                        fontSize: 30)),
                                const SizedBox(width: 12),
                                Icon(Icons.arrow_forward_ios_rounded,
                                    color: list[index][6] == '' ? Colors.white54 : Colors.white,
                                    size: 28)
                              ],
                            ))
                      ],
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget option(index, optionIndex, option) {
    return OutlinedButton(
      onPressed: () => setState(() => list[index][6] = option),
      style: OutlinedButton.styleFrom(
          minimumSize: const Size(140, 40),
          side: BorderSide(color: option == list[index][6] ? Colors.white : Colors.white54)),
      child: Text(list[index][optionIndex],
          style:
              TextStyle(color: option == list[index][6] ? Colors.white : Colors.white54, fontSize: 18)),
    );
  }

  Widget showOption(da, index, option) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: (da[5] == option)
            ? Colors.green
            : (da[6] == option)
                ? Colors.red
                : Colors.white10,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(da[index], style: const TextStyle(color: Colors.white)),
    );
  }
}

import 'dart:math';

import 'package:flaguru/models/Answer.dart';
import 'package:flaguru/models/Country.dart';
import 'package:flaguru/models/Question.dart';

class Node {
  var _countries = List<Country>();
  int _ratio = 0;
  int _cursor = 0;
  var _rand = Random();

  int get ratio => this._ratio;

  Node(Country country) {
    insert(country);
    // print('Ratio is $ratio');
    this._ratio = country.ratio;
  }

  void insert(Country country) {
    this._countries.add(country);
  }

  int _moveCursor() {
    var currentCursor = this._cursor;
    this._cursor++;
    if (this._cursor >= this._countries.length) this._cursor = 0;
    return currentCursor;
  }

  bool isEmpty() => this._countries.length == 0;

  @override
  String toString() {
    String message = "Node $_ratio has ${_countries.length} countries:\n";
    for (var country in this._countries) message += "> ${country.toString()}";
    return message;
  }

  Question getQuestion() {
    while (this._countries[this._cursor].chances != 0) {
      this._countries[this._cursor].call();
      this._cursor++;
      if (this._cursor >= this._countries.length) {
        this._cursor = 0;
        return null;
      }
    }
    return this._countries[this._moveCursor()].toQuestion();
  }

  Answer getRandomAnswer() =>
      this._countries[this._rand.nextInt(this._countries.length)].toAnswer();
}

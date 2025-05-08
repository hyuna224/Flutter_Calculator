import 'package:math_expressions/math_expressions.dart';

double expression_creation_and_evaluation(String raw) {
  // math_expressions에서 쓰는 연산 기호로 바꿈
  var expr = raw.replaceAll('x', '*').replaceAll('÷', '/');
  print(expr);

  // 식 파싱
  Expression exp = GrammarParser().parse(expr);

  // 계산
  return exp.evaluate(EvaluationType.REAL, ContextModel());
}

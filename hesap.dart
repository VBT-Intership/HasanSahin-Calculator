import 'dart:io';

extension Dortislem on num {
  num plus(num second) => this + second;

  num minus(num second) => this - second;

  num multiply(num second) => this * second;

  num divided(num second) => this / second;

  String makeString(num precision) => this.toStringAsPrecision(precision);
}

void main() {
  num numberOne, numberTwo;
  String operators = "";
  print(
      'Hesap Makinesi Uygulamasına Hoş Geldin. + - * / işlemlerini sırayla kullanabilirsin.');
  print('İlk Sayıyı Giriniz:');
  numberOne = num.parse(stdin.readLineSync().trim());
  bool isContinue = true;
  while (isContinue) {
    try {
      print(operators == "" ? "Operatör Girin:" : "İkinci Sayıyı Giriniz:");
      String calc = stdin.readLineSync().trim();
      if (calc.contains(new RegExp(r'[*,+,/,-]')) &&
          calc.length == 1 &&
          operators == "")
        operators = calc;
      else if (calc == "e")
        isContinue = false;
      else {
        numberTwo = num.parse(calc);
        numberOne = hesapla(numberOne, numberTwo, operators);
        operators = "";
      }
    } catch (ex) {
      print("Hatalı Giriş..");
    }
  }
}

num hesapla(num numberOne, num numberTwo, String operators) {
  num result;
  switch (operators) {
    case "+":
      result = numberOne.plus(numberTwo);
      break;
    case "-":
      result = numberOne.minus(numberTwo);
      break;
    case "*":
      result = numberOne.multiply(numberTwo);
      break;
    case "/":
      result = numberOne.divided(numberTwo);
      break;
  }
  print(
      "İşlem Sonucu:  ${numberOne.toString()}  ${operators}  ${numberTwo.toString()} = ${result.makeString(3)}");

  print("------------------------------------------------------------------");
  print("Yeni Değer : " + result.toString());
  return result;
}

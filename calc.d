import std.stdio;
import std.conv;
import core.stdc.string : strlen;

float pow(float a, float b) {
    if (b == 0) return 1;
    float ret = 1;

    for (int i = 0; i < b; i ++) {
        ret *= a;
    }

    return ret;
}

float fact(float a) {
    int ret = 1;
    if (a == 0) return 1;

    for(int i = 1; i <= a; i++) {
        ret *= i;
    }

    return ret;
}

auto calc(string a_s, string op = " ", string b_s = " ", string er_s = " ") {
    int count_a;
    foreach(c; a_s) {
        count_a++;
    }
    if (count_a >= 10) {
        if (a_s[0] != '-') return "Ошибка: введено слишком большое число";
        else return "Ошибка: введено слишком маленькое число";
    }

    int count_b;
    foreach(c; b_s) {
        count_b++;
    }
    if (count_b >= 10) {
        if (b_s[0] != '-') return "Ошибка: введено слишком большое число";
        else return "Ошибка: введено слишком маленькое число";
    }

    if (er_s != " ") {
        return "Ошибка: Ни одна операция не поддерживает более 3-х входящих символов";
    }
    if (op == " ") {
        return "Ошибка: Ни одна операция не поддерживает менее 2-х входящих символов";
    }
    if (op == "!" && b_s != " ") {
        return "Ошибка: ! не поддерживает три символа";
    }
    if (b_s == "0" && op != "!") {
        return "Ошибка: деление на 0 недопустимо";
    } 

    float a = to!float(a_s);
    float b;
    if (b_s == " ") b = 0;
    else b = to!float(b_s);
    
    float ret;
    switch(op) {
        case "+":
            ret = a + b;
            break;
        case "-":
            ret = a - b;
            break;
        case "*":
            ret = a * b;
            break;
        case "/":
            ret = a / b;
            break;
        case "^":
            ret = pow(a, b);
            break;
        case "!":
            ret = fact(a);
            break;
        default:
        string s = "Ошибка: " ~ op ~ " не поддерживается";
            return s;
    }
    string r = to!string(ret);
    return r;
}

unittest {
    writeln("Negative test running ...");
    assert(calc("2", "*", "3", "4") == "Ошибка: Ни одна операция не поддерживает более 3-х входящих символов", "Error 1");   // 1
    assert(calc("55") == "Ошибка: Ни одна операция не поддерживает менее 2-х входящих символов", "Error 2");                 // 2
    assert(calc("5", "!", "5") == "Ошибка: ! не поддерживает три символа", "Error 3");                                     // 3
    assert(calc("5", "?", "5") == "Ошибка: ? не поддерживается", "Error 4");                                                 // 4
    assert(calc("5", "/", "0") == "Ошибка: деление на 0 недопустимо", "Error 5");                                            // 5
    assert(calc("600000000000", "*", "5") == "Ошибка: введено слишком большое число", "Error 6");                            // 6
    assert(calc("-600000000000", "*", "5") == "Ошибка: введено слишком маленькое число", "Error 7");                         // 7
}

unittest {
    writeln("Positive test running ..");
    assert(calc("67", "+", "34") == "101", "Error 8");   // 8
    assert(calc("125", "-", "3") == "122", "Error 9");   // 9
    assert(calc("5", "*", "71") == "355", "Error 10");   // 10
    assert(calc("27", "/", "3") == "9", "Error 11");     // 11
    assert(calc("5", "!") == "120", "Error 12");         // 12
    assert(calc("3", "^", "4") == "81", "Error 13");     // 13
}

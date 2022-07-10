import UIKit
import Darwin

/*
1. Решить квадратное уравнение.
2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
*/


// 1.
let a: Double = 5
let b: Double = 3
let c: Double = -1
let d: Double = pow(b, 2) - 4 * a * c

print("Задача 1\nДано: a = \(a), b = \(b), c = \(c)\nОтвет:\nd = \(d)")

if d > 0 {
    let x1 = (-b + sqrt(d)) / (2 * a)
    let x2 = (-b - sqrt(d)) / (2 * a)
    
    print("x1 = \(x1), x2 = \(x2)")
} else if d == 0 {
    let x = -b / (2 * a)
    print("x = \(x)")
} else {
    print("Нет корней")
}


// 2.
let cathet1: Double = 3
let cathet2: Double = 5
let summKatet = pow(cathet1, 2) + pow(cathet2, 2)
let hypotenuse = sqrt(summKatet)
let s = (cathet1 * cathet2) / 2
let p = cathet1 + cathet2 + hypotenuse

print("\nЗадача 2\nДано: Катет 1 = \(cathet1), Катет 2 = \(cathet2)\nОтвет:\nГипотенуза = \(hypotenuse)\nПлощадь = \(s)\nПериметр = \(p)")

// 3.
var contribution = 50000
let pronetst = 5

print("\nЗадача 3\nДано: Вклад = \(contribution), процент = \(pronetst)\nОтвет:")

for i in 1...5 {
    contribution = contribution + (contribution / 100 * pronetst)
    print("\(i) год = \(contribution)")
}

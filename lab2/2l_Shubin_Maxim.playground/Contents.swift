import UIKit

/*
 1. Написать функцию, которая определяет, четное число или нет.
 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
 3. Создать возрастающий массив из 100 чисел.
 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
 Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
 a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
 b. Пусть переменная p изначально равна двум — первому простому числу.
 c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
 d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
 e. Повторять шаги c и d, пока возможно.
 */


// MARK : Функция, которая определяет, четное число или нет.
func EvenOdd(_ number: Int) {
    if number % 2 != 0 {
        print("Число \(number) - нечетное")
    } else {
        print("Число \(number) - четное")
    }
}

// MARK : Функция определяет, делится ли число без остатка на 3.
func RemainderOfThree (_ number: Int) {
    if number % 3 == 0 {
        print("\nЧисло \(number) - делится без остатка на 3")
    } else {
        print("\nЧисло \(number) - не делится без остатка на 3")
    }
}

// 3. Возрастающий массив из 100 чисел.
let increasingArray = Array(0...99)

// MARK : Функция возвращает нечетные числа
func isEven(number: Int) -> Bool {
    return number % 2 != 0
}

// MARK : Функция возвращает числа, которые делятся на 3
func isEvenThree(number: Int) -> Bool {
    return number % 3 == 0
}

// MARK : Добавление в массив 50 новых чисел Фибоначчи
func newFibonacciNumber(_ num1 : Int,_ num2 : Int,_ term : Int,_ termCount : Int, anArray : [Int] = []) -> Void{
    if termCount != term {
        var anArray = anArray
        anArray.append(num1)
        newFibonacciNumber(num2, num2+num1, term, termCount + 1, anArray: anArray)
    }
    
    if anArray.count == 52 {
        var newMultipleOfThreeArray = multipleOfThreeArray
        newMultipleOfThreeArray.removeLast(2)
        let fibonacciArray = (newMultipleOfThreeArray + anArray)
        print("\nМассив из 4 задания + 50 чисел Фибоначчи:\n\(fibonacciArray)")
    }
}

EvenOdd(7)
RemainderOfThree(9)

print("\nМассив нечетных чисел, которые делятся на 3:")
let oddArray = increasingArray.filter(isEven)
let multipleOfThreeArray = oddArray.filter(isEvenThree)
print(multipleOfThreeArray)

let arraySlice = multipleOfThreeArray.suffix(2)
let num1 = arraySlice.first!
let num2 = arraySlice.last!
newFibonacciNumber(num1, num2, 52, 0)

// 6. Заполнить массив из 100 элементов различными простыми числами.
let maxNumbers = 541
var firstPrimeNumber = 2

var data = (2...maxNumbers).map{$0}
let allocationTime = Date()

while (firstPrimeNumber.powerOf2() <= maxNumbers) {
    data.removeAll(where: {$0 >= firstPrimeNumber.powerOf2() && $0.isMultiple(of: firstPrimeNumber)})
    firstPrimeNumber = data.first(where: {$0 > firstPrimeNumber})!
}
let overallTime = Date()

print("\nМассив из \(data.count) простых чисел:\n\(data)")

// MARK : Вовзведение в квадрат числа
extension Int {
    func powerOf2() -> Int {
        return self * self
    }
}

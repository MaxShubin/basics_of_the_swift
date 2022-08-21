import Foundation

//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

enum GroupOfStudentsError: Error {
    case notFound
}

struct Person {
    let name: String
    let surname: String
    let age: Int
    var score: Int
}

class GroupOfStudents {
    // студенты
    var students = [
        "001": Person(name: "Maksim", surname: "Shubin", age: 35, score: 2),
        "002": Person(name: "Alex", surname: "Bondarenko", age: 34, score: 5),
        "003": Person(name: "Evgeny", surname: "Zverik", age: 27, score: 3),
        "004": Person(name: "Alexey", surname: "Kanatyev", age: 28, score: 4)
    ]
    
    func getInfo(number student: String) throws -> Person {
        guard let man = students[student] else {
            throw GroupOfStudentsError.notFound
        }
        return man
    }
    
}

extension Person: CustomStringConvertible {
    public var description: String {
        return "Студент \(surname) \(name) с возрастом \(age) имеет \(score) балла/ов."
    }
}

let students = GroupOfStudents()
do {
    let student = try students.getInfo(number: "0010")
    print(student.description)
} catch GroupOfStudentsError.notFound {
    print("Студент не найден")
}

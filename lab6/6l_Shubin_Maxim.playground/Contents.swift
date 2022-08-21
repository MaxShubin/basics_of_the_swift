import Foundation

//MARK: Tasks
//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.


public struct Queue<T>: CustomStringConvertible {
    
    // Массив для добавления элементов в очередь. Использовал парадигму "Инкапсуляция". Массив может быть использован только в исходном файле, в котором определен.
    
    fileprivate var array = [T]()
    
    // Проверка массива на отсутствие элементов
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    // Получаем количество элементов в очереди
    fileprivate var count: Int {
        return array.count
    }
    
    public func getCount() -> String {
        return "Количество элементов в очереди: \(count)"
    }
    
    // Метод для добавления нового элемента в очередь.
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    // Метод для удаления первого элемента из массива array. Возвращает Optional <T> при проверке на пустой массив.
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            let removedElement = array.first
            print("Удален элемент: \(String(describing: removedElement!))")
            return array.removeFirst()
        }
    }
    
    // Метод для получения первого элемента очереди
    public var front: T? {
        return array.first
    }
    
    public var description: String {
        return "Содержимое очереди: \(self.array)"
    }
    
    public func filter(array: [T], predicateSomeClosure: (T) -> Bool) -> [T] {
        
        var tmpArray = [T]()
        
        for element in array {
            if predicateSomeClosure(element) {
                tmpArray.append(element)
            }
        }
        
        return tmpArray
    }
    
}

var q01 = Queue<String>()
print(q01)
q01.enqueue("Swift")
q01.enqueue("C++")
q01.enqueue("Java")
print(q01.getCount(), "\n")
print("\(q01)")

let sortedQueue = q01.array.sorted(by: >)
print("Отсортировання очередь по убыванию: \(sortedQueue)\n")

let filteredQueue = q01.filter(array: q01.array) { (s1: String) -> Bool in
    return s1 == "Swift"
}
print("Массив из очереди по фильтру: \(filteredQueue)\n")

while (q01.count > 0) {
    q01.dequeue()
    print(q01)
    print(q01.getCount())
}

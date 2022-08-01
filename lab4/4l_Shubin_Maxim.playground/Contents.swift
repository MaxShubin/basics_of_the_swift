import UIKit

/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.
 */

enum CarAction {
    case turnEngineOn, turnEngineOff, windowOpen, windowClose
    case enablePneumo, disablePneumo
    case loadTruck, unloadTruck
}

class Car {
    let wheelCount: Int
    var color: UIColor
    var isEngineOn: Bool = false
    var isWindowOpen: Bool = false
    
    init( wheelCount: Int, color: UIColor ) {
        self.wheelCount = wheelCount
        self.color = color
    }
    
    func executeAction( action: CarAction ) {
        switch action {
        case .turnEngineOff:
            guard isEngineOn else {
                print("Двигатель уже выключен")
                return
            }
            
            isEngineOn = false
            
        case .turnEngineOn:
            guard !isEngineOn else {
                print("Двигатель уже включен")
                return
            }
            
            isEngineOn = true
            
        case .windowClose:
            guard isWindowOpen else {
                print("Окна уже закрыты")
                return
            }
            
            isWindowOpen = false
            
            
        case .windowOpen:
            guard !isWindowOpen else {
                print("Окна уже открыты")
                return
            }
            
            isWindowOpen = true
            
        default:
            print("Неподдерживаемое действие")
            return
        }
    }
}

class SportCar: Car {
    var isPneumoEnabled: Bool = false
    
    override func executeAction(action: CarAction) {
        super.executeAction(action: action)
        switch action {
        case .disablePneumo:
            guard isPneumoEnabled else {
                print("Пневмо уже выключена")
                return
            }
            
            isPneumoEnabled = false
            
        case .enablePneumo:
            guard !isPneumoEnabled else {
                print("Пневмо уже включена")
                return
            }
            
            isPneumoEnabled = true
        default:
            print("Действие не поддерживается спорткаром")
            return
        }
    }
}

class TrunkCar: Car {
    var baggageCappacity: Int
    var currentBaggageUsedPlace: Int = 0
    
    init(capacity: Int, wheelCount: Int, color: UIColor) {
        baggageCappacity = capacity
        super.init(wheelCount: wheelCount, color: color)
    }
    
    override func executeAction(action: CarAction) {
        super.executeAction(action: action)
        
        if action == .loadTruck {
            currentBaggageUsedPlace = min(currentBaggageUsedPlace + 1, baggageCappacity)
        }
        else if action == .unloadTruck {
            currentBaggageUsedPlace = max(currentBaggageUsedPlace - 1, 0)
        }
    }
    
    
}

let truck = TrunkCar(capacity: 10, wheelCount: 8, color: .black)

truck.executeAction(action: .loadTruck)
truck.executeAction(action: .turnEngineOn)
truck.executeAction(action: .windowOpen)

let sportCar = SportCar(wheelCount: 4, color: .red)
sportCar.executeAction(action: .turnEngineOff)
sportCar.executeAction(action: .enablePneumo)

print("Truck: в багажнике \(truck.currentBaggageUsedPlace)кг, двигатель включен: \(truck.isEngineOn)")
print("SportCar: Включена подвеска:\(sportCar.isPneumoEnabled), двигатель включен: \(sportCar.isEngineOn)")

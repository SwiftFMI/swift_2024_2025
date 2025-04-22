enum Movement: Int {
    case left = 0
    case right
    case up
    case down
}

extension Movement {
    func toString() -> String {
        switch self {
        case .left:
            "left"
        case .right:
            "right"
        default:
            "unknown"
        }
    }
}




// let action = Movement.up
let action: Movement = .up


func moveActor(direction: Movement) {
    // todo
}

moveActor(direction: .right)

print(action.toString())



// Напълно безполезен изброен тип
enum Binary: Int {
    case zero = 0
    case one = 1
}

// Можем да използваме и символни низове за стойности
enum House: String {
    case baratheon = "Ours is the Fury"
    case greyjoy = "We Do Not Sow"
    case martell = "Unbowed, Unbent, Unbroken"
    case stark = "Winter is Coming"
    case tully = "Family, Duty, Honor"
    case tyrell = "Growing Strong"
}

// Или пък числа с плаваща запетая, за да изпишем често ползвани математически константи
enum Constants: Double {
    case π = 3.14159
    case e = 2.71828
    case φ = 1.61803398874
    case λ = 1.30357
}

let one = Binary.one
print(one.rawValue)

let house = House.baratheon
print(house)
print(house.rawValue)

let pi = Constants.π
print(pi)
print(pi.rawValue)


let rightMovement = Movement(rawValue: 117)
// print(rightMovement!.rawValue) // Don't do this!
if let movement = rightMovement {
    print(movement)
}


enum Character {
  enum Weapon {
    case bow
    case sword
    case spear
    case dagger
  }
  
  enum Helmet {
    case leather
    case wooden
    case iron
  }
  
  case thief
  case warrior
  case knight
}

let character = Character.thief
let weapon = Character.Weapon.bow
let helmet = Character.Helmet.iron

print(character)
print(weapon)

enum Stocks: String {
    case apple = "APPL"
}

enum Trade {
    case buy(stock: String, amount: Int)
    case sell(stock: String, amount: Int)
}

let trade = Trade.buy(stock: Stocks.apple.rawValue, amount: 500)
// let trade = Trade.sell(stock: Stocks.apple.rawValue, amount: 500)

print(">>>", trade)

switch trade {
case .buy(let stock, let amount):
    print(stock, amount)
default:
    //nothing
    break;
}

if case let Trade.buy(stock, amount) = trade {
    print("buy \(amount) of \(stock)")
}




// Типовете на асоциираните стойности може да са различни
enum UserAction {
  case openURL(url: String)
  case switchProcess(processId: UInt)
  case restart(time: String?, intoCommandLine: Bool)
}

// Или пък при имплеметирането на текстови редактор, който има множествено селектиране
// Като например Sublime Text:
// https://www.youtube.com/watch?v=i2SVJa2EGIw
enum Selection {
  case none
  case single(Range<Int>)
  case multiple([Range<Int>])
}

// Или пък да различаваме различните видове идентификационни кодове и тяхната информация
enum Barcode {
    case UPCA(numberSystem: Int, manufacturer: Int, product: Int, check: Int)
    case QRCode(productCode: String)
}

// И по-сложен пример: да адаптираме C библиотека, като Kqeue BSD/Darwin нотификации
// system: https://www.freebsd.org/cgi/man.cgi?query=kqueue&sektion=2
enum KqueueEvent {
    case userEvent(identifier: UInt, fflags: [UInt32], data: Int)
    case readFD(fd: UInt, data: Int)
    case writeFD(fd: UInt, data: Int)
    case vnodeFD(fd: UInt, fflags: [UInt32], data: Int)
    case errorEvent(code: UInt, message: String)
}

// Като се върнем на примера ни с ролевата игра - всички предмети може да се изброят с допълнителна информация за тях (като тегло).
// С това добавянето на нов материал е само един ред код.
enum Wearable {
    enum Weight: Int {
        case light = 1
        case mid = 4
        case heavy = 10
    }
    
    enum Armor: Int {
        case light = 2
        case strong = 8
        case heavy = 20
    }
    
    case helmet(weight: Weight, armor: Armor)
    case breastplate(weight: Weight, armor: Armor)
    case shield(weight: Weight, armor: Armor)
}

let woodenHelmet = Wearable.helmet(weight: .light, armor: .light)

enum Device {
  case iPad
  case iPhone

  var introduced: Int {
    switch self {
    case .iPhone: 2007
    case .iPad: 2010
     }
  }
}

let ipad = Device.iPad
print(ipad.introduced)


enum TriStateSwitch {
    case off
    case low
    case bright
    
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .bright
        case .bright:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
print(ovenLight)
ovenLight.next()
print(ovenLight)
// self == .bright
ovenLight.next()
print(ovenLight)
// self вече е .off

enum Trade2: CustomStringConvertible {
   case buy, sell
   var description: String {
       switch self {
       case .buy: 
       		"Купуваме нещо"
       case .sell: 
       		"Продаваме нещо"
       }
   }
}

let trade2 = Trade2.buy
print(">>> \(trade2)")


enum Account {
  case empty
  case funds(remaining: Int)
  case credit(amount: Int)

  var remainingFunds: Int {
    switch self {
    case .empty: 
		return 0
    case .funds(let remaining): 
		return remaining
    case .credit(let amount): 
		return amount
    }
  }
}

protocol AccountCompatible {
  var remainingFunds: Int { get }
  mutating func addFunds(amount: Int) throws
  mutating func removeFunds(amount: Int) throws
}

extension Account: AccountCompatible {

  mutating func addFunds(amount: Int) {
    var newAmount = amount
    if case let .funds(remaining) = self {
      newAmount += remaining
    }
    if newAmount < 0 {
      self = .credit(amount: newAmount)
    } else if newAmount == 0 {
      self = .empty
    } else {
      self = .funds(remaining: newAmount)
    }
  }

  mutating func removeFunds(amount: Int) throws {
    try self.addFunds(amount: amount * -1)
  }
}

var account = Account.funds(remaining: 20)
try? account.addFunds(amount:10)
try? account.removeFunds(amount:15)

//
//https://khawerkhaliq.com/blog/swift-pattern-matching-optionals/#:~:text=Swift%20implements%20the%20Optional%20type,two%20cases%2C%20as%20shown%20below.&text=The%20two%20cases%20of%20the,none%20.
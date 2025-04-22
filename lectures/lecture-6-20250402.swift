protocol Sellable {
	var pricePerUnit: Double { get }
	var isAvailable: Bool { set get }
}

struct Toy: Sellable {
    var pricePerUnit: Double
    var isAvailable: Bool
    var notes = "Some notes..."
}

let toy: Sellable = Toy(pricePerUnit: 100, isAvailable: true)
print(toy.isAvailable)
print(toy.pricePerUnit)
//print(toy.notes) //error, because toy is Sellable!

class Lego: Sellable {
    var pricePerUnit: Double
    var isAvailable: Bool
    var model: String
    init(model: String, price: Double = 0) {
        self.pricePerUnit = price
        self.model = model
        self.isAvailable = price > 0
    }
}

class SpecialLego: Sellable {
    var pricePerUnit: Double {
        100
    }
    var isAvailable: Bool
    var model: String
    init(model: String) {
        self.model = "* " + model
        self.isAvailable = true
    }
}

struct DemoLego {
    var pricePerUnit: Double {
        100
    }
    var isAvailable: Bool
}


extension DemoLego: Sellable {

}

protocol PersonalComputer {
	func getRamSize() -> Int
	
	// Convert X bytes to "KB" or "MB" or "GB" or "TB"
	static func convert(bytes: Int, to:String) -> Double
}


var harryPotter: Sellable = Lego(model: "HP100", price: 200)
print("Lego: \(harryPotter.pricePerUnit)")

var batMobile: Sellable = SpecialLego(model: "Batmobile")

let demo = DemoLego(isAvailable: true)
print("demoLego \(demo.pricePerUnit)")


let items: [any Sellable] = [toy, harryPotter, batMobile, demo]
print("All items:")
for i in items {
    print(i.pricePerUnit)
}


protocol Printable: AnyObject {
	var description: String { get }
	static var version: String { get set}    
	
    init()
	init(a: Int, b: Int)
}
	
class Machine: Printable {
	var description = ""
	var powerConsumption = 0
	var name = "Missing name"
	static var version: String = "v. 2.0"

	//без този конструктор не се компилира
	required init() { }

	required init(a: Int, b: Int) {
		print("Machine")
	} 
}

// because Printable: AnyObject
// struct Machine2: Printable {
// 	var description = ""
// 	var powerConsumption = 0
// 	var name = "Missing name"
// 	static var version: String = "v. 2.0"

// 	init() { }

// 	init(a: Int, b: Int) {
// 		print("Machine")
// 	} 
// }

protocol Description {
    var description: String { get }
}

protocol PowerConsumable {
    var powerConsumption: Double { set get }
}

protocol Device: Description, PowerConsumable {
    var model: String { set get }
}

struct EV: Device {
	var description = ""
	var powerConsumption = 0.0
	var model = "Unknown device"
	static var version: String = "v. 2.0"
}

let tesla: Description & PowerConsumable = EV(model: "Tesla")
//print(tesla.model) //- error: value of type 'any Description & PowerConsumable' has no member 'model'

struct ElectricCar: PowerConsumable, Description {
    var description = ""
	var powerConsumption = 0.0
    private var _model = ""
}

var car = ElectricCar()
car.description = "Tesla"
print(car.description)

extension ElectricCar: Device {
    var model: String {
        set {
            _model = newValue
        }
        get {
            _model
        }
    }
}

var randomDevice: Device = car
randomDevice.model = "Tesla model X"
print(randomDevice.model)


extension Int {
	static var favoriteNumber: Int {
		42
	}
}

extension Int {
	func squared() -> Int {
		return self * self
	}

    var toBGN: String {
		"\(self) лв."
	}
}

print(Int.favoriteNumber)
print(10.squared().toBGN)

protocol Person {
	var firstName: String { get }
	var lastName: String { set get }
    var fullName: String { get }
	var age: Int { set get }
}

extension Person {
	var fullName: String {
		return "\(firstName) \(lastName)"
	}
}

struct Student: Person {
    let firstName: String
    var lastName: String
    var age: Int
}
extension Student {
	mutating func growOlder() {
		age += 1
	}
	
	func greet() {
		print("Hello, my name is \(fullName)")
	}
}

extension Student {
	var fullName: String {
		return ">>> \(firstName) \(lastName) <<<"
	}
}

//- error: extensions must not contain stored properties
// extension Student {
// 	var fullName2: String 
// }

var georgi = Student(firstName: "Georgi", lastName: "Petrov", age: 18)
georgi.greet()
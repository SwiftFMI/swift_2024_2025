//classes
// базов
class Car {
    var name: String
    var engine: String
    
    required init(name: String) {
        self.name = name
        print("Init a car with name = \(name)")
        self.engine = "diesel"
    }

    convenience init() {
        self.init(name: "missing name")
    }

    func maxSpeed() -> Double {
        120
    }

    deinit {
        print("deinit")
    }
}

class EV: Car {
    var battery: Double

    init(name: String, battery: Double = 100) {
        
        // 1. init store properties 
        self.battery = battery
        // 2. super.init
        super.init(name: name)
    }

    required init(name: String) {
        self.battery = 100
        super.init(name: name)
    }

    override func maxSpeed() -> Double {
        230
    }
}

// композиция
final class EV2 {
    var battery: Double
    // композиция
    private var _car: Car

    init(name: String, battery: Double = 100) {
        
        // 1. init store properties 
        self.battery = battery
        self._car = Car(name: name)
    }

    var name: String {
        _car.name
    }
}

// class Tesla: EV2 {

// }


var tesla: Car? = Car(name: "Tesla")

var ref = tesla

ref?.name = "Lada"
if let tesla {
    print(">>> \(tesla.name)")
}
//tesla = nil

print("finish!")
let c = ref
ref = nil
c?.name = "Porsche"

if let tesla {
    print(">>> \(tesla.name)")
}

var ev = EV(name: "KIA IONIC6")
print(ev.name)
print(ev.battery)
print(ev.engine)
print(ev.maxSpeed())

var ev2 = EV2(name: "KIA IONIC6")
print(ev2.name)
print(ev2.battery)
// print(ev2.engine)

// var a = 5
// var b = a
// a = 7

// print(b)
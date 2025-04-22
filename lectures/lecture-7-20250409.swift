func sum(a: Int, b: Int) -> Int {
    return a + b
}
	
func product(a: Int, b: Int) -> Int {
    return a * b
}
// клас фукции, които
var f: (Int, Int) -> Int = sum(a:b:)

print(f(5, 5))
f = product(a:b:)
print(f(5, 5))


func printAllNames(names: [String], printFunc: (String) -> Void) {
    for name in names {
        printFunc(name)
    }
}


func fancyPrint2(name: String)   {
    print("@=> \(name) <=@")
}

func createVeryFancyPrintFunction() -> (String)-> Void {
    
    func fancyPrint(name: String)   {
        print("@****************************@")
        print("@$$$$$$$$$$ \(name) $$$$$$$$$@")
        print("@****************************@")
    }
    
    
    return fancyPrint
}

let names = ["Boris", "Ivan", "Peter"]

printAllNames(names: names, printFunc: fancyPrint2(name:))
printAllNames(names: names, printFunc: createVeryFancyPrintFunction())


func trailingClosure(i: Int, predicate: (Int) -> Bool) {
    print("Проверка за \(i)")
    if predicate(i) {
        print("Предикатът е удволетворен.")
    }
}

func isEven(a: Int) -> Bool {
    return a % 2 == 0
}

trailingClosure(i: 1, predicate: isEven(a:))
trailingClosure(i: 1, predicate: { (a: Int) -> Bool in
    print("Нечетно ли е \(a)?")
    return a % 2 == 1
})


trailingClosure(i: 1, predicate: { (a) -> Bool in
    return a % 2 == 0
})

trailingClosure(i: 1, predicate: { (a) in
    return a % 2 == 0
})

trailingClosure(i: 4) { (a) in
    return a % 2 == 0
}

trailingClosure(i: 4) { a in
    return a % 2 == 0
}

trailingClosure(i: 4) { (a) in
    a % 2 == 0
}

trailingClosure(i: 8) {
    $0 % 2 == 0
}

//сортиране
print(names.sorted(by: { $0 > $1 }))
print(names.sorted() { $0 > $1 })
print(names.sorted { $0 > $1 })
//сортираме, като подаваме функция от тип (String, String) -> Bool ( т.е. оператор за сравнение)
print(names.sorted(by: >))

f = { $0 + $1 + 100 }

let pi = 3.14
print(f(1, 1))

var f1 = { 

}


func guardExample(x: Int?, y: Int? = nil) {
    // if let x {
    //     if let y {
    //         print("X = \(x)")
    //         print("Y = \(y)")
    //     } else {
    //         print("Y is nil!")
    //     }
    // } else {
    //     print("X is nil!")
    //     print("or Y is nil!")
    // }

    guard let x else {
        print("X is nil")
        return
    }
    guard let y else {
        print("Y is nil")
        return
    }
    
    print("X = \(x)")
    print("Y = \(y)")
}

guardExample(x: nil)
guardExample(x: 7, y: 100)


func createGen(start: Int, modify: @escaping (Int) -> Int ) -> () -> (Int) {
    
    var myStart = start

    return {
        let oldValue = myStart
        myStart = modify(myStart)
        return oldValue
    }
    
}

var next = createGen(start: 0) {
    $0 + 2
}

print(next()) //2
print(next()) //4
print(next()) //6
print(next()) //8


func funcAutoclosure(pred: @autoclosure () -> Bool) {
    if pred() {
        print("It's true")
    } else {
        print("It's НОТ true")
    }
}

funcAutoclosure(pred: 11 > 12)
funcAutoclosure(pred: { () -> Bool in return 2 > 1}())

//допълнителен пример
func funcAutoclosureComplex(pred: @autoclosure () -> ()) {
    print("body of \(#function)")
}


func funcAutoclosureComplexVoid(pred: Void) {
    print("body of \(#function)")
}
// print("*the function is wrapped in a closure and it's never called.")
funcAutoclosureComplex(pred: print("the function is wrapped in a closure and it's never called."))

funcAutoclosureComplexVoid(pred: print("the function print() is called"))
//Това е изходът от горния код:
//body of funcAutoclosureComplex(pred:)
//the function print() is called
//body of funcAutoclosureComplexVoid(pred:)
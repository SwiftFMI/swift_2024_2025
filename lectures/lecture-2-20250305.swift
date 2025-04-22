// types Car

var x = 100

if 3 < 7 { 
    print("3 < 7") 
    print("should run with the above") // always runs
} else {
    // print("Error?")
} 

if x < 100 {
    print("Less than a 100")
} else if x > 100 {
    print("More than a 100")
} else {
    // otherwise
}


let someNumber = 3
switch someNumber {
case 1:
    print("Едно")
case 3:
    print("Три")
    // fallthrough
default:
    print("Някакво друго число")
}


let count = 34
let things = "ябълки"
var expression: String
switch count {
    case 0:
        expression = "николко"
    case 1..<10:
        expression = "няколко"
    case 10..<100:
        expression = "десетки"
    case 100..<1000:
        expression = "стотици"
    default:
        expression = "много"
}
print("\(count) са \(expression) \(things)")
print(type(of: 1..<10))
print(type(of: 1...10))


let point = (1, 1)
print(point.0)
print(point.1)
print(type(of: point))

switch point {    
    case (0, 0):
        print("точка (0, 0) е в началото на координатната система")
    case (_, 0):
        print("точка (\(point.0), 0) се намира на абсциса х")
    case (0, _):
        print("точка (0, \(point.1)) се намира на абсциса у")
    case (-2...2, -2...2):
        print("точка (\(point.0), \(point.1)) е в квадрата")
    default:    
        print("точка (\(point.0), \(point.1)) е извън квадрата")
}

switch point {
    case (let x, 0):
        print("точка (\(x), 0) се намира на абсциса х")
    case (0, let y):
        print("точка (0, \(y)) се намира на ордината у")
    case let (x, y):
        print("точка (\(x), \(y)) е някъде другаде")
}   

let point2D = (x: 10.0, y: 10.0)
print("\(point2D.x)")
print("\(point2D.0)")

let (myX, myY) = point2D

for index in 1...5 {
    print("\(index) по 5 е \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) на степен \(power) е \(answer)")


let names: [String] = ["Емил", "Спас", "Иван", "Гошо"]

// let names = [String]() 
for name in names {
    print("Здравей, \(name)!")
}

let numberOfLegs: [String: Int] = ["паяци": 8, "мравки": 6, "котки": 4] 
// let numberOfLegs: Dictionary<String, Int> = ["паяци": 8, "мравки": 6, "котки": 4] 

for (animalName, legCount) in numberOfLegs {
    print("\(animalName)те имат \(legCount) крака")
}

let allKeys = Array(numberOfLegs.keys)
let keysCount = allKeys.count
var index = 0
while index < keysCount {
    let key = allKeys[index]
    if let legs = numberOfLegs[key] {
        print("\(key)те имат \(legs) крака")
    }
    index += 1
}


let matrix2D = 
[
    [1, 1, 0, 1, 1],
    [1, 1, 0, 1, 1],
    [1, 1, 0, 1, 1],
    [1, 1, 0, 1, 1],
    [1, 1, 0, 1, 1],
]
let rows = matrix2D.count
let cols = matrix2D[0].count

var rowIndex = 0
var killSwitch = true
while rowIndex < rows && killSwitch {
    var colIndex = 0
    var singleRow = ""
    while colIndex < cols {
        if colIndex % 2 == 0 {
            colIndex += 1
            killSwitch = false
            continue
        }
        singleRow += "\(matrix2D[rowIndex][colIndex])"
        colIndex += 1
        // var innerVar = "Hello"
    }
    print(singleRow)
    rowIndex += 1    
}

print("repeat while:")
repeat {
    var colIndex = 0
    var singleRow = ""
    while colIndex < cols {
        singleRow += "\(matrix2D[rowIndex][colIndex])"
        colIndex += 1
    }
    print(singleRow)
    rowIndex += 1 
} while rowIndex < rows


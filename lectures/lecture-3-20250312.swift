//Място където да намерим различни структури от данни и алгоритми
//реализирани на Swift
//https://github.com/kodecocodes/swift-algorithm-club

//Нека да напишем първата функция, която обединява няколко действия.
func severalActions() -> Void {
	print("Action 1")
	print("Action 2")
	print("Action 3")
}

//тук ще активираме нашата функция. Може да мислим, че я "извикваме" (call)
severalActions()
print("other code goes here ...")
severalActions()


func functionName(labelName name: String) -> String {
	let returnedValue = name + " was passed"
	return returnedValue
}

@discardableResult
func functionName(_ name: String) -> String {
	let returnedValue = name + " was passed"
	return returnedValue
}

//ето и извикването на функцията
let _ = functionName(labelName: "Nothing")
// draw(rect: r,onCanvas: canvas)
// draw(r, canvas)
functionName("smething")

func max(a: Int, b: Int) -> Int {
    if a > b {
        return a
    }
    return b
}

print(max(a: 1, b: 100))

//overloading

// func max(a: Double, b: Double) -> Double {
//     print("\(#function)") // prints the name of the function
//     if a > b {
//         return a
//     }
//     return b
// }

func max(a: Double, b: Double) -> Double {
    a > b ? a : b
}

print(max(a: 1.0, b: 100.0))


func maxItemIndex(numbers: [Int]) -> (item: Int, index: Int) {
    var index = -1
	var max = Int.min
    
	for (i, val) in numbers.enumerated() {
		if max < val {
            max = val
            index = i
        }
	}
    	
    return (max, index)
}
		
let maxItemTuple = maxItemIndex(numbers: [12, 2, 6, 3, 4, 5, 2, 10])
if maxItemTuple.index >= 0 {
	print("Max item is \(maxItemTuple.item).")
	print("@ index = \(maxItemTuple.index).")
}
//inout

// 
func doSomthing(a: Int) {
    // dsadhsakjhdka

}

var x1 = 100
doSomthing(a: x1)
print("x1 = \(x1)")


func swap(_ a: inout Int, _ b: inout Int ) -> () {
    let temp = a
    a = b
    b = temp
}

var a = 100
var b = 200

swap(&a, &b)

print(a, b) // 200, 100
//capture list


var label = "Hello Swift!"

func printLabel() {
    // var label = "Hi!"
    func innerHelper() {
        print(label)
    } 

    innerHelper()
}


label = "Hello TS.go!"

printLabel()


func countItemsIn(array: [Int]) -> Int {
    if array.isEmpty {
        return 0
    }
    return 1 + countItemsIn(array: Array(array.suffix(from: 1)))
}

print(countItemsIn(array: [1,2,3,4,5]))


func concat(label: String = "Hello", with: String = " world", andWith: String = "!") -> String {
    label + with + andWith
}

print(concat())
print(concat(with: " Swift!"))
print(concat(andWith: " & Swift!"))


func max(_ items: Int...) -> Int {
	var max = Int.min
	for val in items {
		if max < val {
            max = val
        }
	}
    	
    return max
}

func max(items: Int..., labels: String...) -> Int {
	var max = Int.min
	for val in items {
		if max < val {
            max = val
        }
	}
    	
    return max
}

let maximum = max(1,2,3,4,5,6,7,8,9,10)
print("Max = \(maximum)")


let m2 = max(items: 100,2,3,4,5,6,7,8,9,10, labels: "hi", "hello","Yo!")
print("Max = \(m2)")


print(min(1,2,3,4,5))


// "dsadsa" + "dsadsadsa"
// 1 + 2

extension String {
    static func * (left: String, right: Int) -> String {
        if  right <= 0 {
            return ""
        }
        
        var result = left
        for _ in 1..<right {
            result += left
        }
        return result
    }
}

print("Hi" * 5)


var t = 1001

t += 100

print(t)

// 2 + 3 % 4 * 5
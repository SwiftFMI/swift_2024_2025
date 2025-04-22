

var myConst: Int  = 100

var x = myConst + 100

myConst = 1001

let myText: String = "This is a string!"
let myBool = true
let myDouble: Double = 3.14

// let моятаПроменливаОтТипСимволенНиз = "Текст"
// let здравей🌎 = "\nHello world!"

// var `while` = 5

print(myText)
// print(моятаПроменливаОтТипСимволенНиз)
// print(myConst, x, здравей🌎, `while`)

/*
dsadas
// dsadsadasdsadsa
//dsa dsa dsas ad
*/


let menu = """
Това е моето меню:
1.\(myText) 
2.Това струва \(2 * myConst) лв.
3.
"""

print(menu)

var usersInput: String? = "Hello SwiftFMI!"
// var usersInput: Optional<String> = "Hello SwiftFMI!" // later in the course

///
if let value = usersInput {
    print(value)
}

if let usersInput = usersInput {
    print(usersInput)
}

if let usersInput {
    print(usersInput)
}

let nonOptionalString = usersInput ?? "missing value"
print(">", nonOptionalString)

// print(usersInput!) // crash



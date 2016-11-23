//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


let myconstant: Float = 4

let label = "tova e "
let width = 40

let labelwidth = label + String(width)

let apples = 3
let oranges = 5
let applesummary = "I have \(apples) apples"
let fruitsummary = "I have \(apples + oranges) pieces of fruit"

var shopinglist = ["topki", "patki", "kor"]
shopinglist[0] = "mama vi"
print(shopinglist[0])

let emptyarray = [String]()
let emptyDictionary = [String: Float]()


var occupations = ["Koko": "Game Designer", "Gosho": "Pederas"]
occupations["Koko"]
occupations["Gosho"]


let individualscores = [10, 20, 150, 167, 250]

var teamscore = 0

for score in individualscores {
    if score > 50 {
        teamscore += 3
    } else {
        teamscore += 1
    }
}


print(teamscore)


//Кода ходи по всичките стойности сетнати в individualscores и изпълнява кода
for patki in individualscores {
    if patki == 10 {
        print("brao")
    }
    else
    {
        print("ebasi")
    }
}


var optionalstring: String? = "Hello"
print(optionalstring == "Hello")

if optionalstring == "Hello"
{
    print(optionalstring!)
}

var optionalname: String? = "Kons"
var greeting = "Hello"
if let name = optionalname {
    greeting = "Hello, \(name)"
}
    else
{
    greeting = "Wrong Name"
}


let nickname: String? = nil
let fullname: String = "Koki e golem"
let ko = "3"
let informalgreeting = "Hi \(nickname ?? ko)" //If nickname is nil then the value of "Ko" is used, default value is "Ko"


let vegetable = "cherven Luk"
switch vegetable {
case "celery":
    print("Kvo e tva be bate")
case "topki", "kur":
    print("bate ti lud li si")
case let X where X.hasSuffix("luk"):
    print("ekstra e s \(X)")
default:
    print("Vsichko e nared")
}


let interestingnumbers = [
    "Prime" : [2, 3, 5, 7, 11, 13, 33],
    "Fibonacci" : [1, 1, 2, 3, 5, 8],
    "Square" : [1, 4, 9, 16, 25],
]

var largest = 0
var type = String()
for (kind, numbers) in interestingnumbers {
    for number in numbers {
        if number > largest {
            largest = number
            type = kind
        }
    }
}
print(type, largest)


var n = 2
while n < 100 {
    n = n * 25
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100

print(m)

var total = 0
for i in 0..<4 {
    total += 1
}

print(total)

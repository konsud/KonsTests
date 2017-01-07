//: Playground - noun: a place where people can play

import UIKit

//Homework Task - 1 Perimeter and Area of a shape

class Shape
{
    var numberOfSides: Int = 0
    var name: String
    init (name: String)
    {
        self.name = name
    }
    func Perimeter() -> Double
    {
        return 0.0
    }
    func Area() -> Double
    {
        return 0.0
    }
    func simpleDescription() -> String
    {
        return "A shape named \(name) with \(numberOfSides) sides"
    }
}

class Triangle: Shape
{
    var sideOneLenght: Double
    var sideTwoLenght: Double
    var sideThreeLenght: Double
    init(name: String, sideOneLenght: Double, sideTwoLenght: Double, sideThreeLenght: Double)
    {
        self.sideOneLenght = sideOneLenght
        self.sideTwoLenght = sideTwoLenght
        self.sideThreeLenght = sideThreeLenght
        super.init(name: name)
        numberOfSides = 3
    }
    override func Perimeter() -> Double
    {
        let trianglePerimeter = sideOneLenght + sideTwoLenght + sideThreeLenght
        return trianglePerimeter
    }
    //For the area the Heron formula is used: https://en.wikipedia.org/wiki/Heron's_formula
    override func Area() -> Double
    {
        let halfPerimeter = Perimeter() / 2
        let triangleArea = sqrt(halfPerimeter*(halfPerimeter - sideOneLenght)*(halfPerimeter - sideTwoLenght)*(halfPerimeter - sideThreeLenght))
        return triangleArea
    }
    override func simpleDescription() -> String {
        return "A triangle with side A = \(sideOneLenght), side B = \(sideTwoLenght) and side C = \(sideThreeLenght). The perimeter is \(Perimeter()) and the area is \(Area())"
    }
}

//Example use of the triangle shape

let aTriangle = Triangle(name: "A Triangle", sideOneLenght: 4, sideTwoLenght: 13, sideThreeLenght: 15)
aTriangle.Perimeter()
aTriangle.Area()
print(aTriangle.simpleDescription())


class Square: Shape
{
    var squareSide: Double
    init(name: String, squareSide: Double)
    {
        self.squareSide = squareSide
        super.init(name: name)
        numberOfSides = 4
    }
    override func Perimeter() -> Double {
        let squarePerimeter = 4 * squareSide
        return squarePerimeter
    }
    override func Area() -> Double {
        let squareArea = squareSide * squareSide
        return squareArea
    }
    override func simpleDescription() -> String {
        return "A square with a side lenght = \(squareSide), the perimeter is \(Perimeter()) and the area is \(Area())"
    }
}

//Example use of square shape

let aSquare = Square(name: "A square", squareSide: 5)
aSquare.Area()
aSquare.Perimeter()
print(aSquare.simpleDescription())


class Rhombus: Shape
{
    var rhombusSide: Double
    var rhombusDiagonal1: Double
    init(name: String, rhombusSide: Double, rhombusDiagonal1: Double)
    {
        self.rhombusSide = rhombusSide
        self.rhombusDiagonal1 = rhombusDiagonal1
        super.init(name: name)
        numberOfSides = 4
    }
    override func Perimeter() -> Double {
        let rhombusPerimeter = 4 * rhombusSide
        return rhombusPerimeter
    }
    override func Area() -> Double {
        let rhombusDiagonal2 = Perimeter() - (rhombusDiagonal1 * rhombusDiagonal1)
        let rhombusArea = (rhombusDiagonal1 * rhombusDiagonal2) / 2
        return rhombusArea
    }
    override func simpleDescription() -> String {
        return "A rhombus with a side lenght = \(rhombusSide), the perineter is \(Perimeter()) and the area is \(Area())"
    }
}

//Example use of Rhombus shape

let aRhombus = Rhombus(name: "A rhombus", rhombusSide: 5, rhombusDiagonal1: 3)
aRhombus.Area()


class Rectangle: Shape
{
    var rectangleSideA: Double
    var rectangleSideB: Double
    init(name: String, rectangleSideA: Double, rectangleSideB: Double) {
        self.rectangleSideA = rectangleSideA
        self.rectangleSideB = rectangleSideB
        super.init(name: name)
        numberOfSides = 4
    }
    override func Perimeter() -> Double {
        let rectanglePerimeter = 2 * (rectangleSideA + rectangleSideB)
        return rectanglePerimeter
    }
    override func Area() -> Double {
        let rectangleArea = rectangleSideA * rectangleSideB
        return rectangleArea
    }
    override func simpleDescription() -> String {
        return "A rectangle with side A = \(rectangleSideA) and side B = \(rectangleSideB), the primeter is \(Perimeter()) and the area is \(Area())"
    }
}

//Example use of rectangle shape
let aRectangle = Rectangle(name: "A rectangle", rectangleSideA: 5, rectangleSideB: 7)
aRectangle.Perimeter()
aRectangle.Area()
aRectangle.simpleDescription()

class Trapezoid: Shape
{
    var trapezoidSideA: Double
    var trapezoidSideB: Double
    var trapezoidSideC: Double
    var trapezoidSideD: Double
    var trapezoidDiagonal: Double
    init(name: String, trapezoidSideA: Double, trapezoidSideB: Double, trapezoidSideC: Double, trapezoidSideD: Double, trapezoidDiagonal: Double)
    {
        self.trapezoidSideA = trapezoidSideA
        self.trapezoidSideB = trapezoidSideB
        self.trapezoidSideC = trapezoidSideC
        self.trapezoidSideD = trapezoidSideD
        self.trapezoidDiagonal = trapezoidDiagonal
        super.init(name: name)
        numberOfSides = 4
    }
    override func Perimeter() -> Double {
        let trapezoidPerimeter = trapezoidSideA + trapezoidSideB + trapezoidSideC + trapezoidSideD
        return trapezoidPerimeter
    }
    override func Area() -> Double {
        //Find the height of the Trapezoid by finding the height in a triangle formed by the diagonal
        let trapezoidTriangleHalfPerimeter = (trapezoidSideA + trapezoidSideB + trapezoidDiagonal) / 2
        //For finding the height the formula with half perimeter from here is used https://en.wikipedia.org/wiki/Altitude_(triangle)
        let triangleHeightA = ((2 * sqrt(trapezoidTriangleHalfPerimeter * (trapezoidTriangleHalfPerimeter - trapezoidSideA) * (trapezoidTriangleHalfPerimeter - trapezoidSideB) * (trapezoidTriangleHalfPerimeter - trapezoidDiagonal))) / trapezoidSideA)
        let trapezoidArea = (((trapezoidSideA + trapezoidSideB) / 2) * triangleHeightA)
        return trapezoidArea
    }
    override func simpleDescription() -> String {
        return "A trapezoid with Side A = \(trapezoidSideA), side B = \(trapezoidSideB), side C = \(trapezoidSideC) and side D = \(trapezoidSideD), the perimeter is \(Perimeter()) and the area is \(Area())"
    }
}

//Example use of a trapezoid shape
let aTrapezoid = Trapezoid(name: "A trapezoid", trapezoidSideA: 13, trapezoidSideB: 8, trapezoidSideC: 3, trapezoidSideD: 2, trapezoidDiagonal: 10)
print(aTrapezoid.Area())

class regularPentagon: Shape
{
    var pentagonSide: Double
    init(name: String, pentagonSide: Double) {
        self.pentagonSide = pentagonSide
        super.init(name: name)
        numberOfSides = 5
    }
    override func Perimeter() -> Double {
        let pentagonPerimeter = 5 * pentagonSide
        return pentagonPerimeter
    }
    override func Area() -> Double {
        //Formula from google for Area = 1/4 * √(5.(5+2*√5) * side^2
        let pentagonArea = ((1/4) * sqrt(5 * (5 + 2 * sqrt(5))) * pow(pentagonSide, 2))
        return pentagonArea
    }
    override func simpleDescription() -> String {
        return "A regular pentagon with side = \(pentagonSide), the perimeter is = \(Perimeter()) and the area is = \(Area())"
    }
}

//Example use of pentagon shape
let aPentagon = regularPentagon(name: "A pentagon", pentagonSide: 16)
aPentagon.Area()
aPentagon.Perimeter()

class regularHexagon: Shape
{
    var hexagonSide: Double
    init(name: String, hexagondSide: Double) {
        self.hexagonSide = hexagondSide
        super.init(name: name)
        numberOfSides = 6
    }
    override func Perimeter() -> Double {
        let hexagonPerimeter = 6 * hexagonSide
        return hexagonPerimeter
    }
    override func Area() -> Double {
        //Formula from wikipedia (https://en.wikipedia.org/wiki/Hexagon) -  Area = ((3 * √3) / 2) * side^2
        let hexagonArea = ((3 * sqrt(3) / 2) * pow(hexagonSide, 2))
        return hexagonArea
    }
    override func simpleDescription() -> String {
        return "A regular hexagon with side = \(hexagonSide), the perimeter is = \(Perimeter()) and the area is = \(Area())"
    }
}

//Example use of hexagon shape
let aHexagon = regularHexagon(name: "A hexagon", hexagondSide: 3)
aHexagon.Perimeter()
aHexagon.Area()


//Task 3 - Calculator

enum NumberType
{
    case Binary
    case Ternary
    case Octal
    case Decimal
    case Hexadecimal
}

var bla1 = 156
var bla2 = String(bla1, radix: 2)
var bla7 = String(bla1, radix: 16)
var bla3 = Double(bla2)
//func summingNumbers(forNumbers: [String], inSystem: NumberType) -> String
//{
//    switch inSystem {
//    case .Binary:
//        return "Binary"
//    case .Ternary:
//        return "Ternary"
//    case .Octal:
//        return "Octal"
//    case .Decimal:
//        return "Decimal"
//    case .Hexadecimal:
//        return "Hexadecimal"
//    default:
//        return "Not a valid number"
//    }
//}

var Numbers: [(num: String, numType: NumberType)] = []
//[("150",.Decimal), ("151", .Binary), ("234235", .Hexadecimal)]
Numbers.append((num: "1001", numType: .Binary))
Numbers.append((num: "6071", numType: .Octal))
Numbers.append((num: "ff0d", numType: .Hexadecimal))
print(Numbers)
print(Numbers[0].numType)


func convertNumberToDecimal(num: String, numType: NumberType) -> String
{
    switch numType {
    case .Binary:
        if let aDecimal = Int(num, radix: 2)
        {
            let decimalValue = String(aDecimal)
            return decimalValue
        }
    case .Ternary:
        if let aDecimal = Int(num, radix: 3)
        {
            let decimalValue = String(aDecimal)
            return decimalValue
        }
    case .Octal:
        if let aDecimal = Int(num, radix: 8)
        {
            let decimalValue = String(aDecimal)
            return decimalValue
        }
    case .Decimal:
        return num
    case .Hexadecimal:
        if let aDecimal = Int(num, radix: 16)
        {
            let decimalValue = String(aDecimal)
            return decimalValue
        }
    default:
        return ""
    }
    return "Invalid Number Type"
}

convertNumberToDecimal(num: "9C", numType: .Hexadecimal)


func convertingNumberToBinary(num: String, numType: NumberType) -> String
{
    
    switch numType
    {
    case .Binary:
        return num
    case .Ternary:
        let ternaryValue = String(Int(num, radix: 3)!, radix: 2)
        return ternaryValue
    case .Octal:
        let octalValue = String(Int(num, radix: 8)!, radix: 2)
        return octalValue
    case .Decimal:
        if let decimalInt = Int(num)
        {
            let binaryValue = String(decimalInt, radix: 2)
            return binaryValue
        }
    case .Hexadecimal:
        let hexValue = String(Int(num, radix: 16)!, radix: 2)
        return hexValue
    default:
        break
    }
    return "Invalid number type"
}

convertingNumberToBinary(num: "9C", numType: .Hexadecimal)

func convertingNumberToTernary(num: String, numType: NumberType) -> String
{
    switch numType
    {
    case .Binary:
        let octalValue = String(Int(num, radix: 2)!, radix: 3)
        return octalValue
    case .Ternary:
        return num
    case .Octal:
        let octalValue = String(Int(num, radix: 8)!, radix: 3)
        return octalValue
    case .Decimal:
        if let decimalInt = Int(num)
        {
            let ternaryValue = String(decimalInt, radix: 3)
            return ternaryValue
        }
    case .Hexadecimal:
        let hexValue = String(Int(num, radix: 16)!, radix: 3)
        return hexValue
    default:
        break
    }
    return "Invalid number type"
}

convertingNumberToTernary(num: "156", numType: .Decimal)

func convertingNumberToOctal(num: String, numType: NumberType) -> String
{
    switch numType
    {
    case .Binary:
        let binaryValue = String(Int(num, radix: 2)!, radix: 8)
        return binaryValue
    case .Ternary:
        let ternaryValue = String(Int(num, radix: 3)!, radix: 8)
        return ternaryValue
    case .Octal:
        return num
    case .Decimal:
        if let decimalInt = Int(num)
        {
            let ternaryValue = String(decimalInt, radix: 8)
            return ternaryValue
        }
    case .Hexadecimal:
        let hexValue = String(Int(num, radix: 16)!, radix: 8)
        return hexValue
    default:
        break
    }
    return "Invalid number type"
}

convertingNumberToOctal(num: "9C", numType: .Hexadecimal)

func convertingNumberToHex(num: String, numType: NumberType) -> String
{
    switch numType
    {
    case .Binary:
        let binaryValue = String(Int(num, radix: 2)!, radix: 16)
        return binaryValue
    case .Ternary:
        let ternaryValue = String(Int(num, radix: 3)!, radix: 16)
        return ternaryValue
    case .Octal:
        let octalValue = String(Int(num, radix: 8)!, radix: 16)
        return octalValue
    case .Decimal:
        if let decimalInt = Int(num)
        {
            let decimalValue = String(decimalInt, radix: 16)
            return decimalValue
        }
    case .Hexadecimal:
        return num
    default:
        break
    }
    return "Invalid number type"
}

convertingNumberToHex(num: "156", numType: .Decimal)


func summOfNumbers(numbers: [(num: String, numType: NumberType)], inType: NumberType) -> String
{
    var finalResult = Int()
    var finalResultDisplayed = String()
    for number in numbers
    {
        let numberToDecimal = number.num
        let result = convertNumberToDecimal(num: numberToDecimal, numType: number.numType)
        let resultToInt = Int(result)
        finalResult += resultToInt!
        finalResultDisplayed = String(finalResult)
    }
    switch inType {
    case .Binary:
        return convertingNumberToBinary(num: finalResultDisplayed, numType: .Decimal)
    case .Ternary:
        return convertingNumberToTernary(num: finalResultDisplayed, numType: .Decimal)
    case .Octal:
        return convertingNumberToOctal(num: finalResultDisplayed, numType: .Decimal)
    case .Decimal:
        return finalResultDisplayed
    case .Hexadecimal:
        return convertingNumberToHex(num: finalResultDisplayed, numType: .Decimal)
    default:
        return "This is default"
    }
}

summOfNumbers(numbers: Numbers, inType: .Decimal)


func substractingOfNumbers(numbers: [(num: String, numType: NumberType)], inType: NumberType) -> String
{
    var finalResult = Int()
    var finalResultDisplayed = String()
    for number in numbers
    {
        let numberToDecimal = number.num
        let result = convertNumberToDecimal(num: numberToDecimal, numType: number.numType)
        let resultToInt = Int(result)
        if finalResult == 0
        {
            finalResult = resultToInt!
            //finalResultDisplayed = String(finalResult)
        }
        else
        {
            finalResult = (finalResult - resultToInt!)
            //finalResultDisplayed = String(finalResult)
        }
    }
    finalResultDisplayed = String(finalResult)
    switch inType {
    case .Binary:
        return convertingNumberToBinary(num: finalResultDisplayed, numType: .Decimal)
    case .Ternary:
        return convertingNumberToTernary(num: finalResultDisplayed, numType: .Decimal)
    case .Octal:
        return convertingNumberToOctal(num: finalResultDisplayed, numType: .Decimal)
    case .Decimal:
        return finalResultDisplayed
    case .Hexadecimal:
        return convertingNumberToHex(num: finalResultDisplayed, numType: .Decimal)
    default:
        return "This is default"
    }
}

substractingOfNumbers(numbers: Numbers, inType: .Decimal)

func multiplicationOfNumbers(numbers: [(num: String, numType: NumberType)], inType: NumberType) -> String
{
    var finalResult = Int()
    var finalResultDisplayed = String()
    for number in numbers
    {
        let numberToDecimal = number.num
        let result = convertNumberToDecimal(num: numberToDecimal, numType: number.numType)
        let resultToInt = Int(result)
        if finalResult == 0
        {
            finalResult = resultToInt!
            //finalResultDisplayed = String(finalResult)
        }
        else
        {
            finalResult *= resultToInt!
            //finalResultDisplayed = String(finalResult)
        }
    }
    finalResultDisplayed = String(finalResult)
    switch inType {
    case .Binary:
        return convertingNumberToBinary(num: finalResultDisplayed, numType: .Decimal)
    case .Ternary:
        return convertingNumberToTernary(num: finalResultDisplayed, numType: .Decimal)
    case .Octal:
        return convertingNumberToOctal(num: finalResultDisplayed, numType: .Decimal)
    case .Decimal:
        return finalResultDisplayed
    case .Hexadecimal:
        return convertingNumberToHex(num: finalResultDisplayed, numType: .Decimal)
    default:
        return "This is default"
    }
}

multiplicationOfNumbers(numbers: Numbers, inType: .Decimal)

func divisionOfNumbers(numbers: [(num: String, numType: NumberType)], inType: NumberType) -> String
{
    var finalResult = Double()
    var finalResultDisplayed = String()
    for number in numbers
    {
        let numberToDecimal = number.num
        let result = convertNumberToDecimal(num: numberToDecimal, numType: number.numType)
        let resultToDouble = Double(result)
        if finalResult == 0
        {
            finalResult = resultToDouble!
            //finalResultDisplayed = String(finalResult)
        }
        else
        {
            finalResult  = (finalResult / resultToDouble!)
            //finalResultDisplayed = String(finalResult)
        }
    }
    finalResultDisplayed = String(finalResult)
    switch inType {
    case .Binary:
        return convertingNumberToBinary(num: finalResultDisplayed, numType: .Decimal)
    case .Ternary:
        return convertingNumberToTernary(num: finalResultDisplayed, numType: .Decimal)
    case .Octal:
        return convertingNumberToOctal(num: finalResultDisplayed, numType: .Decimal)
    case .Decimal:
        return finalResultDisplayed
    case .Hexadecimal:
        return convertingNumberToHex(num: finalResultDisplayed, numType: .Decimal)
    default:
        return "This is default"
    }
}

divisionOfNumbers(numbers: Numbers, inType: .Decimal)

//Task 2 - JSON converter

let dic = ["Phone_Koko": "0888 143 297", "1": "A", "3": "C"]

do {
    let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
    // here "jsonData" is the dictionary encoded in JSON data
    
    let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
    // here "decoded" is of type `Any`, decoded from JSON data
    
    // you can now cast it with the right type
    if let dictFromJSON = decoded as? [String:String] {
        // use dictFromJSON
        print(dictFromJSON)
    }
} catch {
    print(error.localizedDescription)
}


func convertToJSONArray(data: Array<Any>) -> String
{
    var finalString: String = "{\n"
    for element in data
    {
        let element1 = String(describing: element)
        finalString += "\n   '\(element1)'"
    }
    finalString += "\n}"
    return finalString
}

let bla = [1,2,3,4,5,6,7]
let newArray = ["Kopele","brat mu","Joro","Petkan","Na maika im","Dedo","Yavor"]
print(bla[0])
print(convertToJSONArray(data: newArray))

let kopele: Set<String> = ["1}]", "3"]

func convertSetToJSON(data: Set<String>) -> String
{
    var finalString: String = "{\n"
    for element in data
    {
        let element1 = String(describing: element)
        finalString += "\n   '\(element1)'"
    }
    finalString += "\n}"
    return finalString
}

print(convertSetToJSON(data: kopele))


func convertDictionaryToJSON(data: Dictionary<String, String>) -> String
{
    var finalString: String = "{\n"
    for (key, element) in data
    {
        let element1 = String(describing: element)
        finalString += "\n  '\(key)' : '\(element1)'"
    }
    finalString += "\n}"
    return finalString
}

print(convertDictionaryToJSON(data: dic))

func convertDictionaryToJSON2(data: Dictionary<String, String>) -> String
{
    var finalString: String = "{\n"
    for (key, element) in data
    {
        let element1 = String(describing: element)
        finalString += "\n  '\(key)' : '\(element1)'"
    }
    finalString += "\n}"
    return finalString
}


func test(data: AnyObject) -> String
{
    if let testArray = data as? Array<Any> //Test the rest with a switch statement
    {
        for element in testArray
        {
            print(element)
        }
    }
    if let testSet = data as? Dictionary<Int, String>
    {
        for element in testSet
        {
            print(element)
        }
    }
    if let testSet = data as? Dictionary<Float, String>
    {
        for element in testSet
        {
            print(element)
        }
    }
    if let testSet = data as? Dictionary<Double, String>
    {
        for element in testSet
        {
            print(element)
        }
    }
    if let testSet = data as? Dictionary<Int, Int>
    {
        for element in testSet
        {
            print(element)
        }
    }
    if let testSet = data as? Dictionary<Float, Int>
    {
        for element in testSet
        {
            print(element)
        }
    }
    if let testSet = data as? Dictionary<Double, Int>
    {
        for element in testSet
        {
            print(element)
        }
    }
    if let testSet = data as? Dictionary<Int, String>
    {
        for element in testSet
        {
            print(element)
        }
    }
    return "DA"
}
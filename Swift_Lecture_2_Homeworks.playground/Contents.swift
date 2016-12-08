//: Playground - noun: a place where people can play

import UIKit

//Homework Task 1 - Fuel consumption calculator

var totalDistanceTraveled: Double = 0 //Total distance traveled
var totalConsumedFuel: Double = 0 //Total consumated fuel
var distanceBetweenFuelings: Double = 0 //Distance between fuelings

func addDistance(traveledDistanceKM: Double) -> Double
{
    totalDistanceTraveled += traveledDistanceKM
    return totalDistanceTraveled
}

func Fueling(addedFuel: Double) -> (one: Double, two: Double, three: Double)
{
    if (distanceBetweenFuelings == 0)
    {
        print("Last fueling was at the begining of the trip")
    }
    else
    {
        print("Last fueling was at: \(distanceBetweenFuelings) km")
    }
    distanceBetweenFuelings = totalDistanceTraveled - distanceBetweenFuelings
    print("Distance traveled since last fueling: \(distanceBetweenFuelings) km")
    if (totalConsumedFuel == 0)
    {
        totalConsumedFuel = addedFuel
    }
    else
    {
        totalConsumedFuel += addedFuel
    }
    let averageFuelConsumedBetweenFuelings = (addedFuel / distanceBetweenFuelings) * 100
    print("Average fuel consumption (liters per 100km) between this fuelings and the last fueling is: \(averageFuelConsumedBetweenFuelings)/100 liters/km\n")
    return (totalConsumedFuel, distanceBetweenFuelings, averageFuelConsumedBetweenFuelings)
}

func averageFuelConsumption(totalDistance: Double, totalConsumatedFuel: Double) -> Double
{
    let averageConsumption = (totalConsumatedFuel / totalDistanceTraveled) * 100
    print("Total distance traveled is: \(totalDistanceTraveled) km")
    print("Total fuel consumed is: \(totalConsumedFuel) liters")
    print("Total average fuel consumption (liters per 100km) for \(totalDistanceTraveled) km is: \(averageConsumption)/100 liters/km")
    return averageConsumption
}

func convertToMilesPerGalon(distanceInKM: Double, fuelConsumedInLiters: Double) -> Double
{
    let distanceInMiles = distanceInKM / 1.609
    let consumptionInGallons = fuelConsumedInLiters * 0.2641
    let milesPerGalon: Double = distanceInMiles / consumptionInGallons
    print("\nThe fuel consumption in miles per gallon is: \(milesPerGalon.rounded()) miles per gallon")
    return milesPerGalon
}

func pricePerKM(distanceInKM: Double, fuelConsumedInLiters: Double, fuelPricePerLiter: Double) -> Double
{
    let KMperLiter = distanceInKM / fuelConsumedInLiters
    let KMprice = fuelPricePerLiter / KMperLiter
    print("\nThe price per kilometer is: \(KMprice)")
    return KMprice
}



//Homework Task 2 - Snakes and Ladders game
//This image is used for the creation of the game: http://image.shutterstock.com/z/stock-vector-snakes-and-ladders-board-game-snakes-ladders-start-finish-163384724.jpg

//Player One data
var playerOnePosition = 0
var playerOneDiceRoll = 0
let playerOneName = "Gery - Nikol"
//Player Two data
var playerTwoPosition = 0
var playerTwoDiceRoll = 0
let playerTwoName = "Izdislav"
//Board data
var gameBoard = Array(0...100)
let finalSquare = 100

//Ladders squares
gameBoard[1] += 37; gameBoard[4] += 10; gameBoard[9] += 22
gameBoard[21] += 21; gameBoard[28] += 56; gameBoard[51] += 16
gameBoard[72] += 19; gameBoard[80] += 19

//Snakes squares
gameBoard[17] -= 10; gameBoard[54] -= 20; gameBoard[63] -= 45
gameBoard[64] -= 4; gameBoard[87] -= 51
gameBoard[92] -= 19; gameBoard[95] -= 20; gameBoard[98] -= 19

let ladderPositions = [1, 4, 9, 21, 28, 51, 72, 80]
let snakesPositions = [17, 54, 63, 64, 87, 92, 95, 98]
let diceNumbers = [1, 2, 3, 4, 5, 6]
func playerOneTurn() -> Int
{
    print("It is \(playerOneName)'s turn")
    repeat {
        playerOneDiceRoll = Int(arc4random_uniform(UInt32(diceNumbers.count)))
    } while playerOneDiceRoll == 0
    let previousPosition = playerOnePosition
    playerOnePosition += playerOneDiceRoll
    if (playerOnePosition < 100)
    {
        print("\(playerOneName)'s previous position was \(previousPosition) they rolled \(playerOneDiceRoll) and they landed on \(playerOnePosition)")
        if (ladderPositions.contains(playerOnePosition))
        {
            print("\(playerOneName) stepped on a ladder at position \(playerOnePosition) of the board which will move them FORMWARD to \(gameBoard[playerOnePosition])")
        }
        if (snakesPositions.contains(playerOnePosition))
        {
            print("\(playerOneName) stepped on a snake at position \(playerOnePosition) of the board which will move them BACKWARDS to \(gameBoard[playerOnePosition])")
        }
        playerOnePosition = gameBoard[playerOnePosition]
        return playerOnePosition
    }
    else
    {
        print("\(playerOneName)'s last position was \(previousPosition) they rolled \(playerOneDiceRoll) and have won the game")
        return playerOnePosition
    }
}

func playerTwoTurn() -> Int
{
    print("It is \(playerTwoName)'s turn")
    repeat {
        playerTwoDiceRoll = Int(arc4random_uniform(UInt32(diceNumbers.count)))
    } while playerTwoDiceRoll == 0
    let previousPosition = playerTwoPosition
    playerTwoPosition += playerTwoDiceRoll
    if (playerTwoPosition < 100)
    {
        print("\(playerTwoName)'s previous position was \(previousPosition) they rolled \(playerTwoDiceRoll) and they landed on \(playerTwoPosition)")
        if (ladderPositions.contains(playerTwoPosition))
        {
            print("\(playerTwoName) stepped on a ladder at position \(playerTwoPosition) of the board which will move them FORMWARD to \(gameBoard[playerTwoPosition])")
        }
        if (snakesPositions.contains(playerTwoPosition))
        {
            print("\(playerTwoName) stepped on a snake at position \(playerTwoPosition) of the board which will move them BACKWARDS to \(gameBoard[playerTwoPosition])")
        }
        playerTwoPosition = gameBoard[playerTwoPosition]
        return playerTwoPosition
    }
    else
    {
        print("\(playerTwoName)'s last position was \(previousPosition) they rolled \(playerTwoDiceRoll) and have won the game")
        return playerTwoPosition
    }
}


repeat{
    playerOneTurn()
    playerTwoTurn()
} while playerOnePosition < 100 && playerTwoPosition < 100

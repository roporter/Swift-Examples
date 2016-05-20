//: Playground - noun: a place where people can play

import UIKit

var names = ["Jon", "Jacob", "Jingle", "Helmer", "Smith"]
var names2: [String]
var numbers = [44, 233, 12, 4]
var values = [true, false, true, true, false, false]
var countries = [String]()
var top3Colors = [String](count: 3, repeatedValue:"Boring Brown")

top3Colors[0] = "Blue"
top3Colors[1] = "Red"
top3Colors[2] = "Yellow"

print(names[4])

var favCars = [String]()
favCars.append("BMW M3")
favCars.append("Audi S7")
favCars.append("Ford Pinto")
favCars.removeAtIndex(2)
favCars.append("1969 Chevy Camaro")
favCars.insert("Nisson GTR", atIndex: 0)

var shoppingCart = [String]()
var budget: Double = 500
var currentCartAmount: Double = 0

func addItemtoCart(item: String, price: Double) {
    if currentCartAmount + price <= budget {
        shoppingCart.append(item)
        currentCartAmount += price
    } else {
        print("Not enough money!")
    }
}

addItemtoCart("Final Fantasy X / X2", price: 50.25)
print(currentCartAmount)
addItemtoCart("Bleach", price: 3.45)
print(currentCartAmount)
addItemtoCart("Couch", price: 150.72)
print(currentCartAmount)
addItemtoCart("PS4", price: 300)
print(currentCartAmount)
print(shoppingCart)
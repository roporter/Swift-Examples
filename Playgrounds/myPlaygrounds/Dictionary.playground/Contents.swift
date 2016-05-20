//: Playground - noun: a place where people can play

import UIKit

var Webster: [String: String] = ["Krill":"any of the small crustaceans","Fire":"a burning mass of material"]
var test: [Int: String] = [44: "My fav number", 32: "Man I hate this number!"]
var highScore: [String: Int] = ["spentak": 401, "playa21": 200, "deathBySpongebob": 500]

if let krill = Webster["Krill"] {
    print(krill)
}


// Clear
Webster = [:]
if Webster.isEmpty {
    print("The english dictionary is empty!")
}

print(highScore["spentak"])

for( user, score) in highScore {
    print("The user: \(user) scored: \(score)")
}

highScore["jkkillabeanz"] = 2

for( user, score) in highScore {
    print("The user: \(user) scored: \(score)")
}
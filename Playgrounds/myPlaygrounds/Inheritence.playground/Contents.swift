//: Playground - noun: a place where people can play

import UIKit

class Person {
    var eyeColor = "Blue"
    var name: String
    var speed = "10 mph"
    var benchPress = "200 lbs"
    
    init(name: String) {
        self.name = name
    }
    func catchPhrase() -> String {
        return "Hi, i'm an average person"
    }
}

class Animorph: Person {
    var animalType = "Dog"
    
    convenience init(type: String, name: String) {
        self.init(name: name)
        self.animalType = type
        self.speed = "20 mph"
    }
    
    override func catchPhrase() -> String {
        return "I can turn into a cool animal!"
    }
}

class SuperHero: Person {
    var specialPower = "X-Ray Vision"
    var altaego = "Jonny"
    
    convenience init(name: String, press: String) {
        self.init(name: name)
        benchPress = press
    }
    
    override func catchPhrase() -> String {
        return "With power comes great responsibility"
    }
}

var John = Person(name: "John")
var ani = Animorph(type: "Tiger", name: "Random")
var pukeMan = SuperHero(name: "Puke Man", press: "5000 lbs")


print(John.eyeColor)
print(John.catchPhrase())

print(ani.eyeColor)
print(ani.catchPhrase())

print(pukeMan.eyeColor)
print(pukeMan.catchPhrase())
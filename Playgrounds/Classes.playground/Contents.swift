//: Playground - noun: a place where people can play

import UIKit

class Vehicle {
    private var engine = "4 Cylinder"
    private var color = "Silver"
    private var _odometer = 0
    
    init() {}
    
    init(engine: String, color: String, odometer: Int) {
        self.engine = engine
        self.color = color
        self._odometer = odometer
    }
    
    var odometer: Int {
        get {
            return _odometer
        }
        set {
            if newValue > _odometer {
                _odometer = newValue
            }
        }
    }
    
    func enterMiles(miles: Int) {
        self._odometer += miles
    }
}

var vehicles = [Vehicle]()


var srx = Vehicle(engine: "6 Cylinder", color: "Royal Blue", odometer: 100)
var volvo = Vehicle()
var silverado = Vehicle()

srx.odometer = 400

vehicles.append(srx)
vehicles.append(volvo)
vehicles.append(silverado)


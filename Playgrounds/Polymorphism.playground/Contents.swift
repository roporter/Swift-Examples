//: Playground - noun: a place where people can play

import UIKit

class Shape {
    var area: Double?
    
    func calculateArea() {
        
    }
    func printArea() {
        print("The area is: \(area)")
    }
}

class Rectangle: Shape {
    var width = 1.0
    var height = 1.0
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    override func calculateArea() {
        area = width * height
    }
}

class Circle: Shape {
    var radius = 1.0
    
    init(radius: Double) {
        self.radius = radius
    }
    
    override func calculateArea() {
        area = 3.14 * radius * radius
    }
}

var circle = Circle(radius: 5.0)
var rectangle = Rectangle(width: 20, height: 5)

circle.calculateArea()
rectangle.calculateArea()

circle.printArea()
rectangle.printArea()

print(circle.area)
print(rectangle.area)
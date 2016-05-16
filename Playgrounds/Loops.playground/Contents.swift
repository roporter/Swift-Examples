//: Playground - noun: a place where people can play

import UIKit

var ages = [23, 25, 41, 51, 62]

print(ages.count)

for x in 0 ..< ages.count  {
    print(ages[x])
    if ages[x] > 50 {
        print("You are over 50")
    }
}
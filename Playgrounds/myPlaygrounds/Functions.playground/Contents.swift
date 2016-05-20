//: Playground - noun: a place where people can play

import UIKit

var bankAccount = 500.50
var itemCount = 212.23

func canPurchase(amount: Double) -> Bool {
    if(bankAccount >= amount){
        return true
    }
    return false
}

func processPurchase(amount: Double) {
    bankAccount -= amount
    print("You made a purchase of £\(amount)")
}

if( canPurchase( itemCount )) {
    processPurchase( itemCount )
} else {
    print("Insufficient Funds")
}



func getUpperVersion(str: String) -> String {
    return str.uppercaseString
}

print(getUpperVersion("testing"))
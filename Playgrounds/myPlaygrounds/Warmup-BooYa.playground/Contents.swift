//: Playground - noun: a place where people can play

import UIKit

// 1. Create a loop that iterates 200 times starting at 1
// 2. If the value of the current iteration is a multiple of 3 print the word "Boo"
// 3. If the value of the current iteration is a multiple of 5 print the word "Ya"
// 4. If the value of the current iteration is a multiple of 3 AND a multiple of 5 print the word "BooYa"

func checkValue(number: Int) -> String {
    if number % 3 == 0 && number % 5 == 0 {
        return "BooYa"                          // 4
    } else if number % 3 == 0 {
        return "Boo"                            // 2
    } else if number % 5 == 0 {
        return "Ya"                             // 3
    }
    return String(number)
}

for x in 0 ..< 200 {                            // 1
    print(checkValue(x))
}
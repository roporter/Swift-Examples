//: Playground - noun: a place where people can play

import UIKit

// 1. Create an empty array of type Int called oddNumbers
// 2. Using a standard for loop add all odd numbers less than or equal to 100 to the oddNumbers array
// 3. Create a second array called sums of type Int
// 4. Using a for each loop, iterate through oddNumbers array and add the current iteration value + 5 to the sums array
// 5. Using a repeat while loop, iterate through the sums array and print "The sum is: x" where x is the current value of the iteration (ie The sum is: 15)

var oddNumbers = [Int]()        // 1
var sums = [Int]()              // 3

func isEvenNumber(number: Int) -> Bool {
    if number % 2 == 0 {
        return true;
    } else {
        return false;
    }
}

for x in 0 ..< 100 {            // 2
    if !isEvenNumber(x) {
        oddNumbers.append(x)
    }
}

for number in oddNumbers {
    sums.append(number+5)
}

var x = 0;
repeat {
    print("The sum is: \(sums[x])")
    x += 1
} while x < sums.count

print(sums)
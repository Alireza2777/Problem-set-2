//
//  Repeating Sequence.swift
//  Problem Set 2 (Graph)
//
//  Created by Alireza Karimi on 2023-07-27.
//

import Foundation

class NonRepeatingIntegersCounter {
    func sumOfDigitsRaisedToPower(_ number: Int, _ power: Int) -> Int {
        let digits = String(number).compactMap { Int(String($0)) }
        let sum = digits.reduce(0) { $0 + Int(pow(Double($1), Double(power))) }
        return sum
    }

    func countNonRepeatingIntegers(_ a: Int, _ p: Int) -> Int {
        var d = [Int]()
        var num = a

        while !d.contains(num) {
            d.append(num)
            num = sumOfDigitsRaisedToPower(num, p)
        }

        let repeatingIndex = d.firstIndex(of: num)

        if let repeatingIndex = repeatingIndex {
            return repeatingIndex
        } else {
            // If the sequence is not repeating, all numbers are non-repeating
            return d.count
        }
    }
}

func main2() {
    guard let numberOfTestCases = Int(readLine()!) else {
        return
    }

    var results = [Int]()
    let counter = NonRepeatingIntegersCounter()

    for _ in 0..<numberOfTestCases {
        guard let input = readLine()?.split(separator: " ").compactMap({ Int($0) }), input.count == 2 else {
            return
        }

        let a = input[0]
        let p = input[1]

        let nonRepeatingCount = counter.countNonRepeatingIntegers(a, p)
        results.append(nonRepeatingCount)
    }

    for result in results {
        print(result)
    }
}

// Call the main function to start the program


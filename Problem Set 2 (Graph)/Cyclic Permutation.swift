//
//  Cyclic Permutation.swift
//  Problem Set 2 (Graph)
//
//  Created by Alireza Karimi on 2023-07-27.
//

import Foundation

class CyclicPermutation {
    func cyclicPermutationCount(for permutation: [Int]) -> Int {
        var visited = Array(repeating: false, count: permutation.count)
        var cycles = 0

        for i in 0..<permutation.count {
            let index = permutation[i] - 1 // Adjust index to 0-based
            if !visited[index] {
                var j = index
                while !visited[j] {
                    visited[j] = true
                    j = permutation[j] - 1 // Adjust index to 0-based
                }
                cycles += 1
            }
        }

        return cycles
    }
}

func main() {
    let numberOfTestCases = Int(readLine()!)!
    var results = [Int]()
    let cyclicPermutation = CyclicPermutation()

    for _ in 0..<numberOfTestCases {
        _ = Int(readLine()!)! // Use underscore to indicate that 'size' is not needed
        let permutation = readLine()!.split(separator: " ").compactMap { Int($0) }
        let cycleCount = cyclicPermutation.cyclicPermutationCount(for: permutation)
        results.append(cycleCount)
    }

    for result in results {
        print(result)
    }
}

// Call the main function to start processing the test cases






//
//  day-01.swift
//  advent-of-code-2021
//
//  Created by Jeb Schiefer on 12/6/21.
//

import Foundation

class Day01 {

    func run() {
        print("------")
        print("Day 01")

        print("  Part one: \(singleMeasurement())")
        print("  Part two: \(threeMeasurement())")
    }

    func singleMeasurement() -> Int {
        var numberOfIncreases = 0

        if let data = Utility.readFile(name: "day01-input") {
            let depths = data.split(separator: "\n")

            var previousDepth = -1

            for depth in depths {
                let currentDepth = Int(depth) ?? 0

                if previousDepth > -1 && currentDepth > previousDepth {
                    numberOfIncreases += 1
                }

                previousDepth = currentDepth
            }
        }

        return numberOfIncreases
    }

    func threeMeasurement() -> Int {
        var numberOfIncreases = 0

        if let data = Utility.readFile(name: "day01-input") {
            let depths = data.split(separator: "\n")

            var previousSum = -1
            var a = -1
            var b = -1
            var c = -1

            for depth in depths {
                let currentDepth = Int(depth) ?? 0

                if a == -1 {
                    a = currentDepth
                } else if b == -1 {
                    b = currentDepth
                } else {
                    // Minimum third iteration so sum can be counted
                    c = currentDepth

                    let currentSum = a + b + c

                    if previousSum > -1 && currentSum > previousSum {
                        numberOfIncreases += 1
                    }

                    // Shift values for next loop
                    a = b
                    b = c

                    previousSum = currentSum
                }
            }
        }

        return numberOfIncreases
    }

}

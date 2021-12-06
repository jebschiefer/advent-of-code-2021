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

        if let data = Utility.readFile(name: "day01-input") {
            let depths = data.split(separator: "\n")

            var previousDepth = -1
            var numberOfIncreases = 0

            for depth in depths {
                let currentDepth = Int(depth) ?? 0

                if previousDepth > -1 && currentDepth > previousDepth {
                    numberOfIncreases += 1
                }

                previousDepth = currentDepth
            }

            print("Answer: \(numberOfIncreases)")
        }
    }

}

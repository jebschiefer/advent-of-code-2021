//
//  Day03.swift
//  advent-of-code-2021
//
//  Created by Jeb Schiefer on 12/7/21.
//

import Foundation

class Day03 {

    func run() {
        print("------")
        print("Day 03")

        calculatePowerConsumption(inputFile: "day03-example")
    }

    func calculatePowerConsumption(inputFile: String) {
        if let data = Utility.readFile(name: inputFile) {
            let numbers = data.split(separator: "\n")

            let numberBits = numbers[0].count
            var gamma = ""
            var epsilon = ""

            for index in 0...numberBits - 1 {
                var countZero = 0
                var countOne = 0

                for number in numbers {
                    let char = number[number.index(number.startIndex, offsetBy: index)]

                    if char == "0" {
                        countZero += 1
                    } else if char == "1" {
                        countOne += 1
                    }
                }

                if countZero > countOne {
                    gamma += "0"
                    epsilon += "1"
                } else {
                    gamma += "1"
                    epsilon += "0"
                }
            }

            print("Gamma: \(gamma), Epsilon: \(epsilon)")
        }
    }

}

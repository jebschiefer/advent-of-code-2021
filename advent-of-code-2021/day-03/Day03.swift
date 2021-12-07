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

        var power = calculatePowerConsumption(inputFile: "day03-example")
        print("  Part one example: \(power)")

        power = calculatePowerConsumption(inputFile: "day03-input")
        print("  Part one: \(power)")
    }

    func calculatePowerConsumption(inputFile: String) -> Int {
        if let data = Utility.readFile(name: inputFile) {
            let numbers = data.split(separator: "\n")

            let numberBits = numbers[0].count
            var gammaBinary = ""
            var epsilonBinary = ""

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
                    gammaBinary += "0"
                    epsilonBinary += "1"
                } else {
                    gammaBinary += "1"
                    epsilonBinary += "0"
                }
            }



            let gamma = Int(gammaBinary, radix: 2) ?? 0
            let epsilon = Int(epsilonBinary, radix: 2) ?? 0

//            print("Gamma: \(gammaBinary) (\(gamma)), Epsilon: \(epsilonBinary) (\(epsilon))")

            return gamma * epsilon
        }

        return 0
    }

}

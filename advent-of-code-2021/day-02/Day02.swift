//
//  Day02.swift
//  advent-of-code-2021
//
//  Created by Jeb Schiefer on 12/7/21.
//

import Foundation

class Day02 {

    func run() {
        print("------")
        print("Day 02")

        let partOneExample = move(withAim: false, inputFile: "day02-example")
        print("  Part one example: \(partOneExample.horizontal * partOneExample.depth)")

        let partOne = move(withAim: false, inputFile: "day02-input")
        print("  Part one: \(partOne.horizontal * partOne.depth)")

        let partTwoExample = move(withAim: true, inputFile: "day02-example")
        print("  Part two example: \(partTwoExample.horizontal * partTwoExample.depth)")

        let partTwo = move(withAim: true, inputFile: "day02-input")
        print("  Part two: \(partTwo.horizontal * partTwo.depth)")
    }

    func move(withAim: Bool, inputFile: String) -> (horizontal: Int, depth: Int, aim: Int) {
        var position = (horizontal: 0, depth: 0, aim: 0)

        if let data = Utility.readFile(name: inputFile) {
            let commands = data.split(separator: "\n")

            for command in commands {
                let parts = command.split(separator: " ")
                let movement = parts[0]
                let units = Int(parts[1]) ?? 0

                if withAim {
                    if movement == "forward" {
                        position.horizontal += units
                        position.depth += (position.aim * units)
                    } else if movement == "down" {
                        position.aim += units
                    } else if movement == "up" {
                        position.aim -= units
                    }
                } else {
                    if movement == "forward" {
                        position.horizontal += units
                    } else if movement == "down" {
                        position.depth += units
                    } else if movement == "up" {
                        position.depth -= units
                    }
                }
            }
        }

        return position
    }

}

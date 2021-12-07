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

        let example = move(inputFile: "day02-example")
        print("  Part one example: \(example.horizontal * example.depth)")

        let partOne = move(inputFile: "day02-input")
        print("  Part one: \(partOne.horizontal * partOne.depth)")
    }

    func move(inputFile: String) -> (horizontal: Int, depth: Int) {
        var position = (horizontal: 0, depth: 0)

        if let data = Utility.readFile(name: inputFile) {
            let commands = data.split(separator: "\n")

            for command in commands {
                let parts = command.split(separator: " ")
                let movement = parts[0]
                let units = Int(parts[1]) ?? 0

                if movement == "forward" {
                    position.horizontal += units
                } else if movement == "down" {
                    position.depth += units
                } else if movement == "up" {
                    position.depth -= units
                }
            }
        }

        return position
    }

}

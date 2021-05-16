//
//  main.swift
//  State Pattern
//
//  Created by Ramazan Karami on 5/10/21.
//

import AppKit

let context = Elevator()

context.open()
print("\(context.displayText)\n")

context.close()
print("\(context.displayText)\n")

context.move()
print("\(context.displayText)\n")

context.open()
print("")

context.stop()
print("\(context.displayText)\n")

context.open()
print("\(context.displayText)\n")

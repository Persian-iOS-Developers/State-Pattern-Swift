//
//  main.swift
//  State Pattern
//
//  Created by Ramazan Karami on 5/10/21.
//

import AppKit

enum ElevatorStateEnum {
    case open
    case close
    case move
    case stop
}

enum ElevatorActionButtonEnum {
    case pressOpenButton
    case pressCloseButton
    case pressMoveButton
    case pressStopButton
}

var elevatorState: ElevatorStateEnum = .close
var displayText: String = "Welcome :)"
var playMusic: Bool = false
var lightsColor: NSColor = .green

func action(button: ElevatorActionButtonEnum) {
    
    switch button {
    case .pressOpenButton:
        switch elevatorState {
        case .open:
            print("Already Opened")
            
        case .close:
            print("Open")
            elevatorState = .open
            displayText = "Have a good time ;)"
            playMusic = false
            lightsColor = .blue
            
        case .move:
            print("cannot change state from move to open")
            
        case .stop:
            print("Open")
            elevatorState = .open
            displayText = "Have a good time ;)"
            playMusic = false
            lightsColor = .blue
            
        }
        
    case .pressCloseButton:
        switch elevatorState {
        case .open:
            print("Close")
            elevatorState = .close
            displayText = "Welcome :)"
            playMusic = false
            lightsColor = .green
            
        case .close:
            print("Already Closed")
            
        case .move:
            print("cannot change state from move to close")
            
        case .stop:
            print("Close")
            elevatorState = .close
            displayText = "Welcome :)"
            playMusic = false
            lightsColor = .green
            
        }
        
    case .pressMoveButton:
        switch elevatorState {
        case .open:
            print("cannot change state from open to move")
            
        case .close:
            print("Move")
            elevatorState = .move
            displayText = "The world is beautiful :)"
            playMusic = true
            lightsColor = .green
            
        case .move:
            print("Already Moving")
            
        case .stop:
            print("Move")
            elevatorState = .move
            displayText = "The world is beautiful :)"
            playMusic = true
            lightsColor = .green
            
        }
        
    case .pressStopButton:
        switch elevatorState {
        case .open:
            print("cannot change state from open to stop")
            
        case .close:
            print("cannot change position from close to stop")
            
        case .move:
            print("Stop")
            elevatorState = .stop
            displayText = "We reached our destination"
            playMusic = false
            lightsColor = .blue
            
        case .stop:
            print("Already Stopped")
            
        }
        
    }
}



action(button: .pressOpenButton)
print("\(displayText)\n")

action(button: .pressCloseButton)
print("\(displayText)\n")

action(button: .pressMoveButton)
print("\(displayText)\n")

action(button: .pressOpenButton)
print("")

action(button: .pressStopButton)
print("\(displayText)\n")

action(button: .pressOpenButton)
print("\(displayText)\n")

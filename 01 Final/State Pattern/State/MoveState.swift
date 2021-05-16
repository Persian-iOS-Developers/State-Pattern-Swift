//
//  MoveState.swift
//  State Pattern
//
//  Created by Ramazan Karami on 5/10/21.
//

import AppKit

class MoveState: ElevatorStateProtocol {

    var displayText: String = "The world is beautiful :)"
    var playMusic: Bool = true
    var lightsColor: NSColor = .green

    func pressCloseButton() -> ElevatorStateProtocol? {
        print("cannot change state from move to close")
        return nil
    }

    func pressOpenButton() -> ElevatorStateProtocol? {
        print("cannot change state from move to open")
        return nil
    }

    func pressMoveButton() -> ElevatorStateProtocol? {
        print("Already Moving")
        return nil
    }

    func pressStopButton() -> ElevatorStateProtocol? {
        print("Stop")
        return StopState()
    }
}

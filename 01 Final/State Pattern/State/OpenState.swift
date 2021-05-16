//
//  OpenState.swift
//  State Pattern
//
//  Created by Ramazan Karami on 5/10/21.
//

import AppKit

class OpenState: ElevatorStateProtocol {

    var displayText: String = "Have a good time ;)"
    var playMusic: Bool = false
    var lightsColor: NSColor = .blue

    func pressCloseButton() -> ElevatorStateProtocol? {
        print("Close")
        return CloseState()
    }

    func pressOpenButton() -> ElevatorStateProtocol? {
        print("Already Opened")
        return nil
    }

    func pressMoveButton() -> ElevatorStateProtocol? {
        print("cannot change state from open to move")
        return nil
    }

    func pressStopButton() -> ElevatorStateProtocol? {
        print("cannot change state from open to stop")
        return nil
    }
}

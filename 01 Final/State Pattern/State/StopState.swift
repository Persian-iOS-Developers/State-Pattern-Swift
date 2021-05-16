//
//  StopState.swift
//  State Pattern
//
//  Created by Ramazan Karami on 5/10/21.
//

import AppKit

class StopState: ElevatorStateProtocol {

    var displayText: String = "We reached our destination"
    var playMusic: Bool = false
    var lightsColor: NSColor = .blue

    func pressCloseButton() -> ElevatorStateProtocol? {
        print("Close")
        return CloseState()
    }

    func pressOpenButton() -> ElevatorStateProtocol? {
        print("Open")
        return OpenState()
    }

    func pressMoveButton() -> ElevatorStateProtocol? {
        print("Move")
        return MoveState()
    }

    func pressStopButton() -> ElevatorStateProtocol? {
        print("Already Stopped")
        return nil
    }
}

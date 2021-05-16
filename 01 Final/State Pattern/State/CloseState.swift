//
//  CloseState.swift
//  State Pattern
//
//  Created by Ramazan Karami on 5/10/21.
//

import AppKit

class CloseState: ElevatorStateProtocol {

    var displayText: String = "Welcome :)"
    var playMusic: Bool = false
    var lightsColor: NSColor = .green

    func pressCloseButton() -> ElevatorStateProtocol? {
        print("Already Closed")
        return nil
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
        print("cannot change position from close to stop")
        return nil
    }
}

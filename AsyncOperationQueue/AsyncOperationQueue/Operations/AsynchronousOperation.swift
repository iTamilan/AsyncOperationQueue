//
//  AppDelegate.swift
//  AsyncOperationQueue
//
//  Created by Tamilarasu on 14/04/19.
//  Copyright © 2019 Tamilarasu. All rights reserved.
//

import Foundation

class AsynchronousOperation: Operation {
    override var isAsynchronous: Bool {
        print("Operation \(self.name!) - isAsynchronous")
        return true
    }
    override var isExecuting: Bool {
        print("Operation \(self.name!) - isExecuting")
        return state == .executing
    }
    override var isFinished: Bool {
        print("Operation \(self.name!) - isFinished")
        return state == .finished
    }
    var state = State.ready {
        willSet {
            willChangeValue(forKey: state.keyPath)
            willChangeValue(forKey: newValue.keyPath)
        }
        didSet {
            didChangeValue(forKey: state.keyPath)
            didChangeValue(forKey: oldValue.keyPath)
        }
    }
    enum State: String {
        case ready = "Ready"
        case executing = "Executing"
        case finished = "Finished"
        fileprivate var keyPath: String { return "is" + self.rawValue }
    }
    override func start() {
        print("Operation \(self.name!) - AsynchronousOperation Start function started")
        if self.isCancelled {
            state = .finished
        } else {
            state = .ready
            self.main()
        }
        print("Operation \(self.name!) - AsynchronousOperation start function ended")
    }
    override func main() {
        print("Operation \(self.name!) - AsynchronousOperation Main function started")
        if self.isCancelled {
            state = .finished
        } else {
            state = .executing
        }
        print("Operation \(self.name!) - AsynchronousOperation Main function ended")
    }
}



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
        print("AsynchronousOperation \(self.name!) - isAsynchronous")
        return true
    }
    override var isExecuting: Bool {
        print("AsynchronousOperation \(self.name!) - isExecuting")
        return state == .executing
    }
    override var isFinished: Bool {
        print("AsynchronousOperation \(self.name!) - isFinished")
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
        print("AsynchronousOperation \(self.name!) -  Start function started")
        if self.isCancelled {
            state = .finished
        } else {
            state = .ready
            self.main()
        }
        print("AsynchronousOperation \(self.name!) -  start function ended")
    }
    override func main() {
        print("AsynchronousOperation \(self.name!) -  Main function started")
        if self.isCancelled {
            state = .finished
        } else {
            state = .executing
        }
        print("AsynchronousOperation \(self.name!) -  Main function ended")
    }
}



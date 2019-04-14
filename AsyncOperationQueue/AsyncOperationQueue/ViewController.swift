//
//  ViewController.swift
//  AsyncOperationQueue
//
//  Created by Tamilarasu on 14/04/19.
//  Copyright © 2019 Tamilarasu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let operationQueue = CompletionOperationQueue {
        //This block will execute when each time oerationque got empty
        print("Completed:")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operationQueue.maxConcurrentOperationCount = 3
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addOperation()
    }
    
    func addOperation() {
        print("Before Total operations: \(operationQueue.operationCount)")
        var previousOperation: MyAsyncOperation?
        for index in 1...10 {
            let operation = MyAsyncOperation()
            operation.name = "--\(index)--"
            if let previous = previousOperation {
                operation.addDependency(previous)
            }
            operationQueue.addOperation(operation)
            
            previousOperation = operation
        }
        
        
        print("After Total operations: \(operationQueue.operationCount)")
        //For syncronos we can wait using this method
        //operationQueue.waitUntilAllOperationsAreFinished()
        print("After waiting for opetaions: \(operationQueue.operationCount)")
    }
    
}


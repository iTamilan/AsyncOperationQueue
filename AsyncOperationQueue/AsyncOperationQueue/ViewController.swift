//
//  ViewController.swift
//  AsyncOperationQueue
//
//  Created by Tamilarasu on 14/04/19.
//  Copyright © 2019 Tamilarasu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let asyncOperationQueue = CompletionOperationQueue {
        //This block will execute when each time oerationque got empty
        print("Completed:")
    }
    
    let normalOperationQueue = CompletionOperationQueue {
        //This block will execute when each time oerationque got empty
        print("Completed:")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        normalOperationQueue.maxConcurrentOperationCount = 5
        asyncOperationQueue.maxConcurrentOperationCount = 3
    }
    
    @IBAction func normalOperationTapped(_ sender: Any) {
        addNormalOperation()
    }
    
    @IBAction func asynOperationTapped(_ sender: Any) {
        addAysncOperation()
    }
    
    func addNormalOperation() {
        print("MyNoramlOperation Before Total operations: \(normalOperationQueue.operationCount)")
        var previousOperation: MyNoramlOperation?
        for index in 1...10 {
            let operation = MyNoramlOperation()
            operation.name = "--\(index)--"
            if let previous = previousOperation {
                operation.addDependency(previous)
            }
            normalOperationQueue.addOperation(operation)
            
            previousOperation = operation
        }
        
        
        print("MyNoramlOperationAfter Total operations: \(normalOperationQueue.operationCount)")
        //For syncronos we can wait using this method
        //operationQueue.waitUntilAllOperationsAreFinished()
        print("MyNoramlOperation After waiting for opetaions: \(normalOperationQueue.operationCount)")
    }
    
    
    func addAysncOperation() {
        print("MyAsyncOperation Before Total operations: \(asyncOperationQueue.operationCount)")
        var previousOperation: MyAsyncOperation?
        for index in 1...10 {
            let operation = MyAsyncOperation()
            operation.name = "--\(index)--"
            if let previous = previousOperation {
                operation.addDependency(previous)
            }
            asyncOperationQueue.addOperation(operation)
            
            previousOperation = operation
        }
        
        
        print("MyAsyncOperation After Total operations: \(asyncOperationQueue.operationCount)")
        //For syncronos we can wait using this method
        //operationQueue.waitUntilAllOperationsAreFinished()
        print("MyAsyncOperation After waiting for opetaions: \(asyncOperationQueue.operationCount)")
    }
    
}


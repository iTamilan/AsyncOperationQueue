//
//  AppDelegate.swift
//  AsyncOperationQueue
//
//  Created by Tamilarasu on 14/04/19.
//  Copyright © 2019 Tamilarasu. All rights reserved.
//

import Foundation


class MyAsyncOperation: AsynchronousOperation {
    
    // Created a seperate OperationQueue for AsyncProcess
    lazy var operationQueue: OperationQueue = {
        let opertionQue = OperationQueue()
        opertionQue.qualityOfService = .background
        return opertionQue
    }()
    
    override func main() {
        print("Operation \(self.name!) - MyAsyncOperation Main function started")
        super.main()
        print("Operation \(self.name!) - Called Asyn call inside operation")
        

        //Here write a actual async opeation code
        
        operationQueue.addOperation {
            // Making delay
            sleep(10)
            print("Operation \(self.name!) - Asyn response came")
            print("Operation \(self.name!) - Before setting the state finished")
            
            //Set the state to .finished once your operation completed
            self.state = .finished
            print("Operation \(self.name!) - After setting the state finished")
            
        }
        print("Operation \(self.name!) - MyAsyncOperation Main function ended")
    }
    
}

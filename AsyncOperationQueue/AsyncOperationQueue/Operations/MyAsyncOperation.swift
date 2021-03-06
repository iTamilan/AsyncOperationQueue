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
        print("MyAsyncOperation \(self.name!) -  Main function started")
        super.main()
        print("MyAsyncOperation \(self.name!) - Called Asyn inside operation")
        

        //Here write a actual async opeation code
        
        operationQueue.addOperation {
            // Making delay
            sleep(10)
            print("MyAsyncOperation \(self.name!) - Asyn response came")            
            //Set the state to .finished once your operation completed
            self.state = .finished
            print("MyAsyncOperation \(self.name!) - After setting the state finished")
            
        }
        print("MyAsyncOperation \(self.name!) -  Main function ended")
    }
    
}

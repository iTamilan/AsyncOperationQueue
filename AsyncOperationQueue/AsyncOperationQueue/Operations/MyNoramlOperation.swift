//
//  MyNoramlOperations.swift
//  AsyncOperationQueue
//
//  Created by Tamilarasu on 14/04/19.
//  Copyright © 2019 Tamilarasu. All rights reserved.
//

import Foundation

class MyNoramlOperation: Operation {
    
    // Created a seperate OperationQueue for AsyncProcess
    lazy var operationQueue: OperationQueue = {
        let opertionQue = OperationQueue()
        opertionQue.qualityOfService = .background
        return opertionQue
    }()
    
    override func main() {
        print("NoramlOperation \(self.name!) -  Main function started")
        super.main()
        print("NoramlOperation \(self.name!) - Called Asyn inside operation")
        
        //Here write a actual async opeation code
        
        operationQueue.addOperation {
            // Making delay
            sleep(10)
            print("NoramlOperation \(self.name!) - Asyn response came")
        }
        print("NoramlOperation \(self.name!) -  Main function ended")
    }
    
}

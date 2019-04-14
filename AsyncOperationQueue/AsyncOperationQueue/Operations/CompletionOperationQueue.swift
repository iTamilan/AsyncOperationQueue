//
//  AppDelegate.swift
//  AsyncOperationQueue
//
//  Created by Tamilarasu on 14/04/19.
//  Copyright © 2019 Tamilarasu. All rights reserved.
//

import Foundation

typealias OperationQueueCompletionBlock = () -> Void

class CompletionOperationQueue: OperationQueue {
    
    var completionBlock: OperationQueueCompletionBlock?
    
    init(completionBlock: OperationQueueCompletionBlock? = nil) {
        self.completionBlock = completionBlock
        super.init()
        addObserver(self, forKeyPath: "operationCount", options: NSKeyValueObservingOptions.new, context: .none)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let keyPath = keyPath,
            keyPath == "operationCount",
            operationCount == 0
        {
            completionBlock?()
        }
    }
}

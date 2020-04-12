//
//  Stack.swift
//  MVVM-C
//
//  Created by Tian Tong on 2020/4/10.
//  Copyright © 2020 TTDP. All rights reserved.
//

import Foundation

struct Stack<T> {
    
    private var items = [T]()
    
    public mutating func push(_ item: T) {
        items.append(item)
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    public func peek() -> T? {
        return items.last
    }
    
}

extension Stack: CustomStringConvertible where T == String {
    
    var description: String {
        var stack = "["
        for (index, item) in items.enumerated() {
            var name = item
            
            if let dot = name.firstIndex(of: ".") {
                let range = name.index(after: dot) ..< name.endIndex
                name = String(name[range])
            }
       
            if name.contains("Coordinator") {
                name = String(name.dropLast(11)) // remove "Coordinator"
            }
            
            if index != items.count - 1 {
                stack += name + " -> "
            } else {
                stack += name + "]"
            }
        }
        
        return "\(stack)"
    }
    
}

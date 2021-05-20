//
//  Stack.swift
//  ezPaintIPhone
//
//  Created by ChinMing Kuo on 2021/5/9.
//

import Foundation

struct Stack<Element> {
    private var items = [Element]()
    
    public var count: Int {
        get {
            return items.count
        }
    }
    
    mutating func push(item:Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    mutating func clear() {
        items.removeAll()
    }
    func empty() -> Bool {
        return items.isEmpty
    }
    func peek() ->Element? {
        return items.last
    }
}


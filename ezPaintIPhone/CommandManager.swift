//
//  CommandManager.swift
//  ezPaintIPhone
//
//  Created by ChinMing Kuo on 2021/5/9.
//

import Foundation

class CommandManager {
    var undoStack: Stack<ICommand> = Stack<ICommand>()
    var redoStack: Stack<ICommand> = Stack<ICommand>()
    
    func execute(_ command: ICommand) {
        command.execute()
        undoStack.push(item: command)
        redoStack.clear()
    }
    
    func undo() {
        if undoStack.count > 0 {
            let command = undoStack.pop()
            redoStack.push(item: command)
            command.reverseExecute()
        }
    }
    
    func redo() {
        if redoStack.count > 0 {
            let command = redoStack.pop()
            undoStack.push(item: command)
            command.execute()
        }
    }
}

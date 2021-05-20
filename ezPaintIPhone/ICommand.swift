//
//  ICommand.swift
//  ezPaintIPhone
//
//  Created by ChinMing Kuo on 2021/5/8.
//

import Foundation

protocol ICommand {
    func execute()
    func reverseExecute()
}

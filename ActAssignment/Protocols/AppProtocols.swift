//
//  AppProtocols.swift
//  MahendraTest
// protocols for message passing
//  Created by Mahendra Vishwakarma on 18/10/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import Foundation

// for data update in viewmodel
public protocol PassDataDelegate:class{
    func sendData(data:String)
}

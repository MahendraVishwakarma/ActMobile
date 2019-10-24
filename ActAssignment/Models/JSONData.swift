//
//  JSONData.swift
//  ActAssignment
//
//  Created by Mahendra Vishwakarma on 23/10/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//


import Foundation

// MARK: - Orders
struct Orders: Codable {
    let sales: [Sale]
}

// MARK: - Sale
struct Sale: Codable {
    var prod: String
    var country: String
    var price: Int
}



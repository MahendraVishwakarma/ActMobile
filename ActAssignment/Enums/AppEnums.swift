//
//  AppEnums.swift
//  MahendraTest
//
//  Created by Mahendra Vishwakarma on 23/10/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import Foundation

// generics type
public enum Result<T, U> where U:Error{
    case success(T)
    case failure(U)
}

// custom error
public enum APIError:Error{
    
    case failedRequest(String?)
}

public enum FileType{
    case json
    var value:String{
        switch self{
        case .json: return "json"
        }
    }
}



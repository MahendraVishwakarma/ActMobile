//
//  CommonUtils.swift
//  This class used to fetch data from given json file.
//  Created by Mahendra Vishwakarma on 18/10/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import Foundation

class CommonUtils{
    static let fileName = "input_ios"
    static func fetchJSONData<T:Decodable>(fileName:String,decode:@escaping(Decodable) -> T?,completion: @escaping (Result<T?,APIError>)->()) {
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: FileType.json.value) else {
            // return with failure in case invalid url
            completion(Result.failure(APIError.failedRequest("bad url")))
            return
        }
        
        do {
            // Get data from file
            let data = try Data(contentsOf: fileUrl)
            
            // Decode data to json model
            let dataRecieved = try JSONDecoder().decode(T.self, from: data)
            
            //return with success
            completion(Result.success(dataRecieved))
            
        } catch let error {
            
            //return with failure
            completion(Result.failure(APIError.failedRequest(error.localizedDescription)))
        }
    }
    
}

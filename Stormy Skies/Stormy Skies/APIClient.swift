//
//  APIClient.swift
//  Stormy Skies
//
//  Created by Adam Carter on 8/15/16.
//  Copyright © 2016 Adam Carter. All rights reserved.
//

import Foundation

//added ARC in front to prevent naming collisions, which could come from third pary code I might use or from cocoa frameworks...thanks, objective C
public let ARCNetworkingErrorDomain = "io.adamcarter.StormySkies.NetworkingError"

public let MissingHTTPResponseError: Int = 10

//putting these typealieas's here to make the functions in the protocol below more readable
typealias JSON = [String : AnyObject]
typealias JSONTaskCompletion = (JSON?, NSHTTPURLResponse?, NSError?) -> Void
typealias JSONTask = NSURLSessionDataTask

//making it simple to switch on the result at the call type and know if it was a success or failure and take action depending on which value is returned
enum APIResult<T> {
    case Success(T)
    case Failure(ErrorType)
}

protocol APIClient {
    var configuration: NSURLSessionConfiguration { get }
    var session: NSURLSession { get }
    
    init(config: NSURLSessionConfiguration)
    
    func JSONTaskWithRequest(request: NSURLRequest, completion: JSONTaskCompletion) -> JSONTask
    
    //keeping things generic, because that's good
    func fetch<T>(request: NSURLRequest, parse: JSON -> T?, completion: APIResult<T> -> Void)
}

extension APIClient {
    func JSONTaskWithRequest(request: NSURLRequest, completion: JSONTaskCompletion) -> JSONTask {
        
        let task = session.dataTaskWithRequest(request) { data, response, error in
            
            guard let HTTPResponse = response as? NSHTTPURLResponse else {
                //handling errors
                let userInfo = [
                    NSLocalizedDescriptionKey: NSLocalizedString("Missing HTTP Response", comment: "")
                ]
                
                let error = NSError(domain: ARCNetworkingErrorDomain, code: MissingHTTPResponseError, userInfo: userInfo)
                completion(nil, nil, error)
                return
            }
        }
        
        return task
    }
}







//
//  ApiManager.swift
//  MontrealApp
//
//  Created by Louis-Simon Poulin on 2018-05-05.
//  Copyright © 2018 Louis-Simon Poulin. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

let baseURL = "http://Louis-Simons-MacBook-Pro.local:8888/ProjetFinal/PHP/"
let postActivityEndPoint = "activityControleurJSON.php"

class ApiManager<M:Mappable>{
    
    public func postActivity()-> String{
        return baseURL+postActivityEndPoint;
    }
    
    public func postReturnMappable(urlString:String, param:Dictionary<String, String>, completion: @escaping ( _ mappable:Any) -> ()){
        Alamofire.request(urlString, method: .post, parameters: nil,encoding: JSONEncoding.default, headers: nil).responseJSON {
            response in
            switch response.result {
            case .success:
                print("This is a success")
                guard let value  = response.value else {return}
                print(value as Any)
                
                guard let mappableObject = Mapper<M>().map(JSONObject: value) else{
                    print("Not a mappable")
                    return
                }
                completion(mappableObject)
                return
            case .failure(let error):
                print(error)
            }
        completion(AnyObject.self)
        }
    }
    
    public func postHTTPBodyEncodingReturnMappableArray(urlString:String, param:Dictionary <String, String>, completion: @escaping ( _ mappable:Any) -> ()){
        var request = URLRequest(url: URL(string: self.postActivity())!)
        var httpBody:String = ""
        for key in param.keys {
            httpBody+=key+"="+param[key]!+"&"
        }
        httpBody.removeLast()
        
        request.httpMethod = "POST"
        request.httpBody = httpBody.data(using: String.Encoding.utf8)
        Alamofire.request(request).responseJSON { (response) in
            var mappableObjects:[M] = [M]()
            if( response.result.isSuccess)
            {
                let jsonWithArrayRoot = try? JSONSerialization.jsonObject(with: response.data!, options: [])
                guard let array = jsonWithArrayRoot as? [AnyObject] else { return }
            
                for json in array.dropFirst(){
                    mappableObjects.append(Mapper<M>().map(JSONObject: json)!)
                    }
                }
                completion(mappableObjects)
            }
        completion(AnyClass.self)
        }
    
    }



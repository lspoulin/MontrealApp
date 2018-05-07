//
//  ViewController.swift
//  MontrealApp
//
//  Created by Louis-Simon Poulin on 2018-05-05.
//  Copyright © 2018 Louis-Simon Poulin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiManager = ApiManager<Landmark>()
        let params = ["action": "lister"]
        
        
        apiManager.postHTTPBodyEncodingReturnMappableArray(urlString: apiManager.postActivity(), param: params, completion: display)
    }
    
    func display(myLandmarks:Any?)->(){
        guard let landmarks:[Landmark] = myLandmarks as? [Landmark] else{
            print("No Landmark array")
            return
        }
        for landmark in landmarks{
            print ("\(landmark.title)")
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


//
//  HandelRequest.swift
//  LoginProject
//
//  Created by ismael alali on 27.09.19.
//  Copyright © 2019 ismael alali. All rights reserved.
//

import UIKit

class HandelRequest: UIViewController {
  
    func login(email:String, password:String){
        let defaultConfigration = URLSessionConfiguration.default
        let session = URLSession(configuration: defaultConfigration)
        let url = URL(string: "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCTryhlVmmRHYE7iQT3k0eeNRHIKsTMpRw")!
        var postRequest = URLRequest(url: url)
        postRequest.httpMethod = "POST"
        postRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let dic = ["email": "m@m.at", "password": "madmad", "returnSecureToken":true] as Dictionary
        let jsonData = try! JSONSerialization.data(withJSONObject: dic, options: [])
        postRequest.httpBody = jsonData
        let task = session.dataTask(with: postRequest, completionHandler: {
            (data, response, error) in
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print(dataString)
            }
        })
        task.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

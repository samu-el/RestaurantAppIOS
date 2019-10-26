//
//  CRUD.swift
//  VereEthiopia
//
//  Created by Eyuel on 10/20/19.
//  Copyright © 2019 Med Innovations Addis. All rights reserved.
//

import UIKit
import Alamofire


class LModel {
    static let API_BASE_URL = "http://localhost:8888/api/"
    
    static func getRestaurants(viewController: UIViewController,  onCompletion: @escaping ((_ response: Any?) -> Void)) {
        let url = API_BASE_URL+"Restaurants"
        AF.request(url, method: .get, encoding: JSONEncoding.default).response {
            response in
            if let error = response.error {
                onCompletion(nil)
                print("Network Error", error)
                let message = error.failureReason ?? "Unknown Error Occured"
                let alert = UIAlertController(title: "Network Error", message: message, preferredStyle: .alert)
                viewController.present(alert, animated: true)
                
                // duration in seconds
                let duration: Double = 2
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                    alert.dismiss(animated: true)
                }
            }
            else if let data = response.data {
                onCompletion(data)
            } else {
                onCompletion(nil)
            }
        }
    }
    
    static func getCategories(viewController: UIViewController,  onCompletion: @escaping ((_ response: Any?) -> Void)) {
        let url = API_BASE_URL+"Categories"
        AF.request(url, method: .get, encoding: JSONEncoding.default).response {
            response in
            if let error = response.error {
                let myCache = GenericCache<[Category]>(cacheKey: "category")
                
                if let cache = myCache.get() {
                    onCompletion(cache)
                } else {
                    onCompletion(nil)
                }
                print("Network Error! Showing Cached data", error)
                let message = error.failureReason ?? "Unknown Error Occured"
                let alert = UIAlertController(title: "Network Error", message: message, preferredStyle: .alert)
                viewController.present(alert, animated: true)
                
                // duration in seconds
                let duration: Double = 2
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                    alert.dismiss(animated: true)
                }
            }
            else if let data = response.data {
                do {
                    let cateogries  = try JSONDecoder().decode([Category].self, from: data )
                    //Update the Offline Cache
                    let myCache = GenericCache<[Category]>(cacheKey: "category")
                    try? myCache.set(value: cateogries)
                    onCompletion(cateogries)
                }
                catch let jsonDecoderError {
                    print("JSON Error", jsonDecoderError.localizedDescription )
                    let message =  jsonDecoderError.localizedDescription
                    let alert = UIAlertController(title: "JSON Error", message: message, preferredStyle: .alert)
                    viewController.present(alert, animated: true)
                    
                    // duration in seconds
                    let duration: Double = 2
                    
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                        alert.dismiss(animated: true)
                    }
                    
                    onCompletion(nil)
                }
                
            } else {
                let myCache = GenericCache<[Category]>(cacheKey: "category")
                
                if let cache = myCache.get() {
                    onCompletion(cache)
                } else {
                    onCompletion(nil)
                }
            }
        }
    }
    
    static func login(viewController: UIViewController, email : String, password: String, onCompletion: @escaping ((_ response: Any?) -> Void)) {
        let url = API_BASE_URL+"Users/login?include=User"
        let params = [
            "email":email,
            "password": password
        ]
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).response {
            response in
            switch response.result {
            case .failure:
                onCompletion(nil)
                print("Login Error", response.error?.failureReason ?? "Unknown Error Occured")
                let message = response.error?.failureReason ?? "Unknown Error Occured"
                let alert = UIAlertController(title: "Login Error", message: message, preferredStyle: .alert)
                viewController.present(alert, animated: true)
                
                // duration in seconds
                let duration: Double = 2
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                    alert.dismiss(animated: true)
                }
            case .success:
                if  response.response?.statusCode == 200 {
                    onCompletion(response.data)
                } else {
                    onCompletion(nil)
                    let message = "Please provide the correct email and passowrd"
                    let alert = UIAlertController(title: "Login Failed", message: message, preferredStyle: .alert)
                    viewController.present(alert, animated: true)
                    
                    // duration in seconds
                    let duration: Double = 2
                    
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                        alert.dismiss(animated: true)
                    }
                }
            }
        }
        
    }
}

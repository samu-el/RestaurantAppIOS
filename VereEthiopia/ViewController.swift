//
//  ViewController.swift
//  VereEthiopia
//
//  Created by Eyuel on 10/12/19.
//  Copyright © 2019 Med Innovations Addis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var loginBoxView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Set shadows for our login box view
        loginBoxView.layer.cornerRadius = 0
        loginBoxView.layer.shadowOpacity = 0.2
        loginBoxView.layer.shadowOffset = CGSize(width: 1, height: 2)
        loginBoxView.layer.shadowRadius = 5
        
        loginButton.layer.cornerRadius = 4
        //Hide navigation bar
        if let nav = self.navigationController?.navigationBar {
            nav.isHidden = true
        }
        
        
    }
    
    //MARK: Actions
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            print("STERERE", email, password)
            LModel.login(viewController: self, email: email, password: password) { response in
                if let loginData = response {
                     do {
                           let user  = try JSONDecoder().decode(UserData.self, from: loginData as! Data)
                        UserDefaults.standard.set(user.id, forKey: "AccessToken")
                        UserDefaults.standard.set(user.user?.email, forKey: "email")

                        self.performSegue(withIdentifier: Identifiers.segueFromLoginToRestaurants, sender: nil)
                       }
                       catch let jsonDecoderError {
                           print("JSON Error", jsonDecoderError.localizedDescription )
                          let message =  jsonDecoderError.localizedDescription
                          let alert = UIAlertController(title: "JSON Error", message: message, preferredStyle: .alert)
                          self.present(alert, animated: true)

                          // duration in seconds
                          let duration: Double = 2

                          DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                              alert.dismiss(animated: true)
                          }
                       }
                }
            }
        } else {
            let message = "Please enter email and password!"
            let alert = UIAlertController(title: "Login Error", message: message, preferredStyle: .alert)
            self.present(alert, animated: true)

            // duration in seconds
            let duration: Double = 2

            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                alert.dismiss(animated: true)
            }
        }
    }
    
    
    


}


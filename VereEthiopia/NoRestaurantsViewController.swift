//
//  ViewController.swift
//  VereEthiopia
//
//  Created by Eyuel on 10/12/19.
//  Copyright © 2019 Med Innovations Addis. All rights reserved.
//

import UIKit

class NoRestaurantsViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var appBarUIView: UIView!
    @IBOutlet weak var findRestaurantsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Set Shadows for appbar
        appBarUIView.layer.shadowRadius = 2
        appBarUIView.layer.shadowOffset = CGSize(width: 1, height: 2)
        appBarUIView.layer.shadowOpacity = 0.1
        
        //Set Rounded Corners
        findRestaurantsButton.layer.cornerRadius = 6
        
    }
    
    
    //MARK: Actions
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        if let nav = self.navigationController {
                  nav.popViewController(animated: true)
        }
    }
    
    
    
    @IBAction func findRestaurantsButtonTapped(_ sender: Any) {
    }
    
}


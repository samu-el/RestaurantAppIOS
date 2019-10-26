//
//  SearchViewController.swift
//  VereEthiopia
//
//  Created by Eyuel on 10/13/19.
//  Copyright © 2019 Med Innovations Addis. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK: Properites
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: Actions
    @IBAction func closeButtonTapped(_ sender: Any) {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        }
    }
}

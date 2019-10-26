//
//  RestaurantsListViewController.swift
//  VereEthiopia
//
//  Created by Eyuel on 10/19/19.
//  Copyright © 2019 Med Innovations Addis. All rights reserved.
//

import UIKit
import Kingfisher

class RestaurantsListViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var appBarUIView: UIView!
    @IBOutlet weak var restaurantsTableView: UITableView!
    var restaurantList : [Restaurant] = []
    var response : Any? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Set Shadows for appbar
        appBarUIView.layer.shadowRadius = 2
        appBarUIView.layer.shadowOffset = CGSize(width: 1, height: 2)
        appBarUIView.layer.shadowOpacity = 0.1
        
        //Set delegate and datasource
        restaurantsTableView.delegate = self
        restaurantsTableView.dataSource = self
        
        //init restaurantList
        LModel.getRestaurants(viewController : self) {
            response in
            if let data = response {
                do {
                    self.restaurantList  = try JSONDecoder().decode([Restaurant].self, from: data as! Data)
                    self.restaurantsTableView.reloadData()
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
               
            } else {
                self.performSegue(withIdentifier: Identifiers.segueToNoRestaurants, sender: nil)
            }
        }

    }
    
    
    //MARK: Actions
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        if let nav = self.navigationController {
                  nav.popViewController(animated: true)
        }
    }
    
}

//MARK: - UITableViewDataSource

extension RestaurantsListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: Identifiers.restaurantTableViewCellIdentifier, for: indexPath) as! RestaurantListTableViewCell;
        cell.restaurantNameLabel.text = restaurantList[indexPath.row].name
        cell.ratingLabel.text = "⭐ \(restaurantList[indexPath.row].rating ?? 0.0)"
        cell.distanceLabel.text = "\(restaurantList[indexPath.row].distance ?? 0.0)"
        cell.openningHrsLabel.text = "🕐 \(restaurantList[indexPath.row].opening_hrs?.from ?? "") - \(restaurantList[indexPath.row].opening_hrs?.to ?? "") "
        cell.minLabel.text = "$\(restaurantList[indexPath.row].min_price ?? 0.0)"
        cell.feeLabel.text = "$\(restaurantList[indexPath.row].fee ?? 0.0)"
        cell.tagsLabel.text = restaurantList[indexPath.row].tags?.joined(separator: ", ")
        if let cover = restaurantList[indexPath.row].cover_image {
            let url = URL(string: cover)
             cell.coverImageView.kf.setImage(with: url)
            cell.coverImageView.contentMode = .scaleToFill
        }
        if let logo = restaurantList[indexPath.row].logo {
            let url = URL(string: logo)
             cell.logoImageView?.kf.setImage(with: url)
            cell.logoImageView.contentMode = .scaleToFill

        }
        return cell
    }
    
    
}

//MARK: - UITableViewDelegate

extension RestaurantsListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    }
    
}


//MARK: Private Methods

extension RestaurantsListViewController {
    


}

//
//  RestaurantsViewController.swift
//  VereEthiopia
//
//  Created by Eyuel on 10/26/19.
//  Copyright © 2019 Med Innovations Addis. All rights reserved.
//

import UIKit
import Kingfisher

class RestaurantsViewController: UIViewController {
    
    
    //MARK: - Properties
    @IBOutlet weak var CategoriesCollectionView: UICollectionView!
    @IBOutlet weak var RestaurantsCollectionView: UICollectionView!
    
    var cateogries : [Category] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CategoriesCollectionView.delegate = self
        CategoriesCollectionView.dataSource = self
        
    
        
        // Do any additional setup after loading the view.
        
        //init Categories
               LModel.getCategories(viewController : self) {
                   response in
                   if let data = response {
                           self.cateogries  = data as! [Category]
                            //Update the Offline Cache
                           self.CategoriesCollectionView.reloadData()
                      
                   } else {
                       self.performSegue(withIdentifier: Identifiers.segueToNoRestaurants, sender: nil)
                   }
               }
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
//MARK: - UICollectionViewDelegate
extension RestaurantsViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.CategoriesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.categoriesCollectionViewCellIdentifier, for: indexPath) as! CategoriesCollectionViewCell
            cell.name.text = self.cateogries[indexPath.row].name ?? ""
            let resource = ImageResource(downloadURL: URL(string: self.cateogries[indexPath.row].image ?? "")!, cacheKey: cateogries[indexPath.row].image ??  "")
            cell.image.kf.setImage(with: resource)

              return cell
        }
        else {
           
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.restaurantsCollectionViewCellIdentifier, for: indexPath)
                  return cell

        }
    }
    
    
    
    

}

//MARK: - UICollectionViewDataSource
extension RestaurantsViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cateogries.count
    }
    
}


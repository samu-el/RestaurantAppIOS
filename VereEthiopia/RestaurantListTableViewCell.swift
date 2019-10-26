//
//  RestaurantListTableViewCell.swift
//  VereEthiopia
//
//  Created by Eyuel on 10/19/19.
//  Copyright © 2019 Med Innovations Addis. All rights reserved.
//

import UIKit

class RestaurantListTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantCoverLabel: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var openningHrsLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var feeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var contentViewCard: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

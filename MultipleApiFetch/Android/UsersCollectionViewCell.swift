//
//  UsersCollectionViewCell.swift
//  task1
//
//  Created by Mac on 20/12/1944 Saka.
//

import UIKit

class UsersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.backgroundColor = .gray
        userImage.layer.cornerRadius = 30
        // Initialization code
    }

}

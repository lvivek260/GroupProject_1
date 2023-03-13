//
//  CountryTableViewCell.swift
//  MultipleApiFetch
//
//  Created by Admin on 12/03/23.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var capital: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        flagImage.backgroundColor = .black
        flagImage.layer.borderWidth = 1
        flagImage.layer.cornerRadius = 10
    }

}

//
//  WatchTableViewCell.swift
//  MultipleApiFetch
//
//  Created by Admin on 11/03/23.
//

import UIKit

class WatchTableViewCell: UITableViewCell {

    @IBOutlet weak var watchImage: UIImageView!
    @IBOutlet weak var watchTitle: UILabel!
    
    @IBOutlet weak var watchPrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

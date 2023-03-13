import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

//
//  CartProductDetailViewController.swift
//  MultipleApiFetch
//
//  Created by Admin on 12/03/23.
//

import UIKit

class CartProductDetailViewController: UIViewController {

    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var titlee: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var discountPercentage: UILabel!
    @IBOutlet weak var discountedPrice: UILabel!
    
    var data:Products?
    override func viewDidLoad() {
        super.viewDidLoad()
        id.text = "ID : " + String(data!.id)
        titlee.text = "Title : " + String(data!.title)
        price.text = "Price : " + String(data!.price)
        quantity.text = "Quantity : " + String(data!.quantity)
        total.text = "Total : " + String(data!.title)
        discountPercentage.text = "Discount Percentage : " + String(data!.discountPercentage)
        discountedPrice.text = "Discount Price : " + String(data!.discountedPrice)
    }

}

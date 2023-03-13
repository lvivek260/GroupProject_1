//
//  CartsTableViewCell.swift
//  MultipleApiFetch
//
//  Created by Admin on 12/03/23.
//

import UIKit

class CartsTableViewCell: UITableViewCell {
    var cartVC:UIViewController?
    var products:[Products] = []
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        let nib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        productsCollectionView.register(nib, forCellWithReuseIdentifier: "ProductCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}

extension CartsTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productsCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        let data = products[indexPath.row]
        cell.id.text = String(data.id)
        cell.title.text = data.title
        cell.price.text = String(data.price)
        cell.layer.cornerRadius = 30
        cell.backgroundColor = .systemGray5
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.black.cgColor
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cartProductVC = cartVC?.storyboard?.instantiateViewController(withIdentifier: "CartProductDetailViewController") as! CartProductDetailViewController
        cartProductVC.data = products[indexPath.row]
        cartVC?.navigationController?.pushViewController(cartProductVC, animated: true)
        
    }
}

extension CartsTableViewCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 200
        let height = 225
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    }
}

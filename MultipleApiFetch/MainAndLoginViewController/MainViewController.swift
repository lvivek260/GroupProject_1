//
//  MainViewController.swift
//  MultipleApiFetch
//
//  Created by Admin on 09/03/23.
//
// carts : https://dummyjson.com/carts
// Product : https://dummyjson.com/products
// Android : https://dummyjson.com/users
// Ios : https://reqres.in/api/users?page=2


import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var posterPageControl: UIPageControl!
    @IBOutlet weak var posterCollectionView: UICollectionView!
    @IBOutlet weak var contentCollectionView: UICollectionView!
    
    var content:[Content] = [
        Content(title: "Carts", icon: #imageLiteral(resourceName: "carts")),
        Content(title: "Product", icon: #imageLiteral(resourceName: "products")),
        Content(title: "Android", icon: #imageLiteral(resourceName: "android")),
        Content(title: "Ios", icon: #imageLiteral(resourceName: "ios")),
        Content(title: "Country", icon: #imageLiteral(resourceName: "countries")),
        Content(title: "Watches", icon: #imageLiteral(resourceName: "waches"))
       ]
    var posters:[UIImage] = [#imageLiteral(resourceName: "product") , #imageLiteral(resourceName: "images") , #imageLiteral(resourceName: "ios 1") , #imageLiteral(resourceName: "android 1") , #imageLiteral(resourceName: "cart") , #imageLiteral(resourceName: "country") ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        posterCollectionView.delegate = self
        posterCollectionView.dataSource = self
        contentCollectionView.delegate = self
        contentCollectionView.dataSource = self
        posterPageControl.currentPage = 0
        posterPageControl.numberOfPages = posters.count
        self.navigationItem.backButtonTitle = "Back"
    }
}

extension MainViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == contentCollectionView){
            return content.count
        }
        else{
            return posters.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == contentCollectionView){
           let cell = contentCollectionView.dequeueReusableCell(withReuseIdentifier: "contentCell", for: indexPath) as! ContentCollectionViewCell
            cell.contentTitle.text = content[indexPath.row].title
            cell.contentImage.image = content[indexPath.row].icon
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 2
            cell.layer.cornerRadius = 30
            return cell
        }
        else{
            let cell = posterCollectionView.dequeueReusableCell(withReuseIdentifier: "posterCell", for: indexPath) as! PosterCollectionViewCell
            cell.posterImage.image = posters[indexPath.row]
            cell.posterImage.layer.cornerRadius = 30
            return cell
        }
    }
}

extension MainViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGSize()
        if(collectionView == contentCollectionView){
            let cellWidth = collectionView.frame.width/2-20
            size = CGSize(width: cellWidth, height: cellWidth)
            
        }
        else{
            let cellWidth = self.view.frame.width
            let cellHight = posterCollectionView.frame.height
            size = CGSize(width: cellWidth, height: cellHight)
        }
        return size
    }
    private func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: CGFloat) -> CGFloat {
        var lineSpace:CGFloat = 0
        if(collectionView == contentCollectionView){
            lineSpace = 20
        }
        else{
            print(lineSpace)
        }
        return lineSpace
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if(collectionView == contentCollectionView){
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
        else{
            return UIEdgeInsets()
        }
    }
}

extension MainViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if(collectionView == posterCollectionView){
            posterPageControl.currentPage = indexPath.row
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView == contentCollectionView){
            print(indexPath.row)
            if(indexPath.row == 0){
                let productViewController = self.storyboard?.instantiateViewController(withIdentifier: "CartsViewController") as! CartsViewController
                self.navigationController?.pushViewController(productViewController, animated: true)
            }
            else if(indexPath.row == 1){
                let productViewController = self.storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
                self.navigationController?.pushViewController(productViewController, animated: true)
            }
            else if(indexPath.row == 2){
                let androidViewController = self.storyboard?.instantiateViewController(withIdentifier: "AndroidViewController") as! AndroidViewController
                self.navigationController?.pushViewController(androidViewController, animated: true)
            }
            else if(indexPath.row == 3){
                let iosViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                self.navigationController?.pushViewController(iosViewController, animated: true)
            }
            else if(indexPath.row == 4){
                let countryViewController = self.storyboard?.instantiateViewController(withIdentifier: "CountryViewController") as! CountryViewController
                self.navigationController?.pushViewController(countryViewController, animated: true)
            }
            else if(indexPath.row == 5){
                let watchViewController = self.storyboard?.instantiateViewController(withIdentifier: "WatchViewController") as! WatchViewController
                self.navigationController?.pushViewController(watchViewController, animated: true)
            }
            
        }
    }
}

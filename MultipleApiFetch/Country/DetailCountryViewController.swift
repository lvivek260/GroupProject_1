//
//  DetailCountryViewController.swift
//  MultipleApiFetch
//
//  Created by Admin on 12/03/23.
//

import UIKit

class DetailCountryViewController: UIViewController {

    var data:Country?
    
    @IBOutlet weak var capital: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    
    @IBOutlet weak var currencyCode: UILabel!
    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var currencySymbol: UILabel!
    
    @IBOutlet weak var languageCode: UILabel!
    @IBOutlet weak var languageName: UILabel!
    @IBOutlet weak var languageNativeName: UILabel!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var currencyView: UIView!
    @IBOutlet weak var languageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setcountry()
        setCurrency()
        setLanguage()
        setView()
    }
    func setcountry(){
        flagImage.layer.cornerRadius = 20
        capital.text = data!.capital
        countryName.text = data!.name
        region.text = data!.region
        
        let url = URL(string: data!.flag)
        flagImage.sd_setImage(with: url)
        flagImage.layer.cornerRadius = 20
        flagImage.layer.borderWidth = 2
        flagImage.layer.backgroundColor = UIColor.black.cgColor
    }
    func setCurrency(){
        currencyCode.text = data!.currency.code
        currencyName.text = data!.currency.name
        currencySymbol.text = data!.currency.symbol
    }
    
    func setLanguage(){
        languageCode.text = data!.language.code
        languageName.text = data!.language.name
        languageNativeName.text = data!.language.nativeName
    }
    func setView(){
        headerView.layer.cornerRadius = 30
        currencyView.layer.cornerRadius = 30
        languageView.layer.cornerRadius = 30
    }

}

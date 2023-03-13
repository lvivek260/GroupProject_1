//
//  CountryViewController.swift
//  MultipleApiFetch
//
//  Created by Admin on 12/03/23.
//

import UIKit
import SDWebImage

class CountryViewController: UIViewController {
    @IBOutlet weak var countryTableView: UITableView!
    var country = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTableView.delegate = self
        countryTableView.dataSource = self
        fetchCountryData()
    }

    private func fetchCountryData(){
        guard let fileLocation = Bundle.main.url(forResource: "countryJsonFile", withExtension: "json")
        else{return}
        do{
            let data = try Data( contentsOf: fileLocation)
            let recivedData = try JSONDecoder().decode([Country].self, from: data)
            self.country = recivedData
            DispatchQueue.main.async {
                self.countryTableView.reloadData()
            }
        }
        catch{
            print("Data Not Fetched")
        }
    }

}

extension CountryViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countryTableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        let flagUrl = URL(string: country[indexPath.row].flag)
        cell.flagImage.sd_setImage(with: flagUrl!)
        cell.countryName.text = country[indexPath.row].name
        cell.capital.text = country[indexPath.row].capital
        return cell
    }
}

extension CountryViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let countryDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailCountryViewController") as! DetailCountryViewController
        countryDetailVC.data = country[indexPath.row]
        self.navigationController?.pushViewController(countryDetailVC, animated: true)
    }
}

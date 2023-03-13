//
//  DetailsViewController.swift
//  task1
//
//  Created by Mac on 20/12/1944 Saka.
//

import UIKit

class AndroidDetailsViewController: UIViewController {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    
    var user : AndroidUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValues()
    }
    private func setValues(){
        firstNameLabel.text = "Name: " + user!.firstName + " " + user!.lastName
        emailLabel.text = "Email: " + user!.email
        ageLabel.text = "Age: " + String(user!.age)
        birthDateLabel.text = "BirthDate: " + user!.birthDate
        let url = URL(string: user!.image)
        userImage.sd_setImage(with:url )
        userImage.layer.cornerRadius = 30
    }
}

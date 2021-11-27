//
//  HomeViewController.swift
//  ToDoApp2
//
//  Created by Linder Hassinger on 6/11/21.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStyle()
        getUser()
    }
    
    func setUpStyle() {
        containerView.layer.cornerRadius = 12
        containerView.layer.masksToBounds = true
    }
    
    func getUser() {
        if let user = Auth.auth().currentUser {
            txtName.text = "Hi \(user.email!)"
        }
    }

}

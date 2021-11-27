//
//  ViewController.swift
//  ToDoApp2
//
//  Created by Linder Hassinger on 6/11/21.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

//    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var btnStart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpStyle()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateSession()
    }
    
    func setUpStyle() {
        containerView.layer.cornerRadius = 30
        containerView.layer.masksToBounds = true
        
        btnStart.layer.cornerRadius = 12
        btnStart.layer.masksToBounds = true
    }
    
    
    // Debo crear una funcion que validate si es que tengo una session
    func validateSession() {
        // como obtenemos al usuario actual?
        if let user = Auth.auth().currentUser {
            if user.email != nil {
                // Si existe entonce envialo al home
                performSegue(withIdentifier: "segueHome", sender: nil)
                print("La session ya existe")
            }
        }
    }

}


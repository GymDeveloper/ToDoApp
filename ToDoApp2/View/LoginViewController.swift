//
//  LoginViewController.swift
//  ToDoApp2
//
//  Created by Linder Hassinger on 20/11/21.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnLogin.layer.cornerRadius = 8
        btnLogin.layer.masksToBounds = true
    }
    
    // Una funcion en swift esta compuesta por la palabra func
    func login(email: String, password: String) {
        // De esta forma es como recivo parametros en una func con el nombre de la variable:TipoDeVariable
        // Ahora debemos invocar a FirebaseAuth
        Auth.auth().signIn(withEmail: email, password: password) { resultAuth, error in
            // Devo validar que el error sea null
            // Si el error es nulo entonces todo esta bien
            if error != nil {
                let errorCode = self.handleError(error: error!._code)
                
                if errorCode == "2" {
                    self.signUp(email: email, password: password)
                    return
                }
                // Mandar una alerta indicando el error
                // Aca detecamos que el usario no existe
                self.makeAlert(title: "Error", message: error!.localizedDescription)
            }
            // Debe ir al home
            self.goHome()
        }
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { resultAuth, error in
            if error != nil {
                self.makeAlert(title: "Error", message: error!.localizedDescription)
                return
            }
            // Debe ir al home
            print("Usuario creado")
            self.goHome()
        }
    }
    
    func handleError(error: Int) -> String? {
        if let errorCode = AuthErrorCode(rawValue: error) {
            return errorCode.errorMessage
        }
        return nil
    }
    
    func goHome() {
        // Basicamente nos va a llevar al home
        performSegue(withIdentifier: "segueHome", sender: nil)
    }
    
    func makeAlert(title: String, message: String) {
        // Esto me retornara una alerta
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func onClickLogin(_ sender: Any) {
        // Esto es el click del boton login
        let email = txtEmail.text!
        let password = txtPassword.text!
        login(email: email, password: password)
    }
}

extension AuthErrorCode {
    var errorMessage: String {
        switch self {
        case .emailAlreadyInUse:
            return "1"
        case .userNotFound:
            // Aca debemos crear al un usario
            return "2"
        case .userDisabled:
            return "3"
        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
            return "4"
        case .networkError:
            return "5"
        case .weakPassword:
            return "6"
        case .wrongPassword:
            return "7"
        default:
            return "8"
        }
    }
}

//
//  LoginViewController.swift
//  MyIosApp
//
//  Created by mai on 20.09.2021.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate{

   
    @IBOutlet var Email: UITextField!
    @IBOutlet var Password: UITextField!
    @IBOutlet var LoginButton: UIButton!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Email.delegate = self
        Password.delegate = self
        Email.layer.cornerRadius = 20
        Password.layer.cornerRadius = 20
        LoginButton.layer.cornerRadius = 12
        
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        validateFields()
    }
    
    func validateFields(){
        if Email.text?.isEmpty == true {
            print("No email text")
            return
        }
        if Password.text?.isEmpty == true {
            print("No password")
            return
        }
        
        login()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "signUp")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func login(){
        Auth.auth().signIn(withEmail: Email.text!, password: Password.text!) { [weak self] authResult, err in
            guard let strongSelf = self else {return}
            if let err = err {
                print(err.localizedDescription)
            }
        }
        self.cheackUserInfo()
    }
    
    func cheackUserInfo(){
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let vc = storyboard.instantiateViewController(identifier: "mainHome")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }
    
    
}



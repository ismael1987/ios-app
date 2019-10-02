//
//  ViewController.swift
//  LoginProject
//
//  Created by ismael alali on 13.09.19.
//  Copyright © 2019 ismael alali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        message.isHidden = true
        configrationTextFields()
        loadingShap.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func configrationTextFields(){
        emailText.delegate = self
        passwordText.delegate = self
    }
    
    
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    
    @IBOutlet weak var message: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var loadingShap: UIActivityIndicatorView!
    
    @IBAction func loging(_ sender: Any) {
       
        checkLogin()
        emailText.isEnabled = false
        passwordText.isEnabled = false
        loadingShap.isHidden = false
        loadingShap.startAnimating()
        print("clicked")
        
    }
    
    func checkLogin(){
        let hardemail = "ismael@hotmail.com"
        let hardPassword = "12345"
        message.isHidden = true
        guard let email = emailText.text, !email.isEmpty else {
            message.isHidden = false
            message.text = "Please enter your email"
            return
        }
        
        
        
        if isValidEmail(emailStr:email) == false {
            message.isHidden = false
            message.text = "Please enter valid email address"
        }
        guard let password = passwordText.text, !password.isEmpty
            else {
                message.isHidden = false
                message.text = "Please enter your password"
                return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            // This code executes after 2 seconds
            // Check here if the login was successful
            if email != hardemail || password != hardPassword  {
                self.message.isHidden = false
                self.message.text = "your email or password are Not correct"
                let alert = UIAlertController(title: "Fail", message: "your login is Not Correct", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            self.loadingShap.isHidden = true
            self.emailText.isEnabled = true
            self.passwordText.isEnabled = true
            self.loadingShap.stopAnimating()
            
            let alertController = UIAlertController(title: "Succes", message:
                "your login is Correct", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
       
    }
    
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


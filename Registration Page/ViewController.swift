//
//  ViewController.swift
//  Registration Page
//
//  Created by R95 on 01/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    var arr = [UserData]()
    
    @IBOutlet weak var emailTextFieldOutlet: UITextField!
    
    @IBOutlet weak var passwordTextFieldOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DBHelper.createFile()
        DBHelper.getData()
        arr = DBHelper.userArray
        print(arr)
    }

    
    @IBAction func registationButtonAction(_ sender: Any) {
        DBHelper.addData(email: emailTextFieldOutlet.text ?? "", password: passwordTextFieldOutlet.text ?? "")
    }
    
    
    @IBAction func getDataButtonAction(_ sender: Any) {
        DBHelper.getData()
    }
    
    
    
    @IBAction func loginButton(_ sender: Any) {
        for i in arr {
            if emailTextFieldOutlet.text == i.email && passwordTextFieldOutlet.text == i.password{
                print("dsf")
            }
            else{
                print("Login Failed")
            }
            
        }
        
    }
    
    
    
}


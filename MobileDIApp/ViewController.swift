//
//  ViewController.swift
//  MobileDIApp
//
//  Created by Karthi on 22/11/17.
//  Copyright © 2017 BM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let userNameLocal = "Bhanu"
    let passwordLocal = "Bhanu"
    
    @IBOutlet weak var userName: UITextField! = UITextField()
    @IBOutlet weak var passWord: UITextField! = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logInButton(_ sender: Any) {
        if ((userName.text?.isEqual(userNameLocal))! && (passWord.text?.isEqual(passwordLocal))!){
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let tableVC = storyboard.instantiateViewController(withIdentifier: "TableView") as! loginTableViewController
            self.navigationController?.pushViewController(tableVC, animated: true)
            
            
        }
        else{
            
            let alert = UIAlertController(title: "MobileDi", message: "Login Failed! Please enter the valid credentials", preferredStyle: UIAlertControllerStyle.alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }

    


}


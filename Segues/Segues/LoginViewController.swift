//
//  ViewController.swift
//  Segues
//
//  Created by Israel Torres Alvarado on 09/03/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          
        guard let text = txtEmail.text,
              !text.isEmpty,
              let identifier = segue.identifier,
              identifier.elementsEqual("passwordRecovery"),
              let recoveryPasswordVC = segue.destination as? RecoveryPasswordViewController else {
            
            print("las condiciones no se cumplen..")
            
            return
        
        }
        
        recoveryPasswordVC.email = text
                        
    }
    
}


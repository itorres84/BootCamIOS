//
//  ViewController.swift
//  ProgramtlySegues
//
//  Created by Israel Torres Alvarado on 10/03/21.
//

import UIKit

class LoginViewController: UIViewController {

    private let titleScreen = "Iniciar sesion"
    
    private lazy var txtEmail: UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.placeholder = "Email"
        email.keyboardType = .emailAddress
        email.backgroundColor = UIColor.gray
        return email
    }()
    
    private lazy var txtPassword: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.placeholder = "Contraseña"
        password.keyboardType = .default
        password.isSecureTextEntry = true
        password.backgroundColor = UIColor.gray
        return password
    }()
    
    private lazy var btnSingup: UIButton = {
      
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellow
        button.setTitle("Registrarse", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.addTarget(self, action: #selector(TapButtonAction(_:)), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    private lazy var btnRecoveryPassword: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .yellow
        button.setTitle("Olvidaste tu contraseña", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.addTarget(self, action: #selector(TapButtonAction(_:)), for: .touchUpInside)
        button.tag = 2
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = titleScreen
        
        view.addSubview(txtEmail)
        view.addSubview(txtPassword)
        view.addSubview(btnSingup)
        view.addSubview(btnRecoveryPassword)
        
        addConstraits()
        
    }
    
    func addConstraits() {
        
        let layaout = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            txtEmail.topAnchor.constraint(equalTo: layaout.topAnchor, constant: 100),
            txtEmail.leftAnchor.constraint(equalTo: layaout.leftAnchor),
            txtEmail.rightAnchor.constraint(equalTo: layaout.rightAnchor),
            txtEmail.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            txtPassword.topAnchor.constraint(equalTo: txtEmail.bottomAnchor, constant: 10),
            txtPassword.leftAnchor.constraint(equalTo: layaout.leftAnchor),
            txtPassword.rightAnchor.constraint(equalTo: layaout.rightAnchor),
            txtPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            btnSingup.bottomAnchor.constraint(equalTo: layaout.bottomAnchor, constant: -150),
            btnSingup.leftAnchor.constraint(equalTo: layaout.leftAnchor),
            btnSingup.rightAnchor.constraint(equalTo: layaout.rightAnchor),
            btnSingup.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            btnRecoveryPassword.bottomAnchor.constraint(equalTo: layaout.bottomAnchor, constant: -50),
            btnRecoveryPassword.leftAnchor.constraint(equalTo: layaout.leftAnchor),
            btnRecoveryPassword.rightAnchor.constraint(equalTo: layaout.rightAnchor),
            btnRecoveryPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
        

    }
    
    @objc func TapButtonAction(_ sender: UIButton) {
    
        switch sender.tag {
        case 1:
            navigationController?.show(SingUpViewController(), sender: nil)
        case 2:
            
            let recoveryPasswordVC = RecoveryPasswordViewController()
            //recoveryPasswordVC.modalPresentationStyle = .fullScreen
            
            guard let text = txtEmail.text, !text.isEmpty else {
                print("las condiciones no se cumplen..")
                //navigationController?.show(recoveryPasswordVC, sender: nil)
                
                self.present(recoveryPasswordVC, animated: true, completion: nil)
                return
            }
            
            recoveryPasswordVC.email = text
            self.present(recoveryPasswordVC, animated: true, completion: nil)
//            navigationController?.show(recoveryPasswordVC, sender: nil)
            
            //self.navigationController?.present(recoveryPasswordVC, animated: true, completion: nil)
        
        default:
            break
        }
        
    }

}


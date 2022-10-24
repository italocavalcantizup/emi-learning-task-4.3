//
//  ViewController.swift
//  LearningTask-4.3
//
//  Created by rafael.rollo on 16/02/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    typealias MensagemValidacao = String
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginBotaoPressionado(_ sender: UIButton) {
        
        switch formularioValido() {
        case (false, let mensagemValidacao):
            exibirAlerta(title: "Ops", mensagemValidacao: mensagemValidacao)
        default:
            exibirAlerta(title: "Logando", mensagemValidacao: "Fazendo login na sua conta...")
        }
        
    }
    
    @IBAction func esqueceuSenhaBotaoPressionado(_ sender: UIButton) {
        guard verificaEmailInformado() else {
            exibirAlerta(title: "Ops", mensagemValidacao: "Informe seu email e tente novamente.")
            return
        }
        
        exibirAlerta(title: "Redefinir senha", mensagemValidacao: """
        Enviamos um email para \(emailTextField.text!).
        Siga as instruções para criar uma nova senha segura.
        """)
    }

    func formularioValido() -> (Bool, MensagemValidacao?) {
        
        guard verificaEmailInformado() else {
            return (false, "Email não pode estar em branco.")
        }
        
        if let senha = senhaTextField.text, senha.isEmpty {
            return (false, "Digite sua senha de acesso.")
        }
        
        return (true, nil)
    }
    
    func verificaEmailInformado() -> Bool {
        guard let email = emailTextField.text else { return false }
        return !email.isEmpty
    }
    
    func exibirAlerta(title: String?, mensagemValidacao: MensagemValidacao?) {
        let mensagem = mensagemValidacao ?? "Verifique os dados de acesso e tente novamente."
        
        let alerta = UIAlertController(title: title, message: mensagem, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "Ok", style: .cancel))
        self.present(alerta, animated: true)
    }

}


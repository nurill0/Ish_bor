//
//  SignInController.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 08/02/23.
//

import UIKit

class SignInController: BaseController {
    
    lazy var phoneLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Telefon raqam"
        lbl.textAlignment = .left
        lbl.textColor = .white
        lbl.font = UIFont(name: "Futura", size: 18)
        
        return lbl
    }()
    
    lazy var phoneTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "+998912345678"
        tf.font = UIFont(name: "Futura", size: 20)
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.titleModeColors().cgColor
        tf.backgroundColor = .homeCellBg()
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tf.leftViewMode = .always
        tf.keyboardType = .phonePad
        
        return tf
    }()
    
    lazy var passwordLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Parol"
        lbl.textAlignment = .left
        lbl.textColor = .white
        lbl.font = UIFont(name: "Futura", size: 18)
        
        return lbl
    }()
    
    lazy var passwordTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Parol"
        tf.font = UIFont(name: "Futura", size: 20)
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.titleModeColors().cgColor
        tf.backgroundColor = .homeCellBg()
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tf.leftViewMode = .always
        tf.rightView = UIView(frame: CGRect(x: 0, y: 0, width: -50, height: 0))
        tf.rightViewMode = .always
        tf.keyboardType = .default
        tf.isSecureTextEntry = true
        
        return tf
        
    }()
    
    lazy var enterBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Kirish", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Futura", size: 22)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = .buttonBgColor()
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 1
        btn.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var registerLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Akkauntingiz mavjud emasmi"
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = UIFont(name: "Futura", size: 20)
        
        return lbl
    }()
    
    lazy var registerBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Ro`yxatdan o`tish", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Futura", size: 20)
        btn.titleLabel?.textAlignment = .center
        btn.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        btn.layer.cornerRadius = 10
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 1
        btn.addTarget(self, action: #selector(goSignUp), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var showPasswordBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "eye")?.withTintColor(.titleModeColors()).withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
        
        return btn
    }()
    
    var isHiddenPassword = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
}


extension SignInController {
    
    @objc func goHome(){
        var vc = WorkerHomeController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goSignUp(){
        let vc = SignUpController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func showHidePassword(){
        if isHiddenPassword{
            passwordTF.isSecureTextEntry = false
            showPasswordBtn.setImage(UIImage(named: "hide")?.withTintColor(.titleModeColors()).withRenderingMode(.alwaysOriginal), for: .normal)
            isHiddenPassword = false
        }else{
            passwordTF.isSecureTextEntry = true
            showPasswordBtn.setImage(UIImage(named: "eye")?.withTintColor(.titleModeColors()).withRenderingMode(.alwaysOriginal), for: .normal)
            isHiddenPassword = true
        }
    }
    
}


extension SignInController {
    
    
    fileprivate func configureUI(){
        welcomelblConst()
        phoneTFLblConst()
        phoneTFConst()
        passwordLblConst()
        passwordTFConst()
        welcomelblConst()
        enterBtnConst()
        regiserBtnConst()
        registerLblConst()
        showPasswordBtnConst()
    }
    
    
    fileprivate func welcomelblConst(){
        pageTitleLbl.text = "Akkauntga Kirish"
        baseContainerV.addSubview(pageTitleLbl)
        pageTitleLbl.top(logoImgView.bottomAnchor, 0)
        pageTitleLbl.centerX(baseContainerV.centerXAnchor)
    }
    
    
    fileprivate func phoneTFLblConst(){
        baseContainerV.addSubview(phoneLbl)
        phoneLbl.top(pageTitleLbl.bottomAnchor, 20)
        phoneLbl.left(baseContainerV.leftAnchor, 20)
    }
    
    
    fileprivate func phoneTFConst(){
        baseContainerV.addSubview(phoneTF)
        phoneTF.top(phoneLbl.bottomAnchor, 5)
        phoneTF.left(baseContainerV.leftAnchor, 20)
        phoneTF.right(baseContainerV.rightAnchor, -20)
        phoneTF.height(50)
    }
    
    
    fileprivate func passwordLblConst(){
        baseContainerV.addSubview(passwordLbl)
        passwordLbl.top(phoneTF.bottomAnchor, 20)
        passwordLbl.left(phoneLbl.leftAnchor)
    }
    
    
    fileprivate func passwordTFConst(){
        baseContainerV.addSubview(passwordTF)
        passwordTF.top(passwordLbl.bottomAnchor, 5)
        passwordTF.left(phoneTF.leftAnchor)
        passwordTF.right(phoneTF.rightAnchor)
        passwordTF.height(50)
    }
    
    
    fileprivate func enterBtnConst(){
        baseContainerV.addSubview(enterBtn)
        enterBtn.top(passwordTF.bottomAnchor, 40)
        enterBtn.right(phoneTF.rightAnchor)
        enterBtn.left(phoneTF.leftAnchor)
        enterBtn.height(50)
    }
    
    
    fileprivate func registerLblConst(){
        baseContainerV.addSubview(registerLbl)
        registerLbl.bottom(registerBtn.topAnchor, -10)
        registerLbl.right(baseContainerV.rightAnchor, -10)
        registerLbl.left(baseContainerV.leftAnchor, 10)
    }
    
    
    fileprivate func regiserBtnConst(){
        baseContainerV.addSubview(registerBtn)
        registerBtn.bottom(baseContainerV.bottomAnchor, -25)
        registerBtn.right(baseContainerV.rightAnchor, -20)
        registerBtn.left(baseContainerV.leftAnchor, 20)
        registerBtn.height(50)
    }
    
    
    fileprivate func showPasswordBtnConst(){
        baseContainerV.addSubview(showPasswordBtn)
        showPasswordBtn.right(passwordTF.rightAnchor, -10)
        showPasswordBtn.centerY(passwordTF.centerYAnchor)
        showPasswordBtn.height(30)
        showPasswordBtn.width(30)
    }
    
    
}

//
//  CodeConfirmationController.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 09/02/23.
//

import UIKit

class CodeConfirmationController: BaseController {
    
    lazy var timeCountLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "01:51"
        lbl.textAlignment = .center
        lbl.textColor = .white
        lbl.font = UIFont(name: "Futura-Bold", size: 24)
        
        return lbl
    }()

   
    lazy var codeTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "_ _ _ _ _ _"
        tf.font = UIFont(name: "Futura", size: 20)
        tf.layer.cornerRadius = 10
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.titleModeColors().cgColor
        tf.backgroundColor = .white
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        tf.leftViewMode = .always
        tf.keyboardType = .numberPad
        tf.textAlignment = .center
        tf.delegate = self
        tf.backgroundColor = .homeCellBg()
        
        return tf
    }()

    lazy var confirmBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Tasdiqlash", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Futura", size: 22)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = .buttonBgColor()
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 1
        btn.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        
        return btn
    }()
    
    var userDefaults = UserDefaultsManager.shared
    var delegate: PhoneNumberSend?
  
    @objc func goHome(){
        var vc = UIViewController()
        if userDefaults.getUserType() == "Worker" {
            vc = WorkerHomeController()
        }else {
            vc = EmployerHomeController()
        }
       
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }

}



extension CodeConfirmationController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var name = ""
        delegate?.getPhoneNumber(name)
        configureUI()
        print(name)
    }
    
}



extension CodeConfirmationController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let maxLength = 6
           let currentString = (textField.text ?? "") as NSString
           let newString = currentString.replacingCharacters(in: range, with: string)
           return newString.count <= maxLength
    }
    
}


extension CodeConfirmationController {
    
    
    fileprivate func configureUI(){
        pageTitleLbl.text = "Tasdiqlash kodi"
        timeCountLblConst()
        codeTFConst()
        confirmBtnConst()
    }
    
    
    fileprivate func timeCountLblConst(){
        baseContainerV.addSubview(timeCountLbl)
        timeCountLbl.top(pageTitleLbl.bottomAnchor, 20)
        timeCountLbl.centerX(baseContainerV.centerXAnchor)
    }
    
    fileprivate func codeTFConst(){
        baseContainerV.addSubview(codeTF)
        codeTF.centerY(baseContainerV.centerYAnchor)
        codeTF.right(baseContainerV.rightAnchor, -20)
        codeTF.left(baseContainerV.leftAnchor, 20)
        codeTF.height(50)
    }
    
    
    fileprivate func confirmBtnConst(){
        baseContainerV.addSubview(confirmBtn)
        confirmBtn.top(codeTF.bottomAnchor, 30)
        confirmBtn.right(codeTF.rightAnchor)
        confirmBtn.left(codeTF.leftAnchor)
        confirmBtn.height(50)
    }
    
}

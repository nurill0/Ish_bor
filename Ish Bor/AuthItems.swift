//
//  AuthItems.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 03/04/23.
//


import Foundation
import UIKit


class AuthItems: UIView {
    
    lazy var itemLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Parol"
        lbl.textAlignment = .left
        lbl.textColor = .white
        lbl.font = UIFont(name: "Futura", size: 18)
        
        return lbl
    }()
    
    lazy var itemTF: UITextField = {
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
        tf.keyboardType = .default
        
        return tf
    }()

    lazy var showPasswordBtn: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "eye")?.withTintColor(.titleModeColors()).withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
        
        return btn
    }()
    
    var isHiddenPassword = true

    
    convenience init(label: String,
                     placeHolder: String
    ){
        self.init(frame: .zero)
        self.itemLbl.text = label
        self.itemTF.placeholder = placeHolder
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureUI()
    }
    
    @objc func showHidePassword(){
        if isHiddenPassword{
            itemTF.isSecureTextEntry = false
            showPasswordBtn.setImage(UIImage(named: "hide")?.withTintColor(.titleModeColors()).withRenderingMode(.alwaysOriginal), for: .normal)
            isHiddenPassword = false
        }else{
            itemTF.isSecureTextEntry = true
            showPasswordBtn.setImage(UIImage(named: "eye")?.withTintColor(.titleModeColors()).withRenderingMode(.alwaysOriginal), for: .normal)
            isHiddenPassword = true
        }
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        translatesAutoresizingMaskIntoConstraints = false
        height(80)
    }
    
    private func configureUI(){
        self.addSubview(itemLbl)
        itemLbl.left(self.leftAnchor)
        itemLbl.top(self.topAnchor)
        
        self.addSubview(itemTF)
        itemTF.top(itemLbl.bottomAnchor, 10)
        itemTF.right(self.rightAnchor)
        itemTF.left(self.leftAnchor)
        itemTF.bottom(self.bottomAnchor)
    }
    
}


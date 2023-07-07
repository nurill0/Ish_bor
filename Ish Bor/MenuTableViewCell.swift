//
//  MenuTableViewCell.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 17/02/23.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    
    
    lazy var iconImageV: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "information")
        img.contentMode = .scaleAspectFit
        
        return img
    }()
    
    lazy var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.text = "bla bla"
        lbl.textAlignment = .left
        lbl.textColor = .titleModeColors()
        lbl.font = UIFont(name: "Futura", size: 18)
        
        return lbl
    }()
    
    lazy var darkModeSwitch: UISwitch = {
        let sw = UISwitch()
        sw.translatesAutoresizingMaskIntoConstraints = false
        sw.thumbTintColor = .baseColor()
        sw.onTintColor = .lightGray
        sw.isHidden = true
        sw.addTarget(self, action: #selector(changeMode), for: .valueChanged)
        
        return sw
    }()
    
    static let identifier = "menuTVCell"
    let data = MenuData()
    var rowIndex = 0
    let udManager = UserDefaultsManager.shared
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
      
        if self.traitCollection.userInterfaceStyle == .dark && rowIndex == 4  {
            darkModeSwitch.isOn = true
        }else{
            darkModeSwitch.isOn = false
        }
        configureUI()
    }
    
    @objc func changeMode(){
        let window = UIApplication.shared.windows[0]
            if darkModeSwitch.isOn {
                window.overrideUserInterfaceStyle = .dark
            }else{
                window.overrideUserInterfaceStyle = .light
            }
    }
    
    

    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func getItems(index: Int){
        
      
        
        if index == 4 {
            self.accessoryType = .none
            darkModeSwitch.isHidden = false
        }else {
            darkModeSwitch.isHidden = true
        }
        if index == 8 {
            self.iconImageV.image = UIImage(named: data.getItems(index: index).imgName)?.withTintColor(  #colorLiteral(red: 0.8578212687, green: 0.1048857098, blue: 0.02774109945, alpha: 1), renderingMode: .alwaysOriginal)
            titleLbl.textColor = #colorLiteral(red: 0.8578212687, green: 0.1048857098, blue: 0.02774109945, alpha: 1)
        }else if index == 7{
            self.iconImageV.image = UIImage(named: data.getItems(index: index).imgName)
        }else{
            self.iconImageV.image = UIImage(named: data.getItems(index: index).imgName)?.withTintColor(.titleModeColors(), renderingMode: .alwaysOriginal)
        }
        self.titleLbl.text = data.getItems(index: index).title
    }
    
}



extension MenuTableViewCell {
    
    
    fileprivate func configureUI(){
        iconImgVConst()
        titleLblConst()
        darkModeSwitchConst()
        self.backgroundColor = .homeCellBg()
    }
    
    
    fileprivate func iconImgVConst(){
        self.addSubview(iconImageV)
        iconImageV.left(self.leftAnchor, 10)
        iconImageV.centerY(self.centerYAnchor)
        iconImageV.height(25)
        iconImageV.width(25)
    }
    
    
    fileprivate func titleLblConst(){
        self.addSubview(titleLbl)
        titleLbl.centerY(self.centerYAnchor)
        titleLbl.right(self.rightAnchor)
        titleLbl.left(iconImageV.rightAnchor, 10)
    }
    
    
    fileprivate func darkModeSwitchConst(){
        self.addSubview(darkModeSwitch)
        darkModeSwitch.right(self.rightAnchor, -10)
        darkModeSwitch.centerY(self.centerYAnchor)
        darkModeSwitch.width(50)
    }
    
}

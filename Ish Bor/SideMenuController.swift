//
//  SideMenuController.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 15/02/23.
//

import UIKit
import Kingfisher


class SideMenuController: BaseController {
    
    lazy var userImgView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "user")?.withTintColor(.titleModeColors(), renderingMode: .alwaysOriginal)
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 40
        
        return img
    }()
    
    lazy var imgChangeBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "plus.circle")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        btn.layer.cornerRadius = 15
        btn.backgroundColor = .white
        btn.addTarget(self, action: #selector(changeProfileImage), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var userNameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Nurillo Domlajonov"
        lbl.textAlignment = .left
        lbl.textColor = .titleModeColors()
        lbl.font = UIFont(name: "Futura-Medium", size: 16)
        
        return lbl
    }()
    
    lazy var userPhoneNumLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "+998905459343"
        lbl.textAlignment = .left
        lbl.textColor = .titleModeColors()
        lbl.font = UIFont(name: "Futura", size: 14)
        
        return lbl
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.selectionFollowsFocus = true
        tableView.addBorders(edges: .top, color: .titleModeColors())
        
        return tableView
    }()
    

    lazy var versionLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "version 1.1.0"
        lbl.textAlignment = .center
        lbl.textColor = .titleModeColors()
        lbl.font = UIFont(name: "Futura", size: 14)
        
        return lbl
    }()
    
    let userDM = UserDefaultsManager.shared
    let data = MenuData()
    
}



//view controller life cycle
extension SideMenuController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if userDM.getUserImage() == "" {
            userImgView.image = UIImage(named: "user")?.withTintColor(.titleModeColors(), renderingMode: .alwaysOriginal)
        }else{
            userImgView.kf.setImage(with: URL(string: userDM.getUserImage()))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func reload(collectionView: UICollectionView){
        collectionView.reloadData()
    }
    
}




//tableview delegate + datasource
extension SideMenuController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.getSize()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as! MenuTableViewCell
        cell.getItems(index: indexPath.row)
        cell.selectionStyle = .none
        cell.rowIndex = indexPath.row
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0: print("My Adds")
        case 1: changeMode()
        case 2: goOtherVC(vc: EditProfileController())
        case 3: print("Change language")
        case 4: print("Darkmode")
        case 5: data.goLink(url: data.tutorialLink)
        case 6: goOtherVC(vc: AboutAppController())
        case 7: data.goLink(url: data.errorsLink)
        case 8: print("Logout")
        default: print("Unknown")
        }
    }
    
    
}



///actions
extension SideMenuController {
    
    ///foydalanuvchi rasmini tanlab olish uchun funksiya
    @objc func changeProfileImage(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func changeMode(){
        
        let alert = UIAlertController(title: "Rejimni tanlang", message: "O`zgartirmoqchi bo`lgan rejimni tanlang", preferredStyle: UIAlertController.Style.actionSheet)
        let worker = WorkerHomeController()
        let employer = EmployerHomeController()
    
        alert.addAction(UIAlertAction(title: "Ishchi", style: UIAlertAction.Style.default, handler: { al in
            self.navigationController?.pushViewController(worker, animated: false)
     
        }))
        
        alert.addAction(UIAlertAction(title: "Ish Beruvchi", style: UIAlertAction.Style.default, handler: { al in
            self.navigationController?.pushViewController(employer, animated: false)
        
        }))
        self.present(alert, animated: true,completion: nil)

    }
    
    
    ///boshqa pagega o'tish uchun funksiya
    func goOtherVC(vc: UIViewController){
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
}



//UI
extension SideMenuController {
    
    fileprivate func configureUI(){
        if userDM.getUserImage() == "" {
            userImgView.image = UIImage(named: "user")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        }else{
            userImgView.kf.setImage(with: URL(string: userDM.getUserImage()))
        }
        baseContainerV.backgroundColor = .workPlaceBg()
        view.backgroundColor = .workPlaceBg()
        pageTitleLbl.isHidden = true
        logoImgView.isHidden = true
        userImgVCons()
        userNameLblConst()
        userPhoneNumConst()
        chanImgBtnCons()
        tableViewConst()
        versionLblConst()
    }
    
    
    fileprivate func userImgVCons(){
        baseContainerV.addSubview(userImgView)
        userImgView.top(baseContainerV.safeAreaLayoutGuide.topAnchor, 20)
        userImgView.left(baseContainerV.leftAnchor, 5)
        userImgView.height(80)
        userImgView.width(80)
    }
    
    
    fileprivate func userNameLblConst(){
        baseContainerV.addSubview(userNameLbl)
        userNameLbl.top(userImgView.bottomAnchor, 5)
        userNameLbl.left(baseContainerV.leftAnchor, 10)
        userNameLbl.right(baseContainerV.rightAnchor)
    }
    
    
    fileprivate func userPhoneNumConst(){
        baseContainerV.addSubview(userPhoneNumLbl)
        userPhoneNumLbl.top(userNameLbl.bottomAnchor, 5)
        userPhoneNumLbl.left(userNameLbl.leftAnchor)
        userPhoneNumLbl.right(baseContainerV.rightAnchor)
    }
    
    
    fileprivate func chanImgBtnCons(){
        baseContainerV.addSubview(imgChangeBtn)
        imgChangeBtn.right(userImgView.rightAnchor)
        imgChangeBtn.bottom(userImgView.bottomAnchor)
        imgChangeBtn.height(30)
        imgChangeBtn.width(30)
    }
 
    fileprivate func tableViewConst(){
        baseContainerV.addSubview(tableView)
        tableView.top(userPhoneNumLbl.bottomAnchor, 40)
        tableView.right(baseContainerV.rightAnchor)
        tableView.left(baseContainerV.leftAnchor)
        tableView.bottom(baseContainerV.bottomAnchor)
    }
    
    
    fileprivate func versionLblConst(){
        baseContainerV.addSubview(versionLbl)
        versionLbl.bottom(baseContainerV.bottomAnchor, -20)
        versionLbl.right(baseContainerV.rightAnchor)
        versionLbl.left(baseContainerV.leftAnchor)
    }
    
    
}




//photo edit
extension SideMenuController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true)
        guard let imageUrl = info[.imageURL] as? URL else {
            return
        }
        print("NEW URL: \(imageUrl)")
        userDM.setUserImage(img: "\(imageUrl)")
        userImgView.kf.setImage(with: URL(string: userDM.getUserImage()))
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true )
    }
    
    
}

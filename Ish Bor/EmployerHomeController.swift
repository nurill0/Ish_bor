//
//  EmployerHomeController.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 22/02/23.
//

import UIKit
import SideMenu
class EmployerHomeController: BaseController {
    
    lazy var customNavTitleView: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Salom Nurillo"
        lbl.textAlignment = .center
        lbl.textColor = .titleModeColors()
        lbl.font = UIFont(name: "Futura-Bold", size: 22)
        
        return lbl
    }()
    
    
    lazy var workCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.keyboardDismissMode = .onDrag
        collectionView.register(EmployerCell.self, forCellWithReuseIdentifier: EmployerCell.identifier)
        collectionView.keyboardDismissMode = .onDrag
        
        return collectionView
    }()
    
    
    lazy var createPostBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("E'lon joylash", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Futura", size: 20)
        btn.titleLabel?.textAlignment = .center
        btn.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        btn.layer.cornerRadius = 10
        btn.layer.borderColor = UIColor.white.cgColor
        btn.layer.borderWidth = 1
        btn.addTarget(self, action: #selector(createPost), for: .touchUpInside)
        
        return btn
    }()
 
    let dataWorkers = WorkerData()
    var sideMenu: SideMenuNavigationController?
}



//MARK: View Controller life cycle
extension EmployerHomeController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu")?.withTintColor(.titleModeColors(), renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(openSideMenu))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "chat")?.withTintColor(.titleModeColors(), renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(openChat))
        self.navigationItem.titleView = customNavTitleView

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureSideMenu()
    }
    
    @objc func createPost(){
        let vc = CreateAddVC()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
 
}



extension EmployerHomeController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        let vc = SideMenuController()
        vc.modalPresentationStyle = .formSheet
        navigationController?.pushViewController(vc, animated: true)
    }
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}



//MARK: home page functions and actions
extension EmployerHomeController {
    
    
    ///sidemenu sozlamalari uchun funksiya
    fileprivate func configureSideMenu(){
        let menu = SideMenuController()
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        sideMenu?.menuWidth = (view.frame.width)*0.65
        sideMenu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        sideMenu?.navigationBar.clipsToBounds = true
        sideMenu?.navigationBar.barTintColor = #colorLiteral(red: 0.7175473571, green: 0.2955725491, blue: 0.9618186355, alpha: 1)
    }
    
    ///sidemenu ko'rinishi uchun objc  funksiya
    @objc func openSideMenu(){
        present(sideMenu!, animated: true)
    }
    
    
    @objc func openChat(){
        let vc = ChatVC()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}



extension EmployerHomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataWorkers.getSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dataForWorkerCell = dataWorkers.getItems(index: indexPath.item)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmployerCell.identifier, for: indexPath) as! EmployerCell
        cell.getItemsForCell(job: dataForWorkerCell.job, workerName: dataForWorkerCell.name, workerReyting:"Reyting: \(dataForWorkerCell.rayting)" , workerExperience: "Tajribasi: \(dataForWorkerCell.experience)", workImgName: dataForWorkerCell.imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height*0.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = SelectedWorkerVC()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    }
    
    
}




//MARK: UI Constraints and initializations
extension EmployerHomeController {
    
    
    fileprivate func configureUI(){
        logoImgView.isHidden = true
        pageTitleLbl.isHidden = true
        view.backgroundColor = .workPlaceBg()
        baseContainerV.backgroundColor  = .workPlaceBg()
        seaechBarConst()
        createPostBtnConst()
        collectionViewConst()
    }
    
    
    fileprivate func seaechBarConst(){
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        let textField = searchController.searchBar.searchTextField
        textField.font = UIFont(name: "Futura", size: 18.0)
        textField.placeholder = "Ishchilarni qidiring"
        textField.textColor = .titleModeColors()
        searchController.automaticallyShowsCancelButton = false
        let directionalMargins = NSDirectionalEdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40)
        searchController.searchBar.directionalLayoutMargins = directionalMargins
        searchController.searchBar.delegate = self
        searchController.searchBar.searchBarStyle = .prominent
        self.present(searchController, animated: true, completion: nil)
    }
    
    
    fileprivate func createPostBtnConst(){
        baseContainerV.addSubview(createPostBtn)
        createPostBtn.bottom(baseContainerV.bottomAnchor, -10)
        createPostBtn.right(baseContainerV.rightAnchor, -20)
        createPostBtn.left(baseContainerV.leftAnchor, 20)
        createPostBtn.height(50)
    }
    
    
    fileprivate func collectionViewConst(){
        baseContainerV.addSubview(workCollectionView)
        workCollectionView.top(baseContainerV.safeAreaLayoutGuide.topAnchor)
        workCollectionView.bottom(createPostBtn.topAnchor, -15)
        workCollectionView.right(baseContainerV.rightAnchor)
        workCollectionView.left(baseContainerV.leftAnchor)
    }
    
    
}





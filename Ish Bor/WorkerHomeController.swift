//
//  HomeController.swift
//  Ish Bor
//
//  Created by Nurillo Domlajonov on 11/02/23.
//

import UIKit
import SideMenu

class WorkerHomeController: BaseController {
    
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
        collectionView.register(WorkerWorkCell.self, forCellWithReuseIdentifier: WorkerWorkCell.identifier)
        collectionView.register(EmployerCell.self, forCellWithReuseIdentifier: EmployerCell.identifier)
        
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
        btn.isHidden = true
        
        return btn
    }()
    
    
    var sideMenu: SideMenuNavigationController?
    let udManager = UserDefaultsManager.shared
    let dataWorkers = WorkerData()
    let dataWork = WorkData()
    let refreshControl = UIRefreshControl()
    
}




//MARK: View Controller life cycle
extension WorkerHomeController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu")?.withTintColor(.titleModeColors(), renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(openSideMenu))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "chat")?.withTintColor(.titleModeColors(), renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(openChat))
        self.navigationItem.titleView = customNavTitleView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workCollectionView.reloadData()
        configureSideMenu()
        configureUI()
        print(view.frame.height)
        let timestamp = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .short, timeStyle: .short)
        print(timestamp)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        workCollectionView.addSubview(refreshControl) // not required when using UITableViewController
    }
    
    
}






//MARK: home page functions and actions
extension WorkerHomeController {
    
    
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
    
    
    @objc func refresh(_ sender: AnyObject) {
        workCollectionView.reloadData()
        refreshControl.endRefreshing()
    }
    
    
}


@available(iOS 16.0, *)
extension WorkerHomeController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        
    }
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}



extension WorkerHomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {            return dataWork.getSize()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WorkerWorkCell.identifier, for: indexPath) as! WorkerWorkCell
        let dataForEmployerCell = dataWork.getItems(index: indexPath.item)
        cell.getItemsForCell(job: dataForEmployerCell.job, workTitle: dataForEmployerCell.title, workPrice: dataForEmployerCell.price, workStatus: dataForEmployerCell.status, workImgName: dataForEmployerCell.imageName)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height*0.35)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = SelectedWorkVC()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}




//MARK: UI Constraints and initializations
extension WorkerHomeController {
    
    
    fileprivate func configureUI(){
        logoImgView.isHidden = true
        pageTitleLbl.isHidden = true
        view.backgroundColor = .workPlaceBg()
        baseContainerV.backgroundColor  = .workPlaceBg()
        seaechBarConst()
        collectionViewConst()
    }
    
    
    fileprivate func seaechBarConst(){
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = false
        let textField = searchController.searchBar.searchTextField
        textField.font = UIFont(name: "Futura", size: 18.0)
        textField.placeholder = "Ishlarni qidiring"
        textField.textColor = .titleModeColors()
        searchController.automaticallyShowsCancelButton = false
        self.present(searchController, animated: true, completion: nil)
    }

    
    fileprivate func collectionViewConst(){
        baseContainerV.addSubview(workCollectionView)
        baseContainerV.sendSubviewToBack(workCollectionView)
        workCollectionView.top(baseContainerV.safeAreaLayoutGuide.topAnchor, 5)
        workCollectionView.right(baseContainerV.rightAnchor)
        workCollectionView.left(baseContainerV.leftAnchor)
        workCollectionView.bottom(baseContainerV.bottomAnchor)
    }
    
    
}

//
//  UserProfileViewController.swift
//  Assesment
//
//  Created by Joseph on 22/01/2022.
//

import UIKit

// MARK: - Master Display Protocol
protocol UserProfileDisplayLogic: AnyObject {
    func displayUserProfile(viewData: UserProfileViewController.UserProfile.ViewData)
    func displayError(errorString: String)
    
}

// MARK: - Master ViewController
class UserProfileViewController: UIViewController {
    
    // MARK: - Properties
    var interactor: UserProfileInteractorProtocol?
    weak var router: UserProfileRouter?
    var viewData: UserProfile.ViewData?
    var tableHeaderView: ProfileHeaderView?
    
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            let nib = UINib.init(nibName: "UserProfileTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: UserProfileTableViewCell.identifier)
        }
    }
    
    // MARK: - Models
    enum UserProfile {
        
        struct ViewData {
            let name: String
            let image: String
            let section: Section
            
        }
        
        struct Section {
                        
            let title: String
            let rows: [Row]
            
            var count: Int {
                return rows.count
            }
            
            subscript(_ index: Int) -> Row {
                return rows[index]
            }
        }
        
        struct Row {
            var profileCellData: UserProfileTableViewCell.ViewData?
            
        }

    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.viewDidLoad()
    }
    
    // MARK: - Helping Methods
    
    private func setHeaderView() {
        guard let _viewData = viewData else { return }
        let headerView = ProfileHeaderView.init(frame: .init(x: 0, y: 0, width: tableView.frame.width, height: 230))
        headerView.configure(with: .init(name: _viewData.name, image: _viewData.image))
        tableView.tableHeaderView = headerView
        tableView.tableHeaderView?.frame.size.height = 230
        
        
        let footerView = UIView()
        let viewPurchasesButton = UIButton(type: .custom)
        
        viewPurchasesButton.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(viewPurchasesButton)
        
        viewPurchasesButton.setTitleColor(.white, for: .normal)
        viewPurchasesButton.setTitle("View Purchases", for: .normal)
        viewPurchasesButton.backgroundColor = UIColor.init(red: 0.230, green: 0.512, blue: 0.969, alpha: 1.0)
        viewPurchasesButton.layer.cornerRadius = 22
        viewPurchasesButton.addTarget(self, action: #selector(self.viewPurchasesAction(sender:)), for: .touchUpInside)

        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.backgroundColor = .clear
        tableView.tableFooterView  = footerView
        
        NSLayoutConstraint.activate( [
            viewPurchasesButton.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 32),
            viewPurchasesButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -32),
            viewPurchasesButton.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: -44),
            viewPurchasesButton.heightAnchor.constraint(equalToConstant: 44),
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 160)
        ])
        
        tableView.tableFooterView?.layoutIfNeeded()
    }
    
    private func set(viewData: UserProfile.ViewData) {
        self.viewData = viewData
    }
    
    //MARK: - Actions
    
    @objc func viewPurchasesAction(sender: UIButton) {
        router?.showPurchases(vc: self)
    }
}

// MARK: - UITableViewDelegate
extension UserProfileViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension UserProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewData?.section.rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let _viewData = viewData, indexPath.row < _viewData.section.rows.count  else { return UITableViewCell() }
        
        let section = _viewData.section
        let row = section.rows[indexPath.row]
        
        let cell: UserProfileTableViewCell = tableView.dequeueReusableCell(withIdentifier: UserProfileTableViewCell.identifier, for: indexPath) as! UserProfileTableViewCell
        cell.configure(with: row.profileCellData!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let _viewData = viewData else { return nil }
        let section = _viewData.section
        return section.title
    }
    
}

// MARK: - Master Display delegates
extension UserProfileViewController: UserProfileDisplayLogic {
    func displayUserProfile(viewData: UserProfileViewController.UserProfile.ViewData) {
        self.set(viewData: viewData)
        DispatchQueue.main.async {
            self.setHeaderView()
            self.tableView.reloadData()
        }
    }
    
    func displayError(errorString: String) {
        
    }

}

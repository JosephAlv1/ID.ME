//
//  PurchasesViewController.swift
//  Assesment
//
//  Created by Joseph on 23/01/2022.
//

import UIKit

// MARK: - Purchases Display Protocol
protocol PurchasesDisplayLogic: AnyObject {
    func displayPurchases(viewData: PurchasesViewController.Purchases.ViewData)
    func displayError(errorString: String)
    
}

// MARK: - Purchases ViewController
class PurchasesViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            let nib = UINib.init(nibName: "PurchasesTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: PurchasesTableViewCell.identifier)
        }
    }
    
    // MARK: - Properties
    var interactor: PurchasesInteractorProtocol?
    var router: PurchasesRouter?
    var viewData: Purchases.ViewData = Purchases.ViewData.init(section: .init(rows: [Purchases.Row]()))
    
    
    // MARK: - Models
    enum Purchases {
        
        struct ViewData {
            var section: Section
        }
        
        struct Section {
                        
            var rows: [Row]
            
            var count: Int {
                return rows.count
            }
            
            subscript(_ index: Int) -> Row {
                return rows[index]
            }
        }
        
        struct Row {
            var purchaseCellData: PurchasesTableViewCell.ViewData?
        }

    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        interactor?.viewDidLoad()
    }
    
    // MARK: - Helping Methods
    
    private func setUpNavigationBar() {
        
        // Setting title, title text color and font of navigation bar
        self.title = "Purchases"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 22), NSAttributedString.Key.foregroundColor: UIColor.black]
        
        // Settings tint color of navigation bar
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
        // remove text from back button of navigation bar
        self.navigationController?.navigationBar.topItem?.title = " "
        
        
        // Settings Info icon to right side of navigation bar
        let infoButton = UIButton(type: .custom)
        infoButton.tintColor = .black
        infoButton.setImage(UIImage(named: "infoIcon"), for: .normal)
        infoButton.addTarget(self, action: #selector(self.infoButtonAction(sender:)), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: infoButton)
    }
    
    // MARK: - Actions
    @objc func infoButtonAction(sender: UIButton) {
        router?.showHistory(vc: self)
    }
}

// MARK: - UITableViewDelegate
extension PurchasesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let isActive = !(self.viewData.section.rows[indexPath.row].purchaseCellData?.isActive ?? false)
        self.viewData.section.rows[indexPath.row].purchaseCellData?.isActive = isActive
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}

// MARK: - UITableViewDataSource
extension PurchasesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        guard indexPath.row < viewData.section.rows.count  else { return 64 }
        let section = viewData.section
        let row = section.rows[indexPath.row]
        if row.purchaseCellData?.isActive ?? false == true {
            return UITableView.automaticDimension
        }
        return 74
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewData.section.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard indexPath.row < viewData.section.rows.count  else { return UITableViewCell() }

        let section = viewData.section
        let row = section.rows[indexPath.row]

        let cell: PurchasesTableViewCell = tableView.dequeueReusableCell(withIdentifier: PurchasesTableViewCell.identifier, for: indexPath) as! PurchasesTableViewCell
        cell.configure(with: row.purchaseCellData!)
        return cell
    }
}

// MARK: - Purchases Display delegates
extension PurchasesViewController: PurchasesDisplayLogic {
    
    func displayPurchases(viewData: PurchasesViewController.Purchases.ViewData) {

        DispatchQueue.main.async {
            let rows = viewData.section.rows
            let count = self.viewData.section.rows.count
            self.viewData.section.rows.append(contentsOf: rows)
            var indexPaths: [IndexPath] = []
            for (index, _) in rows.enumerated() { indexPaths.append(.init(row: count + index, section: 0)) }
            self.tableView.insertRows(at: indexPaths, with: .automatic)
        }
    }
    
    func displayError(errorString: String) {
        
    }

}


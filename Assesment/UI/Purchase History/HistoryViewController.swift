//
//  HistoryViewController.swift
//  Assesment
//
//  Created by Joseph on 24/01/2022.
//

import UIKit

// MARK: - History Display Protocol
protocol HistoryDisplayLogic: AnyObject {
    func displayHistory(viewData: HistoryViewController.History.ViewData)
}

// MARK: - History ViewController
class HistoryViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var historyTextView: UITextView!
    
    // MARK: - Properties
    var interactor: HistoryInteractorProtocol?
    var router: HistoryRouter?
    var viewData: History.ViewData?
    
    
    // MARK: - Models
    enum History {
        
        struct ViewData {
            var historyDetail: String
        }

    }
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.viewDidLoad()
    }
    
    // MARK: - Helping Methods
    
    func set(viewData: History.ViewData) {
        self.viewData = viewData
    }
    
    // MARK: - Actions
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
    }
    
}

// MARK: - History Display delegates
extension HistoryViewController: HistoryDisplayLogic {
    
    func displayHistory(viewData: HistoryViewController.History.ViewData) {
        self.set(viewData: viewData)
        historyTextView.text = viewData.historyDetail
    }

}

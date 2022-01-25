//
//  PurchasesTableViewCell.swift
//  Assesment
//
//  Created by Joseph on 23/01/2022.
//

import UIKit
import SDWebImage

class PurchasesTableViewCell: UITableViewCell {

    // MARK: - IBOutlet
    @IBOutlet private weak var itemNameLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var serialNumberLabel: UILabel!
    @IBOutlet private weak var descriptionTitleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet weak var collapseableStackView: UIStackView!
    @IBOutlet private weak var itemImageView: UIImageView! {
        didSet {
            itemImageView.layer.cornerRadius = itemImageView.frame.width / 2
        }
    }
    // MARK: - Properties
    
    static var identifier: String = "PurchasesTableViewCell"
    
    struct ViewData {
        let image: String?
        let purchaseDate, itemName, price, serial: String?
        let feedDescription: String?
        var isActive: Bool = false
    }

    // MARK: - Lifecycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Helping Methods
    func configure(with viewData: ViewData) {
        
        self.collapseableStackView.isHidden = !viewData.isActive
        
        self.itemNameLabel.text = viewData.itemName
        self.dateLabel.text = viewData.purchaseDate?.getGMTDate?.localDate
        self.priceLabel.text = "$\(viewData.price ?? "")"
        self.serialNumberLabel.text = "Serial: \(viewData.serial ?? "")"
        self.descriptionTitleLabel.text = "Description:"
        self.descriptionLabel.text = viewData.feedDescription
        self.itemImageView.sd_setImage(with: URL.init(string: viewData.image ?? "")) { image, error, chache, url in
            
        }
    }

    
}

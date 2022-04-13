//
//  MyTableViewCell.swift
//  Cryptohelper
//
//  Created by Алексей Каземиров on 4/12/22.
//

import UIKit

struct CryptoTableViewCellViewModel {
    let name: String
    let symbol: String
    let price: String
    let logoUrl: String
}

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        logoImage.image = nil
        nameLabel.text = nil
        priceLabel.text = nil
        symbolLabel.text = nil
    }
    
    static let identifier = "CryptoTableViewCell"
    
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        nameLabel.text = viewModel.name
        symbolLabel.text = viewModel.symbol
        priceLabel.text = viewModel.price
        if let url = URL(string: "https://cryptoicons.org/api/icon/\(viewModel.symbol.lowercased())/50") {
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                if let data = data {
                    DispatchQueue.main.async {
                        self?.logoImage.image = UIImage(data: data)
                    }
                }
            }
            task.resume()
        }
    }
    

}

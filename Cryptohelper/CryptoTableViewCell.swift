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
    let current_price: Double
    let image: String
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
        symbolLabel.text = viewModel.symbol.uppercased()
        priceLabel.text = String(viewModel.current_price)
        if let url = URL(string: "\(viewModel.image)"/*"https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png"*/ ) {
        /*"https://cryptoicons.org/api/icon/\(viewModel.symbol.lowercased())/200") {*/
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

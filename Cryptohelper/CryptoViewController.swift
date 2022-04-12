//
//  ViewController.swift
//  Cryptohelper
//
//  Created by Алексей Каземиров on 4/12/22.
//

import UIKit

class CryptoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = [CryptoTableViewCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NomicsAPICaller.shared.getAllCryptoData { [weak self] result in
            switch result {
            case .success(let models):
                print(models.count)
                self?.viewModel = models.compactMap({ CryptoTableViewCellViewModel(name: $0.name ?? "", symbol: $0.symbol ?? "", price: $0.price ?? "")
                })
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                //print("Элемент №1 в списке - \(models[0].name!), цена - \(models[0].price!)")
            case .failure(let error):
                print("bad request")
            }
        }
    }

}

extension CryptoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier, for: indexPath) as? CryptoTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModel[indexPath.row])
        return cell
    }

    
}

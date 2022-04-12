//
//  APICaller.swift
//  Cryptohelper
//
//  Created by Алексей Каземиров on 4/12/22.
//

import Foundation

final class NomicsAPICaller {
    
    static let shared = NomicsAPICaller()
    
    var top10 = [Crypto]()
    
    private struct Constants {
        static let apiKey = "65d826b99ad9177574292332ff03b21ca80d24b6"
        static let assetsEndPoint = "https://api.nomics.com/v1/currencies/"
    }
    
    private init() {
        
    }
    
    public func getAllCryptoData(completion: @escaping (Result<[Crypto], Error>) -> Void) {
        guard let url = URL(string: Constants.assetsEndPoint + "ticker?key=" + Constants.apiKey + "&ids=BTC,ETH,XRP&interval=1h,30d&convert=USD&platform-currency=ETH&per-page=100&page=1" ) else {
            return
            /*curl "https://api.nomics.com/v1/currencies/ticker?key=your-key-here&ids=BTC,ETH,XRP&interval=1d,30d&convert=EUR&platform-currency=ETH&per-page=100&page=1" */
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let jsonResult = try JSONDecoder().decode([Crypto].self, from: data)
                completion(.success(jsonResult))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

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
        static let apiKey = "57d23447c189607759103d4bddb577e6d0085189"//"dbc8eae8-a918-4560-8fe0-3528bd4965d9"//
        
        static let assetsEndPoint = "https://api.coingecko.com/api/v3/coins/" //"https://api.nomics.com/v1/currencies/"//"https://pro-api.coinmarketcap.com"//
    }
    
    private init() {
        
    }
    
    public func getAllCryptoData(completion: @escaping (Result<[Crypto], Error>) -> Void) {
        //url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin"
        guard let url = URL(string: Constants.assetsEndPoint +  "markets?vs_currency=usd")//&ids=bitcoin
                //URL(string: Constants.assetsEndPoint + "ticker?key=" + Constants.apiKey + "&ids=BTC,ETH,XRP&interval=1h,1d&convert=USD&platform-currency=ETH&per-page=50&page=1" )
        else {
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

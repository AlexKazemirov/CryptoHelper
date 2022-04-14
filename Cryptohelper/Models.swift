//
//  Models.swift
//  Cryptohelper
//
//  Created by Алексей Каземиров on 4/12/22.
//

import Foundation

struct Crypto: Codable {
    let id: String?
    let current_price: Double?
    let symbol: String?
    let name: String?
    let image: String?
}

/*
MARK: coingecko exchange
 {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 41265,
     "market_cap": 783581457904,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 865552949280,
     "total_volume": 26008038598,
     "high_24h": 41523,
     "low_24h": 39765,
     "price_change_24h": 1023.99,
     "price_change_percentage_24h": 2.54461,
     "market_cap_change_24h": 21522700391,
     "market_cap_change_percentage_24h": 2.82428,
     "circulating_supply": 19011212,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 69045,
     "ath_change_percentage": -40.30423,
     "ath_date": "2021-11-10T14:24:11.849Z",
     "atl": 67.81,
     "atl_change_percentage": 60683.68227,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2022-04-14T07:26:08.167Z"
   }
 
 
 
 
 
 /MARK: NOMICS EXchange [
  {
    "currency": "BTC",
    "id": "BTC",
    "status": "active",
    "price": "8451.36516421",
    "price_date": "2019-06-14T00:00:00Z",
    "price_timestamp": "2019-06-14T12:35:00Z",
    "symbol": "BTC",
    "circulating_supply": "17758462",
    "max_supply": "21000000",
    "name": "Bitcoin",
    "logo_url": "https://s3.us-east-2.amazonaws.com/nomics-api/static/images/currencies/btc.svg",
    "market_cap": "150083247116.70",
    "market_cap_dominance": "0.4080",
    "transparent_market_cap": "150003247116.70",
    "num_exchanges": "357",
    "num_pairs": "42118",
    "num_pairs_unmapped": "4591",
    "first_candle": "2011-08-18T00:00:00Z",
    "first_trade": "2011-08-18T00:00:00Z",
    "first_order_book": "2017-01-06T00:00:00Z",
    "first_priced_at": "2017-08-18T18:22:19Z",
    "rank": "1",
    "rank_delta": "0",
    "high": "19404.81116899",
    "high_timestamp": "2017-12-16",
    "1d": {
      "price_change": "269.75208019",
      "price_change_pct": "0.03297053",
      "volume": "1110989572.04",
      "volume_change": "-24130098.49",
      "volume_change_pct": "-0.02",
      "market_cap_change": "4805518049.63",
      "market_cap_change_pct": "0.03",
      "transparent_market_cap_change": "4800518049.00",
      "transparent_market_cap_change_pct": "0.0430",
      "volume_transparency": [
        {
          "grade": "A",
          "volume": "2144455081.37",
          "volume_change": "-235524941.08",
          "volume_change_pct": "-0.10"
        },
        {
          "grade": "B",
          "volume": "15856762.85",
          "volume_change": "-6854329.88",
          "volume_change_pct": "-0.30"
        }
      ]
    }
  }
]
*/

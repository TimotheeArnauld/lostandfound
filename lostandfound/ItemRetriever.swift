//
//  ItemRetriever.swift
//  TPnote
//
//  //

import Foundation

typealias RetrieveItemsBlock = (Dictionary<String, AnyObject>?, Error?) -> Void

class ItemRetriever: NSObject {
    //static let shortURL: String = "https://goo.gl/Lc2SGW"
    static let BASE_URL: String = "https://ressources.data.sncf.com/api/records/1.0/search/?dataset=objets-trouves-gares"
    //static let CLIENT_ID: String = "AIKFQQCBBDHHP1D32I4YWAIFNYB0U2MKPABW2IZ0LM1N30HI"
    //static let CLIENT_SECRET: String = "XEHYYUEY15ITRUFKGVRRCNYSW3ZYWBXOEPOVA3XM1OIN0AIN"
    //static let VALUE: String = "20170811"
    
    func getItems(block: @escaping RetrieveItemsBlock, name: String, location: String) {
        let completeURL: String = ItemRetriever.BASE_URL;
        
        
        let itemUrl = URL(string: completeURL)
        let task: URLSessionDataTask = URLSession.shared.dataTask(with: itemUrl!, completionHandler: {
            (data: Data?, response: URLResponse?, error: Error?) in
            if (error != nil) {
                block(nil, error)
            } else if (data != nil) {
                do {
                    let itemList = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! Dictionary<String, AnyObject>
                    block(itemList, nil)
                } catch let errorEx {
                    block(nil, errorEx)
                }
            }
        })
        task.resume()
    }
}

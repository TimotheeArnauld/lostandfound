import Foundation

typealias RetrieveItemsBlock = (Dictionary<String, AnyObject>?, Error?) -> Void

class ItemRetriever: NSObject {
    static let BASE_URL: String = "https://ressources.data.sncf.com/api/records/1.0/search/?dataset=objets-trouves-gares"
    
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

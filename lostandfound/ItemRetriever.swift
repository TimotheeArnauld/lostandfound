import Foundation

typealias RetrieveItemsBlock = (Dictionary<String, AnyObject>?, Error?) -> Void

class ItemRetriever: NSObject {
    static let BASE_URL: String = "https://ressources.data.sncf.com/api/records/1.0/search/?dataset=objets-trouves-gares&rows=100&sort=date"
    
    static let filter = "&facet=gc_obo_gare_origine_r_name&refine.gc_obo_gare_origine_r_name="
    
    func getItems(block: @escaping RetrieveItemsBlock, station: String){
        var completeURL : String
        
        if(station == ""){
            completeURL = ItemRetriever.BASE_URL;
        }
        else{
            completeURL = ItemRetriever.BASE_URL + ItemRetriever.filter + station;
        }
        NSLog(completeURL)
        
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

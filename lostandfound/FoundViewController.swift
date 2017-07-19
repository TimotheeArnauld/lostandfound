//
//  FoundViewController.swift
//  lostandfound
//
//  Created by Timothée Arnauld on 19/07/2017.
//  Copyright © 2017 Lost And Found. All rights reserved.
//

import UIKit

class FoundViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBarDate: UISearchBar!
    
    @IBOutlet weak var searchBarGare: UISearchBar!
    
    var list: [Item] = []
    var station: String = ""
    let itemRetreiver: ItemRetriever = ItemRetriever()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.trainstation.delegate = self
        
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "itemCell")
        getItems()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.station = searchText.replacingOccurrences(of: " ", with: "+")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        getItems()
    }
    
    func getItems() {
        itemRetreiver.getItems(block: { (itemList, error) in
            if(itemList != nil) {
                self.list = []
                let obj: AnyObject = itemList!["records"]!
                //let result: AnyObject = obj["fields"] as AnyObject
                
                if(!obj .isKind(of: NSNull.classForCoder())) {
                    let records: Array = (obj as! NSArray) as Array
                    
                    records.forEach({ (object: AnyObject) in
                        let item: Item = Item(object: object)
                        self.list.append(item)
                    })
                }
                
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
            }
        }, station: self.station)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier:"itemCell")
        
        cell.detailTextLabel?.text = self.list[indexPath.row].gare
        cell.textLabel?.text = self.list[indexPath.row].nature
        cell.imageView?.image = UIImage(named: "Image")
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.list[indexPath.row]
        let itemController = ItemViewController(nibName: "ItemViewController", bundle: nil, item: item)
        
        self.navigationController?.pushViewController(itemController, animated: true)
    }
}

//
//  ItemViewController.swift
//  lostandfound
//
//  Created by Yousria Benchadi on 20/07/2017.
//  Copyright © 2017 Lost And Found. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var gareLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var codeGareLabel: UILabel!
    
    var item: Item
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, item: Item) {
        self.item = item
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gareLabel.text = item.gare
        self.dateLabel.text = item.date
        self.typeLabel.text = item.type
        self.codeGareLabel.text = item.codeGare
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

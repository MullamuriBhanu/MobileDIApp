//
//  loginTableViewController.swift
//  MobileDISample
//
//  Created by Karthi on 22/11/17.
//  Copyright © 2017 BM. All rights reserved.
//

import UIKit

class loginTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewData: UITableView!
    var dataAray : [String] = []
    
    var dataDict : Dictionary = [String:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.parseData(url:"https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/mealplans/generate")

    }
    
    func parseData(url:String){
        
        let urlString = "https://api.backendless.com/v1/data/Pub"
        let session = URLSession.shared
        let url = NSURL(string: urlString)!
        let request = NSMutableURLRequest(url: url as URL)
        
        
        request.addValue("1a972fe35b106ab79056f8db64e9ef0a", forHTTPHeaderField: "X-Mashape-Key")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        
        session.dataTask(with: (request as NSMutableURLRequest) as URLRequest){(data, response, error) -> Void in
            
            if let responseData = data
            {
                do{
                    let json = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.allowFragments)
                    print(json)
                }catch{
                    print("Could not serialize")
                }
            }
            
            }.resume()
    }

   
    func parseJSONData(url : String){
        
        print(url)
        
        var session : URLSession = URLSession()
        
        let urlLink = URL(string: url)
        
        let config = URLSessionConfiguration.default
        
        session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlLink!) { (data, response, error) in
            
            if error != nil {
                
                print(error)
                
            } else {
                
                if let urlContent = data {
                    
                    do {
                        
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options:
                            JSONSerialization.ReadingOptions.mutableContainers)
                        
                        print(jsonResult)
                        
                        
                    } catch {
                        
                        print("JSON Processing Failed")
                    }
                }
            }
        }
        
        
        
        task.resume()
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataAray.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if cell == nil{
            
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
            
            cell?.textLabel?.text = dataAray[indexPath.row]
            
        }
        
        return cell!
    }
    
}
 


//
//  ChatViewController.swift
//  ParseChatApp
//
//  Created by Personal Projects on 2/21/18.
//  Copyright © 2018 Personal Projects. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var messages: [PFObject] = []
    var usernames: [String] = []
    
    @IBOutlet weak var chatMessageField: UITextField!
    
    @IBOutlet weak var chatTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.rowHeight = UITableViewAutomaticDimension
        chatTableView.estimatedRowHeight = 50
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        // Do any additional setup after loading the view.
        //onTime()
    }
    /*
    @objc func onTime(){
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.onTime), userInfo: nil, repeats: true)
        fetchMessages()
        
        
        
    }
 */

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func messageDidBeginEditing(_ sender: Any) {
        if(chatMessageField.text == "Type a message"){
            chatMessageField.text = ""
        }
        chatMessageField.textColor = UIColor.black
    }
    
    

    @IBAction func sendButton(_ sender: Any) {
        let chatMessage = PFObject(className: "Message")
        chatMessage["text"] = chatMessageField.text ?? ""
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("The message was saved!")
                self.chatMessageField.text = ""
            }
            else if let error = error {
                print("Problem saving message: \(error.localizedDescription)")
            }
        }
    }
    
    @objc func fetchMessages(){
        let query = PFQuery(className: "Message")
        query.addDescendingOrder("createdAt")
        query.includeKey("user")
        
        messages = try! query.findObjects()
        
        /*
        var objects = try! query.findObjects()
        messages = []
        usernames = []
        for i in objects{
            messages.append(i.object(forKey: "text") as! String)
            usernames.append(i.object(forKey: "username") as! String) as! String)
            //usernames.append(i.object(forKey: "user") as! String
            
        }
        query.
 */
        
        
       
        
            
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
        
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        let message = messages[indexPath.row]["text"] as! String
        cell.messageLabel.text = message
        //let user = messages.objectForKey("user")
        if let user = messages[indexPath.row] as? PFUser {
            // User found! update username label with username
            cell.usernameLabel.text = user.username as! String
        } else {
            // No user found, set default username
            cell.usernameLabel.text = "🤖"
        }
        /*
        if usernames[indexPath.row] != ""{
            cell.usernameLabel.text = usernames[indexPath.row].username
        } else {
            // No user found, set default username
            cell.usernameLabel.text = "🤖"
        }
 */
        return cell
        
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


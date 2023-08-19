//
//  ChatViewController.swift
//  ChatWithFireBase
//
//  Created by Admin on 18.08.23.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var messegeTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let db = Firestore.firestore()
    
    var messegies: [Messege] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        navigationItem.hidesBackButton = true
        loadMessegees()
        
    }
    
    func loadMessegees() {
        
        
        db.collection(K.FStore.collectionName)
            .order(by: K.FStore.dateField)
            .addSnapshotListener { querySnapshot, error in
            self.messegies = []
            if let e = error {
                print("Error coming when we getting data \(e.localizedDescription)")
            } else {
                if let documenQuery = querySnapshot?.documents {
                    for doc in documenQuery {
                        let data = doc.data()
                        if let messegeBody = data[K.FStore.bodyField] as? String, let messegeSender = data[K.FStore.senderField] as? String {
                            let dataModel = Messege(sender: messegeSender, body: messegeBody)
                            self.messegies.append(dataModel)
                            
                            DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.messegies.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendButton(_ sender: UIButton) {
        
        if let messegeBody = messegeTextField.text, let menageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField : menageSender,
                K.FStore.bodyField : messegeBody,
                K.FStore.dateField : Date().timeIntervalSince1970
            ]) { error in
                if let e = error {
                    print("error coming when we adding data in fireStore \(e.localizedDescription)")
                } else {
                    DispatchQueue.main.async {
                        self.messegeTextField.text = ""
                    }
                    print("Adding was sacsesfuly")
                }
            }
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        do {
          try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }

}
extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: TableView DataSourse methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messegies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messegies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = message.body
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messegeBubleView.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messegeBubleView.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        
        return cell
    }
    
    
    
}

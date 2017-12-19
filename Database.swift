//
//  Database.swift
//  ManatthanChallenge
//
//  Created by Michele De Sena on 18/12/2017.
//  Copyright © 2017 Vincenzo Izzo. All rights reserved.
//

import Foundation
import CloudKit
import UIKit

protocol CloudControllerDelegate {
    func errorUpdating(error: NSError)
    func modelUpdated()
}



class ItemDB : NSObject {
    
    var record : CKRecord! // il riferimento al Record che rappresenta la Nota
    var image = #imageLiteral(resourceName: "Foto del 21-10-17 alle 13.24")
    var name :String!
    var price :Int!
    
    var database : CKDatabase! // il database in cui è stata inserita il record/nota
    var date: NSDate // la data di creazione del record
    
    init(record : CKRecord, database: CKDatabase) {
        self.record = record
        self.database = database
        
        self.name = record.object(forKey: "itemName") as! String
        self.price = record.object(forKey: "price") as! Int
        
        self.date = record.creationDate! as NSDate
    }
    
}

class Database {
    
    var itemArray:[ItemDB] = [] // conterrà tutti i Record recuperati dal Container.
    var delegate : CloudControllerDelegate?
    let zoneID = CKRecordZoneID(zoneName: "_defaultZone", ownerName: "_86a11539503863c21979e9c68a170580")
    static let shared = Database()
    let container = CKContainer.default()
    let publicDatabase = CKContainer.default().publicCloudDatabase
    let items = Items.shared.getItems()
    
    func saveItem(name:String, price:Int) {
        
        let recordItem = CKRecord(recordType: "sharedItems")
        
        /*recordItem.setValue(name, forKey: "itemName")
        //recordItem.setValue(image, forKey: "itemImage")
        recordItem.setValue(price, forKey: "price")
        
        publicDatabase.save(recordItem, completionHandler: { (record, error) -> Void in
            print("Item salvato con successo")*/
        
        recordItem["itemName"] = name as CKRecordValue
        recordItem["price"] = price as CKRecordValue
        print("Item salvato con successo")
        
    }
    
    

    func recuperaNote() {
        /*
         Il predicate è il modo in cui i dati devono essere recuperati (ad esempio solo quelli che hanno un certo valore)
         // La CKQuery è il tipo di domanda da fare al database. In particolare si sta richiedendo tutti i tipi record di tipo "Nota" con nessun tipo di filtro (dato che predicate non è impostato)
         */
        print("recupero record")
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "sharedItems", predicate: predicate)
        
        
        // performQuery manda in esecuzione la query. il metodo è una closure che restituisce results (un array di anyObject) o error in caso di query fallita
        publicDatabase.perform(query, inZoneWith: zoneID) { (results, error) -> Void in
            // se l'errore è diverso da nil quindi è stato generato un errore
            if let err = error {
                // vedi l'articolo sul blog per capire cosa succede qui dentro
                DispatchQueue.main.async() {
                    self.delegate?.errorUpdating(error: err as NSError)
                    print("errore")
                    return
                }
            } else {
                self.itemArray.removeAll(keepingCapacity: true)
                // se non è stato generato un errore allora itera tutti gli oggetti dell'array result
                for record in results! {
                    /*
                     crea una nota trasformando il record in CKRecord dato che è un AnyObject
                     e inserisce la nota all'interno dell'array di note
                     */
                    let item = ItemDB(record: record as CKRecord, database: self.publicDatabase)
                    self.itemArray.append(item)
                }
            }
            
        }
        print(itemArray)
    }
}

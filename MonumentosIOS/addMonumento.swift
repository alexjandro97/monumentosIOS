//
//  addMonumento.swift
//  MonumentosIOS
//
//  Created by CETYS on 22/02/18.
//  Copyright © 2018 CETYS. All rights reserved.
//

import UIKit
import CoreData


class addMonumento: UIViewController {

    @IBOutlet var titulo: UITextField!
    @IBOutlet var nombreMonumento: UITextField!
    @IBAction func guardar(_ sender: AnyObject) {
        let _nombreMonumento = self.nombreMonumento.text!
        let _descripcion = self.descripcion.text!
        let _titulo = self.titulo.text!
        
        guard let AppDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = AppDelegate.persistentContainer.viewContext
        
        let entidad = NSEntityDescription.entity(forEntityName: "Monumentos", in: managedContext)
        
        let registro = NSManagedObject(entity: entidad!, insertInto: managedContext)
        
        registro.setValue(_nombreMonumento, forKey: "nombre")
        registro.setValue(_descripcion, forKey: "descripcion")
        registro.setValue(_titulo, forKey: "titulo")
        
        do {
            try managedContext.save()
            print("guardado")
        } catch let error as NSError {
            print("no se ha podido insertar \(error), \(error.userInfo)")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet var descripcion: UITextField!
    @IBAction func cancelar(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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

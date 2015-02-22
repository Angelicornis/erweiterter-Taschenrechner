//
//  ViewController.swift
//  erweiterter Taschenrechner
//
//  Created by Tom Kumschier on 22.02.15.
//  Copyright (c) 2015 Tom Kumschier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var anzeigeWährendBerechnung = ""
    var zahlenstring2 = ""

    @IBOutlet weak var anzeigeEinheit: UILabel!
    @IBOutlet weak var ergebnissAnzeige: UILabel!

    @IBAction func zahl1() {
        anzeigeWährendBerechnung += "1"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    
    @IBAction func zahl2() {
        anzeigeWährendBerechnung += "2"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    
    @IBAction func zahl3() {
        anzeigeWährendBerechnung += "3"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    
    @IBAction func aktionPlus() {
        anzeigeWährendBerechnung += "+"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }

    @IBAction func aktionErgebnis() {
        ergebnissAnzeige.text = "Ergebniss: "
    }
}


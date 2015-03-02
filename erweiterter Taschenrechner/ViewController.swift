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
    
    
    func ArrayWertAusgabe<T>(vonWelchemArray ausgewähltesArray: [T], index: Int) ->T? {
        var ergebnis: T?
        for (key, value) in enumerate(ausgewähltesArray) {
            if key == index {
                ergebnis = value
            }
        }
        return ergebnis
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

    @IBAction func aktionMinus() {
        anzeigeWährendBerechnung += "-"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    
    @IBAction func aktionMal() {
        anzeigeWährendBerechnung += "x"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    
    @IBAction func aktionGeteilt() {
        anzeigeWährendBerechnung += ":"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    @IBAction func aktionLöscheLetzteZahl() {
        var anzeigeWährendBerechnungArray = [String]()
        for c in anzeigeWährendBerechnung{
            anzeigeWährendBerechnungArray.append("\(c)")
        }

        if anzeigeWährendBerechnungArray.count == 0 {
            anzeigeWährendBerechnung = "0"

        } else if anzeigeWährendBerechnungArray.valueOf(0) != "0" {
            anzeigeWährendBerechnungArray.removeLast()
            if anzeigeWährendBerechnungArray.count == 0 {
                anzeigeWährendBerechnung = "0"
                
            } else {
                anzeigeWährendBerechnung = ""
                for nummer in 0..<(anzeigeWährendBerechnungArray.count) {
                    anzeigeWährendBerechnung += (ArrayWertAusgabe(vonWelchemArray: anzeigeWährendBerechnungArray, index: nummer))!
                }
            }
        }
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }

    
    @IBAction func aktionErgebnis() {
        
        var ergebnis = berechnung(StringZumBerechnen: anzeigeWährendBerechnung)
        anzeigeEinheit.text = String(ergebnis)
        println("Das Ergebnis Lautet: \n \(ergebnis)\n")
    }    
}


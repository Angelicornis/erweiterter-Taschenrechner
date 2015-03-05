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

    
    @IBOutlet weak var anzeigeEinheit: UITextView!
//    @IBOutlet weak var anzeigeEinheit: UILabel!
    @IBOutlet weak var ergebnissAnzeige: UILabel!

    
    @IBAction func zahl1() {
        if theStringStartWithZero(welcherString: anzeigeWährendBerechnung) {
            anzeigeWährendBerechnung = ""
        }
        anzeigeWährendBerechnung += "1"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    
    @IBAction func zahl2() {
        if theStringStartWithZero(welcherString: anzeigeWährendBerechnung) {
            anzeigeWährendBerechnung = ""
        }
        anzeigeWährendBerechnung += "2"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    
    @IBAction func zahl3() {
        if theStringStartWithZero(welcherString: anzeigeWährendBerechnung) {
            anzeigeWährendBerechnung = ""
        }
        anzeigeWährendBerechnung += "3"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    
    @IBAction func zahl4() {
        if theStringStartWithZero(welcherString: anzeigeWährendBerechnung) {
            anzeigeWährendBerechnung = ""
        }
        anzeigeWährendBerechnung += "4"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }

    @IBAction func zahl5() {
        if theStringStartWithZero(welcherString: anzeigeWährendBerechnung) {
            anzeigeWährendBerechnung = ""
        }
        anzeigeWährendBerechnung += "5"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    @IBAction func zahl6() {
        if theStringStartWithZero(welcherString: anzeigeWährendBerechnung) {
            anzeigeWährendBerechnung = ""
        }
        anzeigeWährendBerechnung += "6"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    @IBAction func zahl7() {
        if theStringStartWithZero(welcherString: anzeigeWährendBerechnung) {
            anzeigeWährendBerechnung = ""
        }
        anzeigeWährendBerechnung += "7"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    @IBAction func zahl8() {
        if theStringStartWithZero(welcherString: anzeigeWährendBerechnung) {
            anzeigeWährendBerechnung = ""
        }
        anzeigeWährendBerechnung += "8"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    @IBAction func zahl9() {
        if theStringStartWithZero(welcherString: anzeigeWährendBerechnung) {
            anzeigeWährendBerechnung = ""
        }
        anzeigeWährendBerechnung += "9"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    @IBAction func zahl0() {
        if theStringStartWithZero(welcherString: anzeigeWährendBerechnung) {
            anzeigeWährendBerechnung = ""
        }
        anzeigeWährendBerechnung += "0"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    
    @IBAction func aktionPlus() {
        if countElements(anzeigeWährendBerechnung) != 0 {
            anzeigeWährendBerechnung += "+"
            anzeigeEinheit.text = anzeigeWährendBerechnung
        }
    }

    @IBAction func aktionMinus() {
        if countElements(anzeigeWährendBerechnung) != 0 {
            anzeigeWährendBerechnung += "-"
            anzeigeEinheit.text = anzeigeWährendBerechnung
        }
    }
    
    @IBAction func aktionMal() {
        if countElements(anzeigeWährendBerechnung) != 0 {
            anzeigeWährendBerechnung += "x"
            anzeigeEinheit.text = anzeigeWährendBerechnung
        }
    }
    
    @IBAction func aktionGeteilt() {
        if countElements(anzeigeWährendBerechnung) != 0 {
            anzeigeWährendBerechnung += ":"
            anzeigeEinheit.text = anzeigeWährendBerechnung
        }
    }
    
    @IBAction func aktionLöscheLetzteZahl() {
        anzeigeWährendBerechnung = löscheLetzteEingabe(vonWelchemString: anzeigeWährendBerechnung)
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }

    @IBAction func aktionClear() {
        anzeigeWährendBerechnung = ""
        anzeigeEinheit.text = "\n"
        ergebnissAnzeige.text = ""
    }
    
    @IBAction func aktionKlammerAuf() {
        anzeigeWährendBerechnung += "("
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    
    @IBAction func aktionKlammerZu() {
        anzeigeWährendBerechnung += ")"
        anzeigeEinheit.text = anzeigeWährendBerechnung
    }
    
    @IBAction func aktionErgebnis() {
        
        var ergebnis = klammern(ursprünglicherString: anzeigeWährendBerechnung)
        ergebnissAnzeige.text = String(ergebnis)
        println("Das Ergebnis Lautet: \n \(ergebnis)\n")
    }    
}


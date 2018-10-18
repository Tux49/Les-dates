//
//  ViewController.swift
//  Les dates
//
//  Created by Thierry Huu on 18/10/2018.
//  Copyright © 2018 Thierry Huu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    // Obtenir une String
    @IBOutlet weak var dateStringLbl: UILabel!
    
    // TimeInterval
    @IBOutlet weak var timeIntervalLbl: UILabel!
    
    // Si Aujourd'hui, demain, hier ou week-end
    @IBOutlet weak var calendarLbl: UILabel!
    
    // Il y a + mois, jours, heures
    @IBOutlet weak var ilyaLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func dateChoisie(_ sender: UIDatePicker) {
        let date = sender.date
        print(date)
        dateStringLbl.text = date.toString()
        timeIntervalLbl.text = date.interval()
        calendarLbl.text = date.calendarString()
        ilyaLbl.text = date.components()
    }
}

extension Date {
    
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "fr_FR")
        return dateFormatter.string(from: self)
    }
    
    func interval() -> String {
        return String(format: "%.2f", self.timeIntervalSinceNow)
    }
    
    func calendarString() -> String {
        var str = ""
        
        let calendar = Calendar.current
        
        if calendar.isDateInToday(self) {
            str += "Aujourd'hui"
        }
        
        if calendar.isDateInTomorrow(self) {
            str += "Demain"
        }
        
        if calendar.isDateInYesterday(self) {
            str += "Hier"
        }
        
        if calendar.isDateInWeekend(self) {
            str += "Nous sommes le week-end"
        }
        
        return str
    }
    
    func components() -> String {
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month, .day, .hour, .minute], from: self, to: Date())
        
        let mois = components.month ?? 0
        let jour = components.day ?? 0
        let heure = components.hour ?? 0
        let minute = components.minute ?? 0
        
        return "Temps écoulé -> mois: \(mois), jour(s): \(jour), heure(s): \(heure), minute(s): \(minute)"
    }
}

//
//  EventsViewController.swift
//  CCGApp
//
//  Created by Matheus Nishi on 13/06/17.
//  Copyright © 2017 Matheus Nishi. All rights reserved.
//

import UIKit
import FSCalendar
import ProgressHUD


class EventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FSCalendarDelegate, FSCalendarDataSource, UIGestureRecognizerDelegate, EventsManagerDelegate {
    
    var allEvents = [Events]()
    var currentEvents = [Events]()
    let eventsManager = EventsManager()
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var calendarHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var dateTitleLabel: UILabel!
    @IBOutlet weak var noEventsLabel: UILabel!
    
    fileprivate let gregorian = Calendar(identifier: .gregorian)
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    fileprivate lazy var scopeGesture: UIPanGestureRecognizer = {
        [unowned self] in
        let panGesture = UIPanGestureRecognizer(target: self.calendar, action: #selector(self.calendar.handleScopeGesture(_:)))
        panGesture.delegate = self
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 2
        
        return panGesture
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Eventos"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.calendar.dataSource = self
        self.calendar.delegate = self
        
        self.eventsManager.delegate = self
        
        self.view.addGestureRecognizer(self.scopeGesture)
        self.tableView.panGestureRecognizer.require(toFail: self.scopeGesture)
        self.calendar.scope = .month
        
        self.calendar.allowsSelection = true
        
        if !Reachability().networkVerification() {
            ProgressHUD.showError("Sem Conexão", interaction: false)
            return
        }
        
        self.eventsManager.getEvents()
        ProgressHUD.show("Carregando...")        
    }
    
    //MARK: UIGestureRecognizerDelegate
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let shouldBegin = self.tableView.contentOffset.y <= -self.tableView.contentInset.top
        if shouldBegin {
            let velocity = self.scopeGesture.velocity(in: self.view)
            switch self.calendar.scope {
            case .month:
                return velocity.y < 0
            default:
                return velocity.y > 0
            }
        }
        return shouldBegin
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: FSCalendarDelegate
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        self.calendarHeightConstraint.constant = bounds.height
        self.view.layoutIfNeeded()
        
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("Selecionei uma data")
        self.filterEvents(date: date)
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        let calendar = Calendar.current
        let day1 = calendar.component(.day, from: date)
        let month1 = calendar.component(.month, from: date)
        let year1 = calendar.component(.year, from: date)
        
        for item in allEvents {
            let day2 = calendar.component(.day, from: item.date!)
            let month2 = calendar.component(.month, from: item.date!)
            let year2 = calendar.component(.year, from: item.date!)
            if (day1 == day2) && (month1 == month2) && (year1 == year2) {
                return 1
            }
        }
        return 0
    }
    
    
    // MARK: UITableView Delegate/DataSource
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventsTableViewCell
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentEvents[indexPath.row].date!)
        let minutes = calendar.component(.minute, from: currentEvents[indexPath.row].date!)
        
        cell.dateTimeLabel.text = "\(hour):\(minutes)"
        cell.nameEventLabel.text = currentEvents[indexPath.row].nameEvent
        cell.placeLabel.text = currentEvents[indexPath.row].place
        
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
    
    func filterEvents(date: Date) {
        currentEvents.removeAll()
        
        let calendar = Calendar.current
        let day1 = calendar.component(.day, from: date)
        let month1 = calendar.component(.month, from: date)
        let year1 = calendar.component(.year, from: date)
        
        self.dateTitleLabel.text = "Eventos do dia \(day1)/\(month1)"
        
        for item in allEvents {
            let day2 = calendar.component(.day, from: item.date!)
            let month2 = calendar.component(.month, from: item.date!)
            let year2 = calendar.component(.year, from: item.date!)
            if (day1 == day2) && (month1 == month2) && (year1 == year2) {
                currentEvents.append(item)
                self.tableView.isHidden = false
                self.noEventsLabel.isHidden = true
            }
        }
        
        if currentEvents.count == 0 {
            self.noEventsLabel.isHidden = false
            self.tableView.isHidden = true
        }
        
        self.tableView.reloadData()
    }
    
    // Mark: EventsManagerDelegate
    
    func dataReady() {
        self.allEvents = self.eventsManager.events
        self.tableView.reloadData()
        self.calendar.reloadData()
        self.filterEvents(date: Date())
        ProgressHUD.dismiss()
    }

}

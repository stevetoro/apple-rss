//
//  ViewController.swift
//  apple-rss
//
//  Created by Steve Toro on 9/2/19.
//  Copyright © 2019 Steve Toro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource, UITableViewDelegate {
    private var mediaPickerView: UIPickerView = UIPickerView()
    private var mediaTableView: UITableView = UITableView()
    private var mediaTypes = MediaAPI.getMediaTypes()
    private var mediaItems: [ Media ] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        initializePickerView()
        initializeTableView()
    }
    
    func initializePickerView() {
        view.addSubview(mediaPickerView)
        mediaPickerView.dataSource = self
        mediaPickerView.delegate = self
        mediaPickerView.translatesAutoresizingMaskIntoConstraints = false
        mediaPickerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mediaPickerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mediaPickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func initializeTableView() {
        view.addSubview(mediaTableView)
        mediaTableView.dataSource = self
        mediaTableView.delegate = self
        mediaTableView.register(MediaTableViewCell.self, forCellReuseIdentifier: "mediaCell")
        mediaTableView.translatesAutoresizingMaskIntoConstraints = false
        mediaTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mediaTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mediaTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mediaTableView.bottomAnchor.constraint(equalTo: mediaPickerView.topAnchor).isActive = true
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mediaTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mediaTypes[row]["name"]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Selected \(mediaTypes[row]["name"]!)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mediaCell", for: indexPath) as! MediaTableViewCell
        cell.media = mediaItems[indexPath.row]
        return cell
    }

}


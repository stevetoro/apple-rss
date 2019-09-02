//
//  ViewController.swift
//  apple-rss
//
//  Created by Steve Toro on 9/2/19.
//  Copyright © 2019 Steve Toro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    private var mediaPickerView: UIPickerView = UIPickerView()
    private var mediaTypes = MediaAPI.getMediaTypes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        initializePickerView()
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

}


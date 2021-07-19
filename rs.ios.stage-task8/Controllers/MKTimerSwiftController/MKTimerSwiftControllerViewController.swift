//
//  MKTimerSwiftControllerViewController.swift
//  rs.ios.stage-task8
//
//  Created by dev on 18.07.21.
//

import UIKit

class MKTimerSwiftController: ParentColorTimerViewController {
    let label: UILabel = UILabel(frame: CGRect(x: 162, y: 161, width: 52, height: 22));
    let minimumLabel: UILabel = UILabel(frame: CGRect(x: 26, y: 103, width: 7, height: 22));
    let maximumLabel: UILabel = UILabel(frame: CGRect(x: 338, y: 103, width: 11, height: 22));
    @objc var timer = Timer();
    
    @objc var myDrawingView:MKDrawingView = MKDrawingView();

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup();
    }
    
    func setup() {
        let slider: UISlider = UISlider(frame: CGRect(x: 74, y: 112, width: 223, height: 4));
        slider.addTarget(self, action: #selector(self.sliderValueChanged), for: .valueChanged);
        slider.minimumValue = 1.0;
        slider.maximumValue = 5.0;
        slider.tintColor = UIColor(named:"Light Green Sea");
        
        minimumLabel.text = "\(slider.minimumValue)";
        minimumLabel.textAlignment = .center;
        minimumLabel.font = UIFont(name: "Montserrat-Regular", size: 18.0);
        
        maximumLabel.text = "\(slider.maximumValue)";
        maximumLabel.textAlignment = .center;
        maximumLabel.font = UIFont(name: "Montserrat-Regular", size: 18.0);
        
        self.view.addSubview(slider);
        self.view.addSubview(label);
        self.view .addSubview(minimumLabel);
        self.view .addSubview(maximumLabel);
    }
    
    @objc func sliderValueChanged(sender:UISlider) {
        label.font = UIFont(name: "Montserrat-Regular", size: 18.0);
        label.text = String(format: "%0.02f", sender.value);
        label.textAlignment = .center;
        self.myDrawingView.progress = 1.0/(60.0 * sender.value);
    }
}

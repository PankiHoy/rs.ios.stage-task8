//
//  MKDrawingsViewController.swift
//  rs.ios.stage-task8
//
//  Created by dev on 18.07.21.
//

import UIKit

class MKDrawingsSwiftController: UIViewController {
    var helpDict: Dictionary = ["Planet": 1, "Head": 2, "Tree": 3, "Landscape": 4];
    
    @objc var delegate: MKMainViewController = MKMainViewController();
    @objc var myDrawingView: MKDrawingView = MKDrawingView();
    
    var planetDrawing: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40));
    var headDrawing: UIButton = UIButton(frame: CGRect(x: 0, y: 55, width: 200, height: 40));
    var treeDrawing: UIButton = UIButton(frame: CGRect(x: 0, y: 110, width: 200, height: 40));
    var landscapeDrawing: UIButton = UIButton(frame: CGRect(x: 0, y: 165, width: 200, height: 40));

    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor .white;
        self.setup();
    }
    
    func setup() {
        self.navigationItem.title = "Drawings";
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:UIFont(name: "Montserrat-Regular", size: 17.0)!,
                                                                        NSAttributedString.Key.foregroundColor:UIColor(named: "Black") ?? UIColor .black];
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "Artist",
                                                                     style: UIBarButtonItem.Style.plain,
                                                                     target: self,
                                                                     action: Selector.init(("back:")))
        self.navigationItem.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font:UIFont(name: "Montserrat-Medium", size: 17.0)!,
                                                                       NSAttributedString.Key.foregroundColor:UIColor(named: "Light Green Sea")!],
                                                                      for: UIControl.State.normal);
        self.navigationController?.view.tintColor = UIColor(named: "Light Green Sea");
        let list: UIView = UIView(frame: CGRect(x: 88, y: 112, width: 200, height: 205));
        list.tintColor = UIColor(named: "Light Green Sea");
        self.view.addSubview(list);
        self.view.bringSubviewToFront(list);
        
        planetDrawing.layer.cornerRadius = 10.0;
        headDrawing.layer.cornerRadius = 10.0;
        treeDrawing.layer.cornerRadius = 10.0;
        landscapeDrawing.layer.cornerRadius = 10.0;

        planetDrawing.setDefault();
        headDrawing.setDefault();
        treeDrawing.setDefault();
        landscapeDrawing.setDefault();

        planetDrawing.setTitle("Planet", for: .normal);
        headDrawing.setTitle("Head", for: .normal);
        treeDrawing.setTitle("Tree", for: .normal);
        landscapeDrawing.setTitle("Landscape", for: .normal);
        
        planetDrawing.titleLabel?.textAlignment = .center;
        headDrawing.titleLabel?.textAlignment = .center;
        treeDrawing.titleLabel?.textAlignment = .center;
        landscapeDrawing.titleLabel?.textAlignment = .center;

        planetDrawing.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 18.0);
        headDrawing.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 18.0);
        treeDrawing.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 18.0);
        landscapeDrawing.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 18.0);

        planetDrawing.setTitleColor(UIColor(named: "Light Green Sea"), for: .normal);
        headDrawing.setTitleColor(UIColor(named: "Light Green Sea"), for: .normal);
        treeDrawing.setTitleColor(UIColor(named: "Light Green Sea"), for: .normal);
        landscapeDrawing.setTitleColor(UIColor(named: "Light Green Sea"), for: .normal);

        planetDrawing.addTarget(self, action: #selector(self.buttonTouchedUp(sender:)), for: .touchUpInside);
        headDrawing.addTarget(self, action: #selector(self.buttonTouchedUp(sender:)), for: .touchUpInside);
        treeDrawing.addTarget(self, action: #selector(self.buttonTouchedUp(sender:)), for: .touchUpInside);
        landscapeDrawing.addTarget(self, action: #selector(self.buttonTouchedUp(sender:)), for: .touchUpInside);

        planetDrawing.addTarget(self, action: #selector(self.buttonTouchedDown(sender:)), for: .touchDown);
        headDrawing.addTarget(self, action: #selector(self.buttonTouchedDown(sender:)), for: .touchDown);
        treeDrawing.addTarget(self, action: #selector(self.buttonTouchedDown(sender:)), for: .touchDown);
        landscapeDrawing.addTarget(self, action: #selector(self.buttonTouchedDown(sender:)), for: .touchDown);

        self.view.subviews[0].addSubview(planetDrawing);
        self.view.subviews[0].addSubview(headDrawing);
        self.view.subviews[0].addSubview(treeDrawing);
        self.view.subviews[0].addSubview(landscapeDrawing);
    }
    
    
    @objc func back(sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true);
    }
    
    @objc func buttonTouchedUp(sender: UIButton) {
        for (key, _) in self.helpDict {
            if key == sender.titleLabel?.text {
                self.myDrawingView.currentDrawing = self.helpDict[key]! as NSNumber;
                self .back(sender: sender)
            }
        }
        self.delegate.drawButton .setDefault();
    }
    
    @objc func buttonTouchedDown(sender: UIButton) {
        setAllButtonsDefault();
        sender .setHighlighted();
    }

    @objc func setAllButtonsDefault() {
        let arrayWithButtons: Array<UIButton> = [planetDrawing, headDrawing, treeDrawing, landscapeDrawing];
        for button in arrayWithButtons {
            button .setDefault();
        }
    }
}

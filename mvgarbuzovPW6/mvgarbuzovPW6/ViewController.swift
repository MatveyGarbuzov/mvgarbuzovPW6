//
//  ViewController.swift
//  mvgarbuzovPW6
//
//  Created by Matvey Garbuzov on 19.03.2022.
//

import UIKit
import MyLogger1
import MyLogger2
import MyLogger3
//import MyLogger4

class ViewController: UIViewController {
    @objc
    @IBAction func logFromFramework(_ sender: Any) {
        MyLogger1.log("hello, world")
    }
    
    @objc
    @IBAction func logFromSwiftPackage(_ sender: Any) {
        MyLogger2.log("hello, world")
    }
    
    @objc
    @IBAction func logFromPod(_ sender: Any) {
        MyLogger3.log("hello, world")
    }
    
    @objc
    @IBAction func logFromCarthage(_ sender: Any) {
//        MyLogger4.log("hello, world")
        print("Carthage не получилось :(")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let button1 = setupButton(text: "Log (framework)")
        button1.addTarget(self, action: #selector(logFromFramework), for: .touchUpInside)
        
        let button2 = setupButton(text: "Log (swift package)")
        button2.addTarget(self, action: #selector(logFromSwiftPackage), for: .touchUpInside)
        
        let button3 = setupButton(text: "Log (pod)")
        button3.addTarget(self, action: #selector(logFromPod), for: .touchUpInside)
        
        let button4 = setupButton(text: "Log (carthage)")
        button4.addTarget(self, action: #selector(logFromCarthage), for: .touchUpInside)
        
        let stack = UIStackView(arrangedSubviews: [
                button1,
                button2,
                button3,
                button4
        ])
        setupStack(stack: stack)
    }
    
    func setupButton(text: String) -> UIButton {
        let button = UIButton()
        button.setTitle("\(text)", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.blue, for: .normal)
        return button
    }
    
    func setupStack(stack: UIStackView) {
        stack.axis = .vertical
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.pinTop(to: view.centerYAnchor)
        stack.pinWidth(to: view.widthAnchor)
    }


}


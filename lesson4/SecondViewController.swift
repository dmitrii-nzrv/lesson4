//
//  SecondViewController.swift
//  lesson4
//
//  Created by Dmitrii Nazarov on 29.07.2024.
//

import UIKit

class SecondViewController: UIViewController {
    lazy var viewWidth = view.frame.width
    lazy var viewHeight = view.frame.height
    var delegate: MainViewController?
    
    
    lazy var textView: UITextView = {
        $0.frame = CGRect(x: view.center.x - (viewWidth/1.1-20)/2, y: viewHeight / 5 , width: viewWidth/1.1-20, height: viewHeight/4)
        $0.backgroundColor = .placeholderText
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 30
        return $0
    } (UITextView())
    
    lazy var msgButn: UIButton = {
        $0.frame = CGRect(x: view.center.x - (viewWidth/1.1-20)/2, y: textView.frame.maxY + 25 , width: viewWidth/1.1-20, height: viewHeight/17)
        $0.setTitle("Написать", for: .normal)
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 25
        $0.backgroundColor = .systemGreen
        $0.tintColor = .white
        return $0
    }(UIButton(primaryAction: nextVCAction))
    
    lazy var nextVCAction =  UIAction { [weak self] _ in
        self?.navigationController?.popViewController(animated: true)
        self?.delegate?.sendData(data: self?.textView.text ?? "")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Сообщение"
        view.addSubview(textView)
        view.addSubview(msgButn)
        
    }
    
}

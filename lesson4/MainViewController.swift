//
//  ViewController.swift
//  lesson4
//
//  Created by Dmitrii Nazarov on 28.07.2024.
//

import UIKit

protocol MainViewControllerDelegate {
    func sendData(data : String)
}

class MainViewController: UIViewController, MainViewControllerDelegate {

    lazy var viewWidth = view.frame.width
    lazy var viewHeight = view.frame.height
    
    // MARK: UI
    lazy var mainImageView: UIImageView = {
        $0.image = .chiksa
        $0.backgroundColor = .gray
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.frame = CGRect(x: view.center.x - (viewWidth/1.1-20)/2, y: viewHeight / 5.5 , width: viewWidth/1.1-20, height: viewHeight/2.2-33)
        $0.layer.cornerRadius = 35
        
        return $0
    }(UIImageView())
    
    lazy var instBtn: UIButton = {
        $0.setImage(.inst, for: .normal)
        $0.frame = CGRect(x: mainImageView.bounds.minX + 25, y: mainImageView.bounds.minY + 20, width: 45, height: 45)
        return $0
    }(UIButton())
    
    lazy var tikBtn: UIButton = {
        $0.setImage(.tik, for: .normal)
        $0.frame = CGRect(x: instBtn.frame.maxX, y: mainImageView.bounds.minY + 20, width: 45, height: 45)
        return $0
    }(UIButton())
    
    lazy var vkBtn: UIButton = {
        $0.setImage(.vk, for: .normal)
        $0.frame = CGRect(x: tikBtn.frame.maxX, y: mainImageView.bounds.minY + 20, width: 45, height: 45)
        return $0
    }(UIButton())
    
    lazy var dotsBtn: UIButton = {
        $0.setImage(.dots, for: .normal)
        $0.frame = CGRect(x: mainImageView.frame.maxX - viewWidth/4, y: mainImageView.bounds.minY + 20, width: 45, height: 45)
        return $0
    }(UIButton())
    
    lazy var nameLabel: UILabel = {
        $0.text = "Имя Fамилия"
        $0.frame = CGRect(x: mainImageView.bounds.minX + 28, y: mainImageView.bounds.maxY - viewWidth/5, width: 140, height: 20)
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 20, weight: .heavy)
        
        return $0
    }(UILabel())
    lazy var ageLabel: UILabel = {
        $0.text = "25 лет"
        $0.frame = CGRect(x: mainImageView.bounds.minX + 28, y: nameLabel.frame.maxY + 3 , width: 55, height: 20)
        $0.textColor = .lightGray
        
        return $0
    }(UILabel())
    
    lazy var medalImageView: UIImageView = {
        $0.image = .medal
        
        $0.clipsToBounds = true
        $0.frame = CGRect(x: nameLabel.frame.maxX - 4 , y: nameLabel.frame.midY - 16 , width: 32, height: 32)
        
        return $0
    }(UIImageView())
    
    lazy var crossBtn: UIButton = {
        $0.setImage(.cross, for: .normal)
        $0.frame = CGRect(x: mainImageView.frame.minX, y: mainImageView.frame.maxY + 25, width: 65, height: 65)
       // $0.backgroundColor = .red
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 15
        
        return $0
    }(UIButton())
    
    lazy var heartBtn: UIButton = {
        $0.setImage(.heart, for: .normal)
        $0.frame = CGRect(x: mainImageView.frame.maxX - 65 , y: mainImageView.frame.maxY + 25, width: 65, height: 65)
       // $0.backgroundColor = .red
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 15
        
        return $0
    }(UIButton())
    
    lazy var messageBtn: UIButton = {
        $0.setTitle("Написать", for: .normal)
        $0.frame = CGRect(x: crossBtn.frame.minX + 80 , y: mainImageView.frame.maxY + 30, width: viewWidth/2, height: viewWidth/8)
        $0.backgroundColor = .systemGreen
        $0.tintColor = .white
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 20
        
        return $0
    }(UIButton(primaryAction: nextVCAction))
    
    lazy var viewLabel: UIView = {
        $0.frame = CGRect(x: 23, y: messageBtn.frame.maxY + 40, width: viewWidth - 46, height: viewHeight/9)
        $0.backgroundColor = .placeholderText
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 25
        
        return $0
    } (UIView())
    
    lazy var descrLabel: UILabel = {
        $0.frame = CGRect(x: viewLabel.bounds.minX + 5, y: viewLabel.bounds.minY + 5, width: viewLabel.bounds.width - 10, height: viewHeight/10)
        $0.textAlignment = .center
        $0.textColor = .black
        
        return $0
    }(UILabel())
    
    lazy var nextVCAction =  UIAction { [weak self] _ in
        let secondVC = SecondViewController()
        secondVC.delegate = self
        self?.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "AppName"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        addSubviews()
    }

    // MARK: Private methods
    private func addSubviews() {
        view.addSubview(mainImageView)
        mainImageView.addSubview(instBtn)
        mainImageView.addSubview(tikBtn)
        mainImageView.addSubview(vkBtn)
        mainImageView.addSubview(dotsBtn)
        mainImageView.addSubview(nameLabel)
        mainImageView.addSubview(ageLabel)
        mainImageView.addSubview(medalImageView)
        view.addSubview(crossBtn)
        view.addSubview(heartBtn)
        view.addSubview(messageBtn)
        view.addSubview(viewLabel)
        viewLabel.addSubview(descrLabel)
        print(viewWidth)
    }
}

extension MainViewController {
    func sendData(data : String) {
        descrLabel.text = data
    }
}

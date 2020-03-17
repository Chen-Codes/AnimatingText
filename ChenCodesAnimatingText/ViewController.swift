//
//  ViewController.swift
//  ChenCodesAnimatingText
//
//  Created by Chen Codes on 3/14/20.
//  Copyright © 2020 Chen Codes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        let timer = Timer.scheduledTimer(withTimeInterval: 4,
                                         repeats: true) { [weak self] _ in
                                            self?.updateText()
                                            self?.animateText()
        }
        timer.fire()
    }
    
    private func updateText() {
        label.text = texts[index % texts.count]
        label.sizeToFit()
        index += 1
    }
    
    private func animateText() {
        label.center = .init(x: Constant.screenWidth + label.frame.width,
                             y: Constant.screenHalfHeight)
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: .curveEaseInOut,
                       animations: { [weak self] in
                        guard let self = self else { return }
                        self.label.center = .init(x: Constant.screenWidth/2,
                                                  y: Constant.screenHalfHeight)
        }) { _ in
            UIView.animate(withDuration: 1,
                           delay: 2,
                           options: .curveEaseInOut,
                           animations: { [weak self] in
                            guard let self = self else { return }
                            self.label.center = .init(x: -self.label.frame.width,
                                                      y: Constant.screenHalfHeight)
            })
        }
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 40)
        return label
    }()
    
    private var index: Int = 0
    
    private let texts: [String] = ["First message",
                                   "Second message",
                                   "Third message"]
    
    private enum Constant {
        static let screenHalfHeight: CGFloat = UIScreen.main.bounds.height/2
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
    }
}

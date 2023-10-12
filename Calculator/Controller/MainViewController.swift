//
//  MainViewController.swift
//  Calculator
//
//  Created by Kirill Taraturin on 11.10.2023.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let calculatorView = CalculatorView()
    
    // MARK: - Privaet Properties
    private var calculator = CalculatorLogic()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(calculatorView)
        setupConstraints()
        setupButtonActions()
    }
    
    // MARK: - Private Actions
    private func numberButtonDidTapped(title: String) {
        calculatorView.setNumberLabel(title)
        calculatorView.changeFinishedBoolValue(false)
    }
    
    private func calculateButtonDidTapped(_ title: String, numLabel: Double) {
        calculatorView.changeFinishedBoolValue(true)
        
        calculator.setNumber(numLabel)
        
        if let result = calculator.calculate(symbol: title) {
            calculatorView.setNumberText(result)
        }
    }
    
    // MARK: - Private Methods
    private func setupButtonActions() {
        calculatorView.numberButtonAction = { buttonTitle in
            self.numberButtonDidTapped(title: buttonTitle)
            
        }
        
        calculatorView.calculateButtonAction = { buttonTitle, numLabel in
            self.calculateButtonDidTapped(buttonTitle, numLabel: numLabel)
        }
    }
    
    private func setupConstraints() {
        calculatorView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}


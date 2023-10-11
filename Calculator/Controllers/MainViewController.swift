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
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(calculatorView)
        setupConstraints()
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        calculatorView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}


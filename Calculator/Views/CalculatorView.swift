//
//  CalculatorView.swift
//  Calculator
//
//  Created by Kirill Taraturin on 11.10.2023.
//

import UIKit

final class CalculatorView: UIView {
    
    // MARK: - Colors
    private let customBlueColor = UIColor(
        red: 0.11,
        green: 0.61,
        blue: 0.96,
        alpha: 1.00
    )
    
    private let customOrangeColor = UIColor(
        red: 1.00,
        green: 0.58,
        blue: 0.00,
        alpha: 1.00
    )
    
    // MARK: - Private UI Properties
    private lazy var mainStackView: UIStackView = {
        var mainSV = createStackView(with: .vertical)
        
        addArrungedSubviewTo(
            stackView: mainSV,
            subviews: numberView,
            firstStackView,
            secondStackView,
            thirdStackView,
            fourthStackView,
            fifthStackView
        )
        return mainSV
    }()
    
    private lazy var numberView: UIView = {
        var numberView = UIView()
        return numberView
    }()
    
    private lazy var numberLabel: UILabel = {
        var numberLabel = UILabel()
        numberLabel.text = "0"
        numberLabel.textColor = .white
        numberLabel.font = UIFont.systemFont(ofSize: 50)
        numberLabel.textAlignment = .right
        numberLabel.numberOfLines = 1
        return numberLabel
    }()
    
    // MARK: - FirstStackView
    private lazy var firstStackView: UIStackView = {
        var firstSV = createStackView()
        addArrungedSubviewTo(
            stackView: firstSV,
            subviews: acButton, plusMinusButton, procentButton, devideButton
        )
        return firstSV
    }()
    
    private lazy var acButton: UIButton = {
        var acButton = createButton(text: "AC", color: .darkGray)
        return acButton
    }()
    
    private lazy var plusMinusButton: UIButton = {
        var plusMinusButton = createButton(text: "+/-", color: .darkGray)
        return plusMinusButton
    }()
    
    private lazy var procentButton: UIButton = {
        var procentButton = createButton(text: "%", color: .darkGray)
        return procentButton
    }()
    
    private lazy var devideButton: UIButton = {
        var devideButton = createButton(
            text: "÷",
            color: customOrangeColor
        )
        return devideButton
    }()
    
    // MARK: - SecondStackView
    private lazy var secondStackView: UIStackView = {
        var firstSV = createStackView()
        addArrungedSubviewTo(
            stackView: firstSV,
            subviews: sevenButton, eightButton, nineButton, multiplyButton
        )
        return firstSV
    }()
    
    private lazy var sevenButton: UIButton = {
        var acButton = createButton(text: "7", color: customBlueColor)
        return acButton
    }()
    
    private lazy var eightButton: UIButton = {
        var plusMinusButton = createButton(text: "8", color: customBlueColor)
        return plusMinusButton
    }()
    
    private lazy var nineButton: UIButton = {
        var procentButton = createButton(text: "9", color: customBlueColor)
        return procentButton
    }()
    
    private lazy var multiplyButton: UIButton = {
        var devideButton = createButton(
            text: "×",
            color: customOrangeColor
        )
        return devideButton
    }()
    
    // MARK: - ThirdStackView
    private lazy var thirdStackView: UIStackView = {
        var thirdSV = createStackView()
        addArrungedSubviewTo(
            stackView: thirdSV,
            subviews: fourButton, fiveButton, sixButton, minusButton
        )
        return thirdSV
    }()
    
    private lazy var fourButton: UIButton = {
        var fourButton = createButton(text: "4", color: customBlueColor)
        return fourButton
    }()
    
    private lazy var fiveButton: UIButton = {
        var fiveButton = createButton(text: "5", color: customBlueColor)
        return fiveButton
    }()
    
    private lazy var sixButton: UIButton = {
        var sixButton = createButton(text: "6", color: customBlueColor)
        return sixButton
    }()
    
    private lazy var minusButton: UIButton = {
        var minusButton = createButton(
            text: "-",
            color: customOrangeColor
        )
        return minusButton
    }()
    
    // MARK: - FourthStackView
    private lazy var fourthStackView: UIStackView = {
        var fourthSV = createStackView()
        addArrungedSubviewTo(
            stackView: fourthSV,
            subviews: oneButton, twoButton, threeButton, plusButton
        )
        return fourthSV
    }()
    
    private lazy var oneButton: UIButton = {
        var oneButton = createButton(text: "1", color: customBlueColor)
        return oneButton
    }()
    
    private lazy var twoButton: UIButton = {
        var twoButton = createButton(text: "2", color: customBlueColor)
        return twoButton
    }()
    
    private lazy var threeButton: UIButton = {
        var threeButton = createButton(text: "3", color: customBlueColor)
        return threeButton
    }()
    
    private lazy var plusButton: UIButton = {
        var plusButton = createButton(
            text: "+",
            color: customOrangeColor
        )
        return plusButton
    }()
    
    // MARK: - FifthStackView
    private lazy var fifthStackView: UIStackView = {
        var fifthSV = createStackView()
        addArrungedSubviewTo(
            stackView: fifthSV,
            subviews: zeroButton, smallStackView
        )
        return fifthSV
    }()
    
    private lazy var zeroButton: UIButton = {
        var procentButton = createButton(text: "0", color: customBlueColor)
        return procentButton
    }()
    
    private lazy var smallStackView: UIStackView = {
        var smallSV = createStackView()
        addArrungedSubviewTo(
            stackView: smallSV,
            subviews: dotButton, equalButton
        )
        return smallSV
    }()
    
    private lazy var dotButton: UIButton = {
        var procentButton = createButton(text: ".", color: customBlueColor)
        return procentButton
    }()
    
    private lazy var equalButton: UIButton = {
        var procentButton = createButton(text: "=", color: customOrangeColor)
        return procentButton
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(mainStackView)
        numberView.addSubview(numberLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        numberLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    private func createStackView(with axis: NSLayoutConstraint.Axis = .horizontal) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        return stackView
    }
    
    private func createButton(text: String, color: UIColor) -> UIButton {
        let customButton = UIButton(type: .system)
        customButton.setTitle(text, for: .normal)
        customButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        customButton.backgroundColor = color
        customButton.setTitleColor(.white, for: .normal)
        return customButton
    }
    
    private func addArrungedSubviewTo(stackView: UIStackView, subviews: UIView...) {
        subviews.forEach { button in
            stackView.addArrangedSubview(button)
        }
    }
}

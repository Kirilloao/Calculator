//
//  CalculatorView.swift
//  Calculator
//
//  Created by Kirill Taraturin on 11.10.2023.
//

import UIKit

final class CalculatorView: UIView {
    
    // MARK: - Public Properties
    var displayValue: Double {
        get {
            guard  let number = Double(numberLabel.text!) else {
                fatalError("Cannot conver number label text to a Double!")
            }
            return number
            
        }
        set {
            numberLabel.text = String(newValue)
        }
    }
    
    // MARK: - Closures
    var numberButtonAction: ((String) -> Void)?
    var calculateButtonAction: ((String, Double) -> Void)?
    
    // MARK: - Private Properties
    private var isFinishedTypingNumber = true
    
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
        var acButton = createCustomButton(
            text: "AC",
            color: .darkGray,
            action: #selector(calculateButtonDidTapped)
        )
        return acButton
    }()
    
    private lazy var plusMinusButton: UIButton = {
        var plusMinusButton = createCustomButton(
            text: "+/-",
            color: .darkGray,
            action: #selector(calculateButtonDidTapped)
        )
        return plusMinusButton
    }()
    
    private lazy var procentButton: UIButton = {
        var procentButton = createCustomButton(
            text: "%",
            color: .darkGray,
            action: #selector(calculateButtonDidTapped)
        )
        return procentButton
    }()
    
    private lazy var devideButton: UIButton = {
        var devideButton = createCustomButton(
            text: "÷",
            color: UIColor.customOrangeColor,
            action: #selector(calculateButtonDidTapped)
        )
        return devideButton
    }()
    
    // MARK: - SecondStackView
    private lazy var secondStackView: UIStackView = {
        var secondSV = createStackView()
        addArrungedSubviewTo(
            stackView: secondSV,
            subviews: sevenButton, eightButton, nineButton, multiplyButton
        )
        return secondSV
    }()
    
    private lazy var sevenButton: UIButton = {
        var sevenButton = createCustomButton(
            text: "7",
            color: UIColor.customBlueColor,
            action: #selector(numberButtonDidTapped)
        )
        return sevenButton
    }()
    
    private lazy var eightButton: UIButton = {
        var eightButton = createCustomButton(
            text: "8",
            color: UIColor.customBlueColor,
            action: #selector(numberButtonDidTapped)
        )
        return eightButton
    }()
    
    private lazy var nineButton: UIButton = {
        var nineButton = createCustomButton(
            text: "9",
            color: UIColor.customBlueColor,
            action: #selector(numberButtonDidTapped)
        )
        return nineButton
    }()
    
    private lazy var multiplyButton: UIButton = {
        var multiplyButton = createCustomButton(
            text: "×",
            color: UIColor.customOrangeColor,
            action: #selector(calculateButtonDidTapped)
        )
        return multiplyButton
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
        var fourButton = createCustomButton(
            text: "4",
            color: UIColor.customBlueColor,
            action: #selector(numberButtonDidTapped)
        )
        return fourButton
    }()
    
    private lazy var fiveButton: UIButton = {
        var fiveButton = createCustomButton(
            text: "5",
            color: UIColor.customBlueColor,
            action: #selector(numberButtonDidTapped)
        )
        return fiveButton
    }()
    
    private lazy var sixButton: UIButton = {
        var sixButton = createCustomButton(
            text: "6",
            color: UIColor.customBlueColor,
            action: #selector(numberButtonDidTapped)
        )
        return sixButton
    }()
    
    private lazy var minusButton: UIButton = {
        var minusButton = createCustomButton(
            text: "-",
            color: UIColor.customOrangeColor,
            action: #selector(calculateButtonDidTapped)
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
        var oneButton = createCustomButton(
            text: "1",
            color: UIColor.customBlueColor,
            action: #selector(numberButtonDidTapped)
        )
        return oneButton
    }()
    
    private lazy var twoButton: UIButton = {
        var twoButton = createCustomButton(
            text: "2",
            color: UIColor.customBlueColor,
            action: #selector(numberButtonDidTapped)
        )
        return twoButton
    }()
    
    private lazy var threeButton: UIButton = {
        var threeButton = createCustomButton(
            text: "3",
            color: UIColor.customBlueColor,
            action: #selector(numberButtonDidTapped)
        )
        return threeButton
    }()
    
    private lazy var plusButton: UIButton = {
        var plusButton = createCustomButton(
            text: "+",
            color: UIColor.customOrangeColor,
            action: #selector(calculateButtonDidTapped)
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
        var zeroButton = createCustomButton(
            text: "0",
            color: UIColor.customBlueColor,
            action: #selector(numberButtonDidTapped)
        )
        return zeroButton
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
        var dotButton = createCustomButton(
            text: ".",
            color: UIColor.customBlueColor,
            action: #selector(numberButtonDidTapped)
        )
        return dotButton
    }()
    
    private lazy var equalButton: UIButton = {
        var equalButton = createCustomButton(
            text: "=",
            color: UIColor.customOrangeColor,
            action: #selector(calculateButtonDidTapped)
        )
        return equalButton
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .black
        self.addSubview(mainStackView)
        numberView.addSubview(numberLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func setNumberLabel(_ text: String) {
        if isFinishedTypingNumber {
            numberLabel.text = text
        } else {
            if text == "." {
                let isInt = floor(displayValue) == displayValue
                if !isInt {
                    return
                }
            }
            numberLabel.text = (numberLabel.text ?? "") + text
        }
    }
    
    func changeFinishedBoolValue(_ boolValue: Bool) {
        isFinishedTypingNumber = boolValue
    }
    
    func setNumberText(_ text: Double) {
        displayValue = text
    }
    
    // MARK: - Private Actions
    @objc private func numberButtonDidTapped(sender: UIButton) {
        if let numValue = sender.currentTitle {
            numberButtonAction?(numValue)
        }
    }
    
    @objc private func calculateButtonDidTapped(sender: UIButton) {
        if let numValue = sender.currentTitle {
            calculateButtonAction?(numValue, displayValue)
        }
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
    
    private func addArrungedSubviewTo(stackView: UIStackView, subviews: UIView...) {
        subviews.forEach { button in
            stackView.addArrangedSubview(button)
        }
    }
    
    private func createCustomButton(text: String, color: UIColor, action: Selector) -> UIButton {
        let customButton = UIButton(type: .system)
        customButton.setTitle(text, for: .normal)
        customButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        customButton.backgroundColor = color
        customButton.setTitleColor(.white, for: .normal)
        customButton.addTarget(
            self,
            action: action,
            for: .touchUpInside
        )
        return customButton
    }
}

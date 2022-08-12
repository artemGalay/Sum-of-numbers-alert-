//
//  ViewController.swift
//  HW-Code-The Swift Dev-3-Alert
//
//  Created by Артем Галай on 12.08.22.
//

import UIKit

class ViewController: UIViewController {

    private lazy var hiLabel: UILabel = {
        let label = UILabel()
        label.text = "Привет,"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: label.font.fontName, size: 36)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var summButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.tintColor = .white
        button.layer.cornerRadius = 12
        button.setTitle("СЛОЖЕНИЕ", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var summLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: label.font.fontName, size: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setContraints()
    }

    //MARK: - Загрузка алерта вместе с экраном:

    override func viewDidAppear(_ animated: Bool) {
        playerName(title: "Привет!", message: "Введите ваше имя:", style: .alert)
    }

    private func setupView() {
        view.backgroundColor = .green
        view.addSubview(hiLabel)
        view.addSubview(summButton)
        view.addSubview(summLabel)
    }

    //MARK: - Ввод имени:

    private func playerName(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            let text = alertController.textFields?.first
            self.hiLabel.text! += (text?.text!)! + ("!")
        }
        alertController.addTextField { (textField) in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

    @objc private func buttonTapped() {
        summ(title: "Введи два числа", message: "Нажми на СЛОЖИТЬ!", style: .alert)
    }

    func summ(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "СЛОЖИТЬ", style: .default) { (action) in
            let firstNumber = alertController.textFields?[0]
            let secondNumber = alertController.textFields?[1]
            let summ: Int = Int(firstNumber?.text ?? "0")! + Int(secondNumber?.text ?? "0")!
            self.summLabel.text! = String(summ)
        }
        alertController.addTextField { (textField) in
        }
        alertController.addTextField { (textField) in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }

    private func setContraints() {

        NSLayoutConstraint.activate([
            hiLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            hiLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            hiLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])

        NSLayoutConstraint.activate([
            summButton.topAnchor.constraint(equalTo: hiLabel.bottomAnchor, constant: 100),
            summButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            summButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            summButton.heightAnchor.constraint(equalToConstant: 70)
        ])

        NSLayoutConstraint.activate([
            summLabel.topAnchor.constraint(equalTo: summButton.bottomAnchor, constant: 100),
            summLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            summLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            summLabel.heightAnchor.constraint(equalToConstant: 70)
        ])
}
}

//
//  LoginViewController.swift
//  SeSAC_Lotto
//
//  Created by 박태현 on 2023/09/13.
//

import UIKit
import SnapKit
import Then

final class LoginViewController: UIViewController {

    private lazy var nameTextField = UITextField().then {
        $0.placeholder = "이름을 입력하세요"
        $0.textColor = .label
        $0.addTarget(self, action: #selector(nameTextFieldValueChanged(_:)), for: .editingChanged)
    }

    private lazy var emailTextField = UITextField().then {
        $0.placeholder = "이메일을 입력하세요"
        $0.textColor = .label
        $0.addTarget(self, action: #selector(emailTextFieldValueChanged(_:)), for: .editingChanged)
    }

    private lazy var passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력하세요"
        $0.textColor = .label
        $0.addTarget(self, action: #selector(passwordTextFieldValueChanged(_:)), for: .editingChanged)
    }

    private lazy var loginButton = UIButton().then {
        $0.backgroundColor = .systemGreen
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.label, for: .normal)
        $0.setTitleColor(.systemGray, for: .disabled)
        $0.layer.cornerRadius = 10.0
        $0.layer.masksToBounds = true
    }

    private let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        configureUI()
        configureLayout()
        bindViewModel()
    }

}

private extension LoginViewController {

    func configureUI() {
        view.backgroundColor = .systemBackground
    }

    func configureLayout() {
        [
            nameTextField, emailTextField, passwordTextField, loginButton
        ].forEach { view.addSubview($0) }

        nameTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(80)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(80)
            $0.height.equalTo(40)
        }

        emailTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(80)
            $0.top.equalTo(nameTextField.snp.bottom).offset(20)
            $0.height.equalTo(40)
        }

        passwordTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(80)
            $0.height.equalTo(40)
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
        }

        loginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.keyboardLayoutGuide.snp.top).offset(-40)
            $0.height.equalTo(40)
            $0.width.equalTo(120)
        }
    }

    func bindViewModel() {
        viewModel.isValid.bind { [weak self] in
            guard let self else { return }
            loginButton.isEnabled = $0
            loginButton.backgroundColor = $0 ? .systemGreen : .systemGray6
        }
    }

    // MARK: - Actions

    @objc func nameTextFieldValueChanged(_ sender: UITextField) {
        viewModel.name.value = sender.text!
        viewModel.checkValidation()
    }

    @objc func emailTextFieldValueChanged(_ sender: UITextField) {
        viewModel.email.value = sender.text!
        viewModel.checkValidation()
    }

    @objc func passwordTextFieldValueChanged(_ sender: UITextField) {
        viewModel.password.value = sender.text!
        viewModel.checkValidation()
    }

    @objc func signInButtonTouched(_ sender: UIButton) {
        if viewModel.isValid.value {

        }
    }

}


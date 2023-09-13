//
//  LottoViewController.swift
//  SeSAC_Lotto
//
//  Created by 박태현 on 2023/09/13.
//

import UIKit

final class LottoViewController: UIViewController {

    private lazy var label1 = UILabel().then {
        $0.text = "1번째 번호:"
    }
    private lazy var label2 = UILabel().then {
        $0.text = "2번째 번호:"
    }
    private lazy var label3 = UILabel().then {
        $0.text = "3번째 번호:"
    }
    private lazy var label4 = UILabel().then {
        $0.text = "4번째 번호:"
    }
    private lazy var label5 = UILabel().then {
        $0.text = "5번째 번호:"
    }
    private lazy var label6 = UILabel().then {
        $0.text = "6번째 번호:"
    }
    private lazy var label7 = UILabel().then {
        $0.text = "보너스 번호:"
    }
    private lazy var dateLabel = UILabel().then {
        $0.text = "당첨금:"
    }

    private lazy var stackView = UIStackView().then {
        $0.spacing = 10.0
        $0.axis = .vertical
        $0.distribution = .fill
    }

    private let viewModel = LottoViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureLayout()

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self else { return }
            viewModel.fetchAPI(with: 1000)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 7) { [weak self] in
            guard let self else { return }
            viewModel.fetchAPI(with: 1022)
        }

        bindViewModel()
    }

    func configureUI() {
        view.backgroundColor = .systemBackground
    }

    func configureLayout() {
        [
            stackView, dateLabel
        ].forEach { view.addSubview($0) }

        [
            label1, label2, label3, label4, label5, label6,
            label7
        ].forEach { stackView.addArrangedSubview($0) }

        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(80)
            $0.horizontalEdges.equalToSuperview().inset(80)
        }
        dateLabel.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo (stackView.snp.bottom).offset(20)
            $0.horizontalEdges.equalTo(stackView)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
    }

    func bindViewModel() {
        viewModel.lotto.bind { [weak self] in
            guard let self, let data = $0
            else { return }

            DispatchQueue.main.async { [self] in
                self.label1.text = "\(data.drwtNo1)"
                self.label2.text = "\(data.drwtNo2)"
                self.label3.text = "\(data.drwtNo3)"
                self.label4.text = "\(data.drwtNo4)"
                self.label5.text = "\(data.drwtNo5)"
                self.label6.text = "\(data.drwtNo6)"
                self.label7.text = "\(data.bnusNo)"
            }
        }

        viewModel.lottoPrice.bind { [weak self] in
            guard let self, let text = $0 else { return }
            DispatchQueue.main.async { [self] in
                self.dateLabel.text = text
            }
        }
    }

}

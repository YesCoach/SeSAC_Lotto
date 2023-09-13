//
//  LottoViewModel.swift
//  SeSAC_Lotto
//
//  Created by 박태현 on 2023/09/13.
//

import Foundation

final class LottoViewModel {

    let errorContent: CustomObservable<(String?, String?)> = .init((nil, nil))
    let lotto: CustomObservable<Lotto?> = .init(nil)
    let lottoPrice: CustomObservable<String?> = .init(nil)

    func fetchAPI(with drwNo: Int) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(drwNo)"

        guard let url = URL(string: url) else { return }

        let request = URLRequest(url: url)
        dump(request)

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            guard let self else { return }

            if let error {
                errorContent.value = ("오류가 발생했습니다", error.localizedDescription)
                return
            }

            guard let response = response as? HTTPURLResponse
            else {
                errorContent.value = ("오류가 발생했습니다", "응답을 받지 못했습니다.")
                return
            }

            guard (200...299).contains(response.statusCode)
            else {
                errorContent.value = ("요청에 실패했습니다", "상태코드: \(response.statusCode)")
                return
            }

            if let data,
               let decodedData = try? JSONDecoder().decode(Lotto.self, from: data),
                let formattedString = NumberFormatter.convertData(number: decodedData.totSellamnt)
            {
                lotto.value = decodedData
                lottoPrice.value = "당첨금:" + formattedString
            }
        }.resume()
    }
}

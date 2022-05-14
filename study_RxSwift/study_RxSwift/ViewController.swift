//
//  ViewController.swift
//  study_RxSwift
//
//  Created by Hyunwoo Jang on 2022/05/14.
//

import RxSwift
import UIKit


/// 메인 화면
class ViewController: UIViewController {
    
    /// 메인 화면 테이블뷰
    @IBOutlet weak var listTableView: UITableView!
}



/// 메인 화면 테이블뷰 데이터 관리
extension ViewController: UITableViewDataSource {
    
    /// 섹션에 표시할 셀 수를 리턴합니다.
    /// - Parameters:
    ///   - tableView: 메인 화면 테이블뷰
    ///   - section: 섹션 인덱스
    /// - Returns: 섹션 행의 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    /// 행 별로 다른 셀을 구성합니다.
    /// - Parameters:
    ///   - tableView: 메인 화면 테이블뷰
    ///   - indexPath: 섹션 인덱스
    /// - Returns: 구성한 셀
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Alert"
            
        default:
            fatalError()
        }
        
        
        return cell
    }
}



/// 메인 화면 테이블뷰 탭 이벤트 처리
extension ViewController: UITableViewDelegate {
    
    /// 셀을 탭하면 그에 해당하는 화면으로 이동합니다.
    /// - Parameters:
    ///   - tableView: 메인 화면 테이블뷰
    ///   - indexPath: 섹션 인덱스
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "alert", sender: nil)
            
        default:
            break
        }
    }
}

/*:
 테이블뷰 화면 전환 참고 블로그: https://greatpapa.tistory.com/48
 */

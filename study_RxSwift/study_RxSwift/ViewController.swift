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
    
    /// 섹션의 개수를 리턴합니다.
    /// - Parameter tableView: 메인 화면 테이블뷰
    /// - Returns: 섹션의 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
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
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = "Alert"
        
        case 1:
            cell.textLabel?.text = "Binding"
            
        case 2:
            cell.textLabel?.text = "Driver"
        
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
        switch indexPath.section {
        case 0:
            performSegue(withIdentifier: "alert", sender: nil)
        
        case 1:
            performSegue(withIdentifier: "binding", sender: nil)
            
        case 2:
            performSegue(withIdentifier: "driver", sender: nil)
            
        default:
            break
        }
    }
    
    
    /// 섹션 헤더의 높이를 지정합니다.
    /// - Parameters:
    ///   - tableView: 메인 화면 테이블뷰
    ///   - section: 섹션
    /// - Returns: 헤더의 높이
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    
    /// 행의 높이를 지정합니다.
    /// - Parameters:
    ///   - tableView: 메인 화면 테이블뷰
    ///   - indexPath: 섹션 인덱스
    /// - Returns: 행의 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

/*:
 테이블뷰 화면 전환 참고 블로그: https://greatpapa.tistory.com/48
 */

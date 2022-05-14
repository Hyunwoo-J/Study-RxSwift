//
//  AlertViewController.swift
//  study_RxSwift
//
//  Created by Hyunwoo Jang on 2022/05/14.
//

import NSObject_Rx
import RxCocoa
import RxSwift
import UIKit


/// 경고창 관련 화면
class AlertViewController: UIViewController {
    
    /// 경고창을 띄우는 버튼
    @IBOutlet weak var alertBtn: UIButton!
    
    
    /// 경고창 옵저버블을 생성합니다.
    /// - Returns: String 형식의 옵저버블
    func makeAlertObservable() -> Observable<String> {
        return Observable<String>.create { ob in
            let alert = UIAlertController(title: "알림", message: "알림창입니다.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "확인", style: .default) { _ in
                ob.onNext("확인")
                ob.onCompleted() // 더 이상 전달되는 이벤트가 없기 때문에 onCompleted 메소드를 호출해줘야 한다.
            }
            alert.addAction(okAction)
            
            let cancelAction = UIAlertAction(title: "취소", style: .cancel) { _ in
                ob.onNext("취소")
                ob.onCompleted()
            }
            alert.addAction(cancelAction)
            
            self.present(alert, animated: true)
            
            return Disposables.create {
                alert.dismiss(animated: true)
            }
        }
    }
    
    
    /// 초기화 작업을 실행합니다.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertBtn.rx.tap
            .flatMap { self.makeAlertObservable() } // 옵저버블 바꿔치기
            .subscribe(onNext: { print($0) })
            .disposed(by: rx.disposeBag)
    }
}

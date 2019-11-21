## 미션 - 전구를 확대하거나 축소할 수 있는 버튼 추가하기

### 요구사항

- '수정화면'에 버튼을 추가한다.
- 메인화면의 이미지가 축소된 상태면 버튼 이름이 '확대', 확대된 상태면 버튼 이름이 '축소'로 나타나게 한다.
- 버튼을 클릭하면 확대 / 축소가 바뀌면서 표시되게 한다.
- 이미 전구가 확대된 상태라면 버튼 이름이 확대여도 더 이상 확대되지 않도록 한다. (축소도 마찬가지)

<br />

<br />

각각의 View Controller에 `isZoom` 이라는 Bool 타입의 변수를 추가해서 현재 상태를 저장하고, 해당 정보를 각 뷰들이 주고받을 수 있도록 했다. 버튼 액션에 대한 내용은 생략하겠음!

<br />

📋 EditDelegate

```swift
protocol EditDelegate {
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool)
}
```

프로토콜에 `didImageZoomDone` 메소드 추가해서 메인 뷰에 정보를 전달하도록 했다.

<br/>

📋 ViewController

```swift
    func didImageZoomDone(_ controller: EditViewController, isZoom: Bool) {
        if self.isZoom != isZoom {
            self.isZoom = isZoom
            
            let scale:CGFloat = 2.0
            var newWidth:CGFloat, newHeight:CGFloat

            if isZoom {
                newWidth = imgView.frame.width * scale
                newHeight = imgView.frame.height * scale
            } else {
                newWidth = imgView.frame.width / scale
                newHeight = imgView.frame.height / scale
            }
            
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        }
    }
```

`didImageZoomDone` 메소드 추가해 수정화면에서의 정보를 받는다.

받은 `isZoom` 이라는 변수가 현재 뷰 컨트롤러에 저장되어있는 `isZoom` 변수 값과 다르다면 사이즈를 변경한다. (요구사항 4번)
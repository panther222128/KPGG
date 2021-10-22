# KPGG

---

## 메인 스크린 및 메인 셀

첫 스크린이며 가장 상위에 있는 가장 큰 셀 선택 시 해당 그룹의 멤버 리스트를 보여줍니다. 멤버 리스트를 스크롤하다가 특정 멤버의 프로필을 확인할 수 있으며, 해당 멤버의 프로필은 스크롤로 아래의 내용까지 확인할 수 있습니다.

### 첫 스크린

<img src="https://user-images.githubusercontent.com/61342175/138507008-11f28509-5440-464b-998a-b84179bcf686.png" width = 250 align = center>

---

## 메인 셀 선택 시

<img src="https://ibb.co/kJRDGVF)" width = 250 align = left>

### 메인 셀 선택 및 특정 멤버 선택시 

<img src="https://user-images.githubusercontent.com/61342175/138507065-04cb171b-0bf0-40a4-9db0-b6f26b7692c8.png" width = 250 align = center>

---

## 메인 스크린의 스크롤

메인 스크린은 위아래 스크롤이 가능하며, 스크롤 시 아래의 섹션을 확인할 수 있습니다. 각 섹션은 좌우로 스크롤이 가능합니다. 스크롤 시 오른쪽에 있는 그룹의 이미지 및 그룹명을 확인할 수 있습니다.

<img src="https://user-images.githubusercontent.com/61342175/138507390-b27e10d0-96a9-47ae-83ec-b9064b458006.png" width = 250 align = left>

<img src="https://user-images.githubusercontent.com/61342175/138507398-c46c2ac1-dc47-4254-8b52-84636bcb4a9d.png" width = 250 align = center>

---

## 그룹 셀 선택 시 스크린

그룹 셀 선택 시 그룹의 멤버를 리스트로 보여줍니다. 멤버를 선택하면 멤버의 간단한 프로필을 확인할 수 있으며, 아래에 있는 '대표곡 듣기' 버튼을 탭하면 해당 그룹의 대표곡 뮤직비디오를 재생합니다.

<img src="https://user-images.githubusercontent.com/61342175/138507619-38fc4a23-05fa-4550-bd94-51913420e4d9.png" width = 250 align = left>

<img src="https://user-images.githubusercontent.com/61342175/138507623-89296db3-a942-4b5b-85a3-4f4a3d1ae9d6.png" width = 250 align = center>

---

## 멤버 프로필 스크린

멤버의 프로필을 볼 수 있는 스크린이며, 스크롤을 통해 아래 내용을 확인할 수 있습니다.

<img src="https://user-images.githubusercontent.com/61342175/138507974-71105d62-8735-4b1b-a326-7c8434ce92d1.png" width = 250 align = left>

<img src="https://user-images.githubusercontent.com/61342175/138507979-181b4aba-aca9-49dc-8f82-04bc283b825c.png" width = 250 align = center>

---

## 대표곡 재생 스크린

그룹 셀 선택에서 대표곡 듣기 버튼을 탭하면 재생하는 뮤직비디오 스크린입니다.

<img src="https://user-images.githubusercontent.com/61342175/138508216-70f53b7f-659e-40da-bca8-a1f452fe0d2e.png" height = 250 align = center>

---

## 배경

아래 링크에 해당하는 간단한 프로젝트를 만들었습니다.

<https://github.com/panther222128/MVVM-with-RxSwift>

내용은 평소 좋아하는 걸그룹 오마이걸 멤버의 프로필을 볼 수 있는 앱입니다. 데이터가 많지 않은 만큼 포스트맨을 통해 JSON API를 생성하고, 테이블 뷰에서 걸그룹 오마이걸의 멤버의 리스트를 보여주도록 했습니다. 테이블 뷰의 셀을 탭하면 해당 멤버의 간단한 프로필을 볼 수 있습니다. 생성한 JSON은 아래 링크에서 확인할 수 있습니다. 링크에서 멤버 이름을 클릭하면 해당 멤버의 프로필을 볼 수 있습니다. 나무위키에서 참고했으며 참고한 나무위키 링크에서 저장한 JSON 데이터를 확인할 수 있습니다.

오마이걸 멤버 프로필 JSON Mock API
<https://544a9ef9-2c3c-441a-824b-97788c0761e8.mock.pstmn.io/omgtest/main/memberinfo>

나무위키 오마이걸
<https://namu.wiki/w/%EC%98%A4%EB%A7%88%EC%9D%B4%EA%B1%B8>

조금 더 범위가 넓고 깊은 프로젝트를 만들어보고자 떠올린 것은 오마이걸이라는 걸그룹뿐만 아니라 다른 걸그룹도 소개할 수 있는 앱을 만들어보겠다는 생각이었습니다. 나무위키에서 걸그룹을 검색하면 아래 링크로 연결됩니다.

나무위키 걸그룹 검색 결과
<https://namu.wiki/w/%EA%B1%B8%EA%B7%B8%EB%A3%B9>

분류된 내역은 데뷔 연도에 따라 나눠집니다. 정확히 설명하면 히트곡이 있는 걸그룹의 분류만을 포함합니다.

1. 2006~2008년 걸그룹
2. 2010~2011년 걸그룹
3. 2012~2013년 걸그룹
4. 2014~2015년 걸그룹
5. 2016~2019년 걸그룹
6. 2020년 걸그룹

### 구현 시 포함할 데이터 기준

먼저 첫 번째인 '2006~2008년 걸그룹'을 보면 '써니힐'이라는 그룹은 남성 멤버가 포함되었던 적이 있었으므로 '걸그룹'이라는 기준에 벗어난다고 '임의적으로' 판단해 제외하도록 하고, 나머지 해당 연도의 그룹은 모두 포함시키기로 했습니다.

'2016~2019년 걸그룹'에서 나무위키에서 소개하고 있지는 않지만 추가적으로 포함시킨 걸그룹은 '로켓펀치'라는 걸그룹과 '프로미스나인'이라는 걸그룹입니다. 두 그룹에 대해 알게 된 계기는 오마이걸이라는 그룹이 'Dun Dun Dance'라는 곡으로 활동하는 당시 '비니'라는 멤버가 안무 중 두 그룹의 활동 곡 안무를 보여줬기 때문입니다. 아래 링크에서 확인할 수 있습니다.

[오마이걸 던던댄스] 걸그룹 안무 3개나 넣은 비니 파트 ('WE GO', 'Ring Ring', 'Roly Poly')
<https://www.youtube.com/watch?v=Prvg8Nx-ius>

위고 추는 오마이걸 비니, 던던댄스 추는 나경이 [프로미스나인/오마이걸]
<https://www.youtube.com/watch?v=wMIU6Gnq7f4&t=109s>

각 걸그룹별 대표곡 듣기 기능을 추가하려고 합니다. 나무위키 걸그룹 링크 중 히트곡 소개에서 다른 걸그룹은 가능하면 나무위키에서 소개하는 히트곡을 재생하도록 하려고 했습니다. 오마이걸의 히트곡은 두 곡으로 소개되고 있지만 나무위키에서 소개하고 있지는 않은 '비밀정원'이라는 곡을 대표곡으로 소개하려고 합니다. 프로미스나인과 로켓펀치는 나무위키에서 히트곡이 있는 걸그룹으로 소개하고 있지 않지만, 대표곡으로 각각 'WE GO'라는 곡과 'Ring Ring'이라는 곡을 대표곡으로 선택했습니다.

### 참고한 프로젝트

코드스쿼드 수료 당시 함께 수료했었던 다른 분들에 비해 제 스스로 구현 역향이 부족하다고 느껴져 만들고 있는 프로젝트들입니다. 지금껏 구현하는 프로젝트는 함께 수료했었던 'Aiden'의 프로젝트를 참고했습니다. 감사합니다. 'Aiden'

'Aiden'의 'VaccinationCenter' 앱
<https://github.com/Sonjh1306/VaccinationCenter>

함께 수료했었던 'Lollo'의 프로젝트도 참고했으며, 많은 도움을 얻을 수 있었습니다. 감사합니다. 'Lollo'

'Lollo'의 Github 레포지토리
<https://github.com/eeeesong>

## 2021.10.16

JSON 데이터 생성 시 어떤 자료구조가 적합할지 고민하는 시간을 갖는 계기가 되었습니다. JSON은 키값 쌍과 배열로 형태를 갖추는데, 표현하고자 하는 데이터의 자료구조가 어떤 것이 적합할지 고민했습니다. 다시 바뀔 수도 있지만 고민한 결과 아래에 해당하는 자료구조를 갖춘 데이터를 생성하도록 했습니다. 사용하지 않을 수도 있지만 만들어 둔 것도 있습니다.

연도별 전체
<https://544a9ef9-2c3c-441a-824b-97788c0761e8.mock.pstmn.io/omgtest/main/group>

연도별 걸그룹(first부터 seventh까지)
<https://544a9ef9-2c3c-441a-824b-97788c0761e8.mock.pstmn.io/omgtest/main/group/first>
~
<https://544a9ef9-2c3c-441a-824b-97788c0761e8.mock.pstmn.io/omgtest/main/group/seventh>

연도에 해당하는 걸그룹과 멤버
<https://544a9ef9-2c3c-441a-824b-97788c0761e8.mock.pstmn.io/omgtest/main/group/2020>
<https://544a9ef9-2c3c-441a-824b-97788c0761e8.mock.pstmn.io/omgtest/main/group/2016-2019>
<https://544a9ef9-2c3c-441a-824b-97788c0761e8.mock.pstmn.io/omgtest/main/group/2014-2015>
<https://544a9ef9-2c3c-441a-824b-97788c0761e8.mock.pstmn.io/omgtest/main/group/2012-2013>
<https://544a9ef9-2c3c-441a-824b-97788c0761e8.mock.pstmn.io/omgtest/main/group/2010-2011>
<https://544a9ef9-2c3c-441a-824b-97788c0761e8.mock.pstmn.io/omgtest/main/group/2009>
<https://544a9ef9-2c3c-441a-824b-97788c0761e8.mock.pstmn.io/omgtest/main/group/2006-2008>

연도별 각 걸그룹(/group/(영문 그룹 이름, ohmygirl 등))
예시: <https://544a9ef9-2c3c-441a-824b-97788c0761e8.mock.pstmn.io/omgtest/main/group/stayc>

익숙하지 않다보니 고민하는 시간을 충분히 가져야 했고, 모든 JSON API 생성을 포함해서 총 10시간 가량 고민하고 생성했습니다. 총 38개 걸그룹이며, 그룹별 탈퇴 및 사망한 멤버 인원을 모두 포함합니다. 모든 멤버의 수는 250명입니다. 프로필 정보에서 혈액형 및 MBTI가 알려지지 않은 경우 '알려지지 않음.'으로 입력했습니다.

## 2021.10.17

지난 하루 어떤 스크린으로 보여줄까를 동시에 고민했습니다. 넷플릭스 혹은 왓챠 스타일의 앱으로 만들어보고자 했습니다. 대표곡을 재생하려면 `AVFoundation`을 사용하면서 영상을 재생할 수 있도록 만들길 원했기 때문이며, 연도별 분류에 따라 스크롤 가능한 뷰로 보여주는 것도 괜찮겠다고 생각했기 때문입니다. 구현 테스트 및 고민에 11시간 정도 소모했습니다. (11시간에는 뷰의 라이프 싸이클에 대한 고민을 포함합니다.) 스크롤 뷰의 레이아웃 학습에 많은 시간을 할애했습니다. (중간에 이전 프로젝트에서 뷰 모델을 프로토콜 타입으로 구현하는 과정이 포함되어 있습니다.) 스크롤 뷰 내부에 이미지 뷰와 스택 뷰를 구현하고, 스택 뷰 내부에 컬렉션 뷰를 구현하려고 했습니다. 고민했던 부분은 스택 뷰 내부에서 하나의 행만을 갖고 좌우(horizontal)로 스크롤되는 컬렉션 뷰의 구현이었습니다. 외에도 어떤 뷰 형태가 적합할지 고민하는 충분한 시간을 가졌습니다.

하나의 행만을 갖는 컬렉션 뷰의 구현을 검색해본 결과 많은 자료가 나오지 않았습니다. 그래서 떠올렸던 것은 코드스쿼드 수료 중 알게 되었던 'DiffableDataSource'였습니다. 아래 자료를 살펴봤던 기억이 있어 다시 살펴보기로 했습니다.

Implementing Modern Collection Views
<https://developer.apple.com/documentation/uikit/views_and_controls/collection_views/implementing_modern_collection_views>

자료를 확인하면 'EmojiExplorerViewController' 중 가장 위에 있는 섹션의 뷰가 좌우로 스크롤되는 뷰입니다. 스택 뷰에서 하나의 컬렉션 뷰를 추가하고 해당 컬렉션 뷰에 일곱 가지 연도별 걸그룹 분류를 구현하려고 했습니다. **다만 이미 알고 있었음에도 테스트 구현 후에나 깨닫게 된 것은 다음과 같습니다.** 컬렉션 뷰는 `UIScrollView`를 서브클래싱한 타입입니다.

```swift
@MainActor class UICollectionView : UIScrollView
```

스택 뷰 내에 하나의 컬렉션 뷰를 구현하면 전체 스크린의 스크롤이 아니라 컬렉션 뷰 내부에서 위아래로 스크롤됩니다. 그렇기 때문에 구현하고자 하는 목적과 적합하지 않다고 판단했습니다. 일단 좌우로 스크롤되는 뷰는 Implementing Modern Collection Views에서 소개하는 것처럼 구현이 가능하니, 스택 뷰 내부에 여러 개의 좌우 스크롤 가능한 'DiffableDataSource' 컬렉션 뷰를 구현하겠다고 판단했습니다. 스택 뷰 내부에 연도별 걸그룹을 나타내는 스크롤 뷰를 추가할 예정입니다. 스택 뷰는 `UIView`를 서브클래싱한 것이기 때문에 기본적인 속성이 스크롤되지 않습니다. 컨테이너 뷰가 스크롤되기 때문에 스택 뷰의 높이에 따라 스크롤될 수 있도록 구현할 예정입니다.

```swift
@MainActor class UIStackView : UIView
```

Implementing Modern Collection Views를 참고해서 테스트를 통해 좌우로 스크롤되는 컬렉션 뷰 구현을 확인했으며, 커스텀 셀을 적용할 수 있을 것임을 확인했습니다.

## 2021.10.18

떠오른 생각 중 한 가지는 컬렉션 뷰의 속성 중 스크롤이 불가능하도록 하는 속성이 있을 수도 있다는 점이었습니다. 만약 있다면 위아래로 스크롤하지 못하도록 하고 하나의 컬렉션 뷰를 컨테이너 스택 뷰에 넣거나 스택 뷰를 포함하는 슈퍼 뷰에 넣을 수도 있다고 생각했습니다. ~~자세히 찾아본 것은 아니지만 공식 문서를 찾아봤으나 그러한 속성은 없는 것 같아 기존의 생각대로 스택 뷰 내부에 여러 개의 컬렉션 뷰('DiffableDataSource' 활용)를 넣기로 했습니다.~~

어제 생각했던 것 중 다시 이어지는 고민은 'DiffableDataSource' 활용에 관한 것으로, 'DiffableDataSource'는 활용할 때 여러 섹션을 나누고 해당 섹션을 설정할 수 있다는 점입니다. 이것이 'DiffableDataSource'의 강점이라고 생각하는데, 하나의 섹션만을 넣을 것이라면 굳이 'DiffableDataSource'를 활용해야 하는가에 대한 고민입니다. 스택 뷰 내부에 좌우로 스크롤되는 스크롤 뷰를 넣어도 될 것입니다. 그리고 해당 스크롤 뷰에 뷰 요소를 넣고 뷰 요소에 'GestureRecognizer'를 추가해도 될 것입니다. 그래도 컬렉션 뷰를 사용하려는 이유는 'DiffableDataSource'를 사용해보고 싶기도 하고, 셀 선택에 대한 설정에서 'Delegate'를 활용함으로써 더 쉽게 접근할 수 있다는 점 때문입니다.

앞서 적었던 내용에서 잘못된 부분이 있어 취소선을 남겼습니다. 컬렉션 뷰는 스크롤을 불가능하게 하는 속성을 갖고 있습니다. `UIScrollView` 자체에 해당 속성이 존재하기 때문입니다. 아래처럼 사용하거나 인터페이스 빌더에서 설정이 가능합니다.

```swift
collectionView.isScrollEnabled = false
```

UIScrollView
<https://developer.apple.com/documentation/uikit/uiscrollview>
<https://velog.io/@panther222128/UIScrollView>

결국 스크롤 불가능하게 설정한 하나의 컬렉션 뷰에서 'DiffableDataSource'를 활용해 여러 섹션으로 나눠 구현하는 것으로 결정했습니다. 스택 뷰는 제외하도록 할 예정입니다.

이후 스택 뷰를 제외하려고 했으나 레이아웃에서 어려움을 겪어 스크롤 뷰 내부에 컨테이너 뷰를 두고, 해당 컨테이너 뷰에 스택 뷰를 사용하기로 했습니다. 애플에서도 스택 뷰 사용을 권장하기도 하고, 마침 그 이유가 레이아웃 때문이기도 합니다.

UIStackView
<https://developer.apple.com/documentation/uikit/uistackview>
<https://velog.io/@panther222128/UIStackView>

아래의 문제를 해결하려고 하고 있습니다.

```swift
[UICollectionViewRecursion] cv == 0x7fc4dd80f800 Disabling recursion trigger logging
```

중간에 참고했었던 내용입니다.

<https://developer.apple.com/forums/thread/681739>

'DiffableDataSource' 구현 중 제드님께서 남겨주셨던 아래 링크에 해당하는 문제를 똑같이 겪었습니다.

<https://zeddios.tistory.com/1241>

현재 아래와 같은 모습입니다.

<img src="https://user-images.githubusercontent.com/61342175/137706647-ce375952-4323-48cb-b746-37a23420f44f.gif" width = 250 align = center>

레이아웃 설정에 어려움을 겪었습니다. 약 10시간 중 대부분의 시간을 레이아웃 설정에 할애했습니다. 어려웠던 부분은 스크롤 뷰 내부에 스택 뷰를 넣고, 스택 뷰 안에서 'DiffableDataSource' 컬렉션 뷰의 높이 설정과 관련이 있습니다. 높이를 설정하지 않으면 스크롤 뷰가 Y 위치를 갖지 못하거나 높이를 갖지 않는다고 합니다. 'DiffableDataSource'에서 섹션 추가에 따라 동적으로 높이를 설정하고 싶은데, 그렇게 하기가 어려웠습니다. 여러 가지 시도를 해봤지만 구현에 어려움을 겪었고, 결국 전체 스크린을 'DiffableDataSource'로 채울 계획입니다.

## 2021.10.19

새벽에 뷰 전체를 'DiffableDataSource' 컬렉션 뷰로 변경했습니다. 그런데 가져온 이미지 주소가 변경될 수 있다는 사실을 파악해 이에 대한 대응을 어떻게 할 것인지 고민하는 시간을 가졌습니다. 나머지 시간 동안 컬렉션 뷰의 모양을 갖추려 했습니다. 커스텀 셀의 레이아웃에 시간이 조금 걸렸습니다. 현재 모습입니다.

<img src="https://user-images.githubusercontent.com/61342175/137890361-62901eef-13cb-48b9-b760-08c4bed276fb.gif" width = 250 align = center>

네트워크, 엔드포인트, 유스케이스를 추가했습니다. 네트워크가 정상적으로 응답하는지 확인한 후 스크린에 나타나도록 했습니다. 이미지는 링크가 바뀐 것 같아 그룹 이름만 먼저 보이도록 했습니다. RxSwift, Alamofire를 사용했습니다. 현재 모습입니다.

<img src="https://user-images.githubusercontent.com/61342175/137938245-66a6170b-0dc2-4c88-aaf1-a30c871fdf05.gif" width = 250 align = center>

## 2021.10.20

새벽에 그룹별 이미지 적용 및 그룹 이름 정렬을 적용했습니다. 컨텐트 모드에 따라 아래처럼 나타나며, 이미지 크기에 영향을 받습니다.

<img src="https://user-images.githubusercontent.com/61342175/138034313-e8f9c011-9af2-42a3-af6d-c50ded47a50c.png" width = 250 align = left>

<img src="https://user-images.githubusercontent.com/61342175/138034336-5b3f55d4-41be-4437-9e87-4f8d3efff2d0.png" width = 250 align = center>

대부분의 시간을 이미지 API 생성에 시간을 할애했습니다. 250명의 이미지를 이미지 무료 호스트 사이트에서 URL로 가져와 포스트맨 API에 입력했습니다. 파이어베이스를 사용해볼까 강의 영상을 봤으나 간단하게 파싱할 데이터를 가져오는 정도로 충분하다고 판단해 사용하지 않기로 했습니다.

멤버 프로필을 볼 수 있는 화면을 생성했습니다. 아래는 현재까지 모습입니다.

<img src="https://user-images.githubusercontent.com/61342175/138115501-294b0126-0d46-4552-a44e-8a28b85ecec2.png" width = 250 align = center>

<img src="https://user-images.githubusercontent.com/61342175/138115528-055174df-5a64-48fd-b69c-e01ef50eeba2.png" width = 250 align = center>
<img src="https://user-images.githubusercontent.com/61342175/138115539-a2c204fb-dd02-44f9-90e1-1d97a7cb138b.png" width = 250 align = center>
<img src="https://user-images.githubusercontent.com/61342175/138115551-af8203ac-6bae-41a9-9af4-e13ebc269f28.png" width = 250 align = center>
<img src="https://user-images.githubusercontent.com/61342175/138115562-9b3ab766-cfaf-4189-ad72-3f20dd0402dc.png" width = 250 align = center>

## 2021.10.21

새벽에 스크린의 디테일을 수정하려고 했으나 포스트맨 요청 수 제한 문제로 새로운 API가 필요했고, 파이썬 웹 프레임워크 플라스크를 시도해서 어느 정도 구축할 수 있었습니다. 그러나 https로 만들어야 하는 등 더 알아보려면 시간이 많이 걸릴 것 같아 더 간단하게 사용할 수 있는 Open API 서비스를 찾기 시작했습니다. Stoplight.io를 사용해서 다시 API를 구축했는데, 여기서 대부분의 시간을 소모했습니다.

연도별 전체
<https://stoplight.io/mocks/panther222128/kpgg/25039489/group/>

연도별 각 걸그룹(/group/(영문 그룹 이름, ohmygirl 등))
예시1: <https://stoplight.io/mocks/panther222128/kpgg/25039489/group/STAYC>
예시2: <https://stoplight.io/mocks/panther222128/kpgg/25039489/group/OHMYGIRL>

첫 스크린 섹션에 헤더를 붙이려고 시도했는데, 여러 가지 방법이 있는 것 같습니다. 'DiffableDataSource'를 사용하고 있기 때문에 여기서 찾을 수 있는 것으로 사용하려고 했으나 이미 구현한 것이 리스트 형태이며, 헤더를 셀로 구현해야 하는 것으로 파악했습니다. 참고할 수 있는 링크를 아래에 남기겠습니다.

<https://github.com/LeeKahSeng/SwiftSenpai-UICollectionView-List>

## 2021.10.22

새벽에 디테일 수정 및 리팩토링이 있었습니다. 현재 화면은 아래와 같습니다.

<img src="https://user-images.githubusercontent.com/61342175/138335474-470be8a0-5448-4009-b1be-b413d45f3d3f.png" width = 250 align = center>

<img src="https://user-images.githubusercontent.com/61342175/138335507-b364e1de-52df-4dd3-be39-43268848ec0a.png" width = 250 align = center>

<img src="https://user-images.githubusercontent.com/61342175/138335516-fd520bfa-056f-4048-817a-95206566fca8.png" width = 250 align = center>

<img src="https://user-images.githubusercontent.com/61342175/138335528-6f5977bc-2200-4035-bf81-32fcfa131208.png" width = 250 align = center>

AVFoundation을 활용해서 영상 재생을 하려고 했으나 유튜브 링크 재생에 어려움을 겪어 YoutubePlayer_in_WKWebView를 사용했습니다. 참고한 링크를 아래에 남기겠습니다.

<https://swieeft.github.io/2020/04/09/YouTubePlayer.html>

네비게이션 바, 상태 바 색상 등의 변경이있었습니다.

메인 화면 중 가장 상단의 셀 수정 및 Kingfisher를 사용해볼 예정입니다.

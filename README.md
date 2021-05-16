# State Pattern

خب مسئله ما چی بود؟

به ساده ترین حالت فرض میکنیم یه آسانسور داریم که ۴ تا دکمه داره، دکمه های‫ :
- باز کردن
- بستن
- جابجایی
- توقف

ما باتوجه به اینکه آسانسور تو چه وضعیتی هستش میایم کاریی که این دکمه ها برای ما انجام میدن رو پیاده سازی میکنیم

مثلا وقتی آسانسور بسته هستش و ما دکمه باز کردن رو فشار میدیم در آسانسور باز میشه ولی اگر موقع حرکت کردن دکمه باز کردن رو فشار بدیم دستگاه بهمون هشدار میده که در حین حرکت در آسانسور نمیتونه باز باشه، به همین خاطر ما باید همیشه حواسمون باشه که تو چه مرحله ای چه دکمه ای فشار داده میشه

 توی پروژه اول این پیاده سازی ها انجام شده و میبینیم که شروط تو در توی‫ زیادی داخلش هست که موقع خوندن کد و یا دیباگ کردنش آدم اعصابش بهم میریزه حالا تصور کن که تعداد حالت ها و تعداد دکمه ها چند برابر بشه!
 ‫رسما فاجعه پیش میاد برای خوندن خوندن کد ها 🤯🤬

توی این حالت ما میتونیم‫ **State Pattern** رو استفاده بکنیم 😎

اگه بخوایم درمورد الگوی‫ [State](https://en.wikipedia.org/wiki/State_pattern) بخونیم یک عالمه مطلب وجود داره و صرفا تو این پروژه من نحوه استفاده‌ش رو انجام دادم که مقایسه ای بشه با حالت بدون الگو

##  مواد لازم

یک عدد پروتکل شامل متد هایی ک لازم داریم مثلا فشار دادن دکمه باز کردن آسانسور، متن روی نمایشگر، آیا موزیک در حال پلی هستش یا نه و چه و چه، شبیه این چیزی که الان نوشته شده

```swift
import AppKit

protocol ElevatorStateProtocol {

    var displayText: String { get }
    var playMusic: Bool { get }
    var lightsColor: NSColor { get }

    func pressCloseButton() -> ElevatorStateProtocol?
    func pressOpenButton() -> ElevatorStateProtocol?
    func pressMoveButton() -> ElevatorStateProtocol?
    func pressStopButton() -> ElevatorStateProtocol?
}
```

و به تعداد حالاتی که آسانسور ما داره کلاس هایی میسازیم که از این پروتکل ارث‌بری کرده باشن که به صورت زیر مشاهده میشه

```swift
import AppKit

class CloseState: ElevatorStateProtocol {

    var displayText: String = "Welcome :)"
    var playMusic: Bool = false
    var lightsColor: NSColor = .green

    func pressCloseButton() -> ElevatorStateProtocol? {
        print("Already Closed")
        return nil
    }

    func pressOpenButton() -> ElevatorStateProtocol? {
        print("Open")
        return OpenState()
    }

    func pressMoveButton() -> ElevatorStateProtocol? {
        print("Move")
        return MoveState()
    }

    func pressStopButton() -> ElevatorStateProtocol? {
        print("cannot change position from close to stop")
        return nil
    }
}
```

```swift
import AppKit

class MoveState: ElevatorStateProtocol {

    var displayText: String = "The world is beautiful :)"
    var playMusic: Bool = true
    var lightsColor: NSColor = .green

    func pressCloseButton() -> ElevatorStateProtocol? {
        print("cannot change state from move to close")
        return nil
    }

    func pressOpenButton() -> ElevatorStateProtocol? {
        print("cannot change state from move to open")
        return nil
    }

    func pressMoveButton() -> ElevatorStateProtocol? {
        print("Already Moving")
        return nil
    }

    func pressStopButton() -> ElevatorStateProtocol? {
        print("Stop")
        return StopState()
    }
}
```

```swift
import AppKit

class OpenState: ElevatorStateProtocol {

    var displayText: String = "Have a good time ;)"
    var playMusic: Bool = false
    var lightsColor: NSColor = .blue

    func pressCloseButton() -> ElevatorStateProtocol? {
        print("Close")
        return CloseState()
    }

    func pressOpenButton() -> ElevatorStateProtocol? {
        print("Already Opened")
        return nil
    }

    func pressMoveButton() -> ElevatorStateProtocol? {
        print("cannot change state from open to move")
        return nil
    }

    func pressStopButton() -> ElevatorStateProtocol? {
        print("cannot change state from open to stop")
        return nil
    }
}
```

```swift
import AppKit

class StopState: ElevatorStateProtocol {

    var displayText: String = "Have a good time ;)"
    var playMusic: Bool = false
    var lightsColor: NSColor = .blue

    func pressCloseButton() -> ElevatorStateProtocol? {
        print("Close")
        return CloseState()
    }

    func pressOpenButton() -> ElevatorStateProtocol? {
        print("Already Opened")
        return nil
    }

    func pressMoveButton() -> ElevatorStateProtocol? {
        print("cannot change state from open to move")
        return nil
    }

    func pressStopButton() -> ElevatorStateProtocol? {
        print("cannot change state from open to stop")
        return nil
    }
}
```

‫و حالا میرسیم به اصل کاریه که یه کلاسی هستش که یه آبجتکی از **State**  رو داخل خودش نگه میداره، که همه جا بهش میگن **Context** و من اسمش رو گذاشتم **Elevator** و تمامی انتظاراتی که داریم رو هم داخلش مینویسیم، دقیقا مثل زیر که اکشن هایی که روی آسانسور انجا میشه تا **State**  آسانسور تعیین بشه و اطلاعاتی که از State ها میخوایم رو بر حسب نیاز توش میاریم مثلا فشار دادن دکمه های آسانسور، گرفتن اطلاعاتی مثل رنگ چراغ آسانسور و و و و ... 

```swift
import AppKit

class Elevator {

    private var state: ElevatorStateProtocol!

    init() {
        self.setState(state: CloseState())
    }

    private func setState(state: ElevatorStateProtocol?) {
        guard let state = state else { return }
        self.state = state
    }

    func close() {
        self.setState(state: self.state?.pressCloseButton())
    }

    func open() {
        self.setState(state: self.state?.pressOpenButton())
    }

    func move() {
        self.setState(state: self.state?.pressMoveButton())
    }

    func stop() {
        self.setState(state: self.state?.pressStopButton())
    }
    
    var displayText: String {
        return state.displayText
    }
    
    var lightColor: NSColor {
        return state.lightsColor
    }
    
    var isPlayMusic: Bool {
        return state.playMusic
    }
}
```

‫دیگه اینجا کار تمومه و همه چی آمادست، حالا کافیه یه نمونه از کلاس **Elevator** بسازیم و دیگ باهاش حال کنیم از راحتی کار 😍

‫مثل چیزی که توی **Main** نوشته شده اگه پروژه رو **Run** کنیم میتونیم به ترتیب لاگ های پروژه رو ببینیم که وضعیت ها چطوری تغییر کردن

```swift
import AppKit

let context = Elevator()

context.open()
print("\(context.displayText)\n")

context.close()
print("\(context.displayText)\n")

context.move()
print("\(context.displayText)\n")

context.open()
print("")

context.stop()
print("\(context.displayText)\n")

context.open()
print("\(context.displayText)\n")
```

 و اینم نتیجه لاگ

```text
Open
Have a good time ;)

Close
Welcome :)

Move
The world is beautiful :)

cannot change state from move to open

Stop
We reached our destination

Open
Have a good time ;)

Program ended with exit code: 0
```

 
## خب حالا مگه سرمون درد میکرد که از این استفاده کردیم و این همه کلاس ساختیم؟
باید بگم آره‫ 😏

چرا؟

‫به چند دلیل:

اول: کد مربوط به‫ **state** هاداخل کلاس‌های جداگونه سازماندهی میشن - اصل **Single Responsibility**

دوم: حالتا یا‫ **state** های جدید، بدون تغییر توی کلاسای **State** قبلی یا کلاس **Elevator** معرفی میشن - اصل **Open/Closed** 

سوم: یه عالمه شرط و شروط سرسام آور از توی‫ **Elevator** حذف شد که کلی خوندن و نگهداری کد رو راحت میکنه

## 
 ‫⚠️ فقط حواسمون باشه که استفاده کردن از‫ **State Pattern** برای وقتایی که تعداد  حالات و یا اکشن های مسئله کم هستن ممکنه فقط باعث پیچیدگی کد بشه، پس حواسمون باشه که ما از **Pattern** ها استفاده میکنیم که مشکلات مارو حل بکنن نه اینکه یه مشکلی به مشکلای قبلیمون اضافه بشه 😁.
 
##

// 定义轮播图数据的接口
interface SwiperItem {
  id: number,
  backgroundColor: ResourceColor,
  text: string,
  message: string
}

@Entry
@Component
struct Index {
  @State swiperData: SwiperItem[] = [
    { id: 1, backgroundColor: Color.Red, text: '轮播1', message: '点击了轮播1' },
    { id: 2, backgroundColor: Color.Blue, text: '轮播2', message: '点击了轮播2' },
    { id: 3, backgroundColor: Color.Green, text: '轮播3', message: '点击了轮播3' }
  ]

  @State swiperIndex: number = 0
  @State message: string = '@Extend-扩展组件(样式,事件)'

  build() {
    Column() {
      // 标题
      Text(this.message)
        .textFn()
      
      // 基础轮播图
      Swiper() {
        ForEach(this.swiperData, (item: SwiperItem) => {
          Text(item.text)
            .bannerItem(item.backgroundColor, item.message)
        }, (item: SwiperItem) => item.id.toString())
      }
      .width('100%')
      .height(200)
      .loop(true)
      .autoPlay(true)
      .interval(3000)
      .vertical(false)
      .indicator(true)

      // 自定义样式轮播图
      Swiper() {
        Text('1')
          .bannerItem(Color.Orange, '轮播图1号')
        Text('2')
          .bannerItem(Color.Brown, '轮播图2号')
        Text('3')
          .bannerItem(Color.Green, '轮播图3号')
      }
      .width('100%')
      .height(160)
      .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
  }

  @Builder private customIndicator(): void {
    Row({ space: 10 }) {
      ForEach(this.swiperData, (item: SwiperItem, index: number) => {
        Circle({ width: 8, height: 8 })
          .fill(this.swiperIndex === index ? Color.White : Color.Gray)
      }, (item: SwiperItem): string => item.id.toString())
    }
    .position({ x: '40%', y: '90%' })
  }
}

@Extend(Text) function textFn() {
  .fontSize(20)
  .fontWeight(FontWeight.Bold)
}

@Extend(Text) function bannerItem(bgColor: ResourceColor, msg: string) {
  .width('100%')
  .height('100%')
  .textAlign(TextAlign.Center)
  .backgroundColor(bgColor)
  .fontColor(Color.White)
  .fontSize(30)
  .fontWeight(FontWeight.Bold)
  .onClick(() => {
    AlertDialog.show({
      title: '提示',
      message: msg,
      confirm: {
        value: '确定',
        action: () => {
          console.info(`点击了确定按钮: ${msg}`)
        }
      }
    })
  })
}


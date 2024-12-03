//Swiper轮播组件基础
@Entry
@Component
struct Index {
  build() {
    Column() {
      Swiper() {
        Text('首页轮播1')
          .backgroundColor(Color.Red)
        Text('首页轮播2')
          .backgroundColor(Color.Blue)
        Text('首页轮播3')
          .backgroundColor(Color.Green)
      }
      .width('100%')
      .height(200)
    }
  }
}
//自动播放和循环的Swiper轮播
@Entry
@Component
struct Index {
  build() {
    Column() {
      Swiper() {
        Text('自动播放1')
          .backgroundColor(Color.Red)
        Text('自动播放2')
          .backgroundColor(Color.Blue)
        Text('自动播放3')
          .backgroundColor(Color.Green)
      }
      .width('100%')
      .height(200)
      .loop(true) // 开启循环
      .autoPlay(true) // 自动播放
      .interval(3000) // 自动播放间隔3秒
      .vertical(false) // 横向轮播
    }
  }
}


///////////////////////////////////////////////////////////////
//定制指示器样式
@Entry
@Component
struct Index {
  build() {
    Column() {
      Swiper() {
        Text('定制指示器1')
          .backgroundColor(Color.Red)
        Text('定制指示器2')
          .backgroundColor(Color.Blue)
        Text('定制指示器3')
          .backgroundColor(Color.Green)
      }
      .width('100%')
      .height(200)
      .indicator(
        Indicator.dot()
          .itemWidth(15)
          .itemHeight(15)
          .color(Color.Gray)
          .selectedItemWidth(20)
          .selectedItemHeight(20)
          .selectedColor(Color.White)
      )
    }
  }
}


////////////////////////////////////////////
//使用扩展函数简化Swiper轮播图的开发
@Extend(Text)
function textFn() {
  .fontSize(20)
  .fontWeight(FontWeight.Bold)
}

@Extend(Text)
function bannerItem(bgColor: ResourceColor, msg: string) {
  .textAlign(TextAlign.Center)
  .backgroundColor(bgColor)
  .fontColor(Color.White)
  .fontSize(30)
  .onClick(() => {
    AlertDialog.show({
      message: msg
    })
  })
}

@Entry
@Component
struct Extends_demo {
  @State message: string = '@Extend-扩展组件(样式,事件)';

  build() {
    Column() {
      Text(this.message)
        .textFn()

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
    }
    .width('100%')
    .height('100%')
  }
}


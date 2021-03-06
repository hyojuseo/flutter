import 'package:clone_instagram/components/image_data.dart';
import 'package:clone_instagram/controller/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({Key? key}) : super(key: key);

  @override
  _SearchFocusState createState() => _SearchFocusState();
}

//뒤로가기버튼, 검색부분, Tapdrawable 해당페이지 보여주는 탭 슬라이드 구현
class _SearchFocusState extends State<SearchFocus>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    //this를 사용하기 위해서 with TickerProviderStateMixin을 해줘야 된다.
    tabController = TabController(length: 5, vsync: this);
  }

  Widget _tabMenuOne(String menu) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        menu,
        style: const TextStyle(fontSize: 15, color: Colors.black),
      ),
    );
  }

  PreferredSizeWidget _tabMenu() {
    return PreferredSize(
      child: Container(
        height: 50,
        width: Size.infinite.width, //전체Size
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xffe4e4e4)))),
        //TabBar는 controller를 필요로 한다.
        //TabController의 length가 5이므로 5개보다 적거나 많으면 error발생
        child: TabBar(
            controller: tabController,
            //해당 tab 밑줄 color 변경
            indicatorColor: Colors.black,
            tabs: [
              _tabMenuOne('인기'),
              _tabMenuOne('계정'),
              _tabMenuOne('오디오'),
              _tabMenuOne('태그'),
              _tabMenuOne('장소'),
            ]),
      ),
      //Size.fromHeight(50): 50만큼 떨어지고 밑에 붙는 것이다.
      //AppBar().preferredSize.height: device의 AppBar의 높이만큼 사이즈.
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
    );
  }

  Widget _body() {
    return TabBarView(
      controller: tabController,
      children: const [
        Center(
          child: Text('인기페이지'),
        ),
        Center(
          child: Text('계정페이지'),
        ),
        Center(
          child: Text('오디오페이지'),
        ),
        Center(
          child: Text('태그페이지'),
        ),
        Center(
          child: Text('장소페이지'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: BottomNavController.to.willPopAction,
          //Get.find<BottomNavController>().willPopAction();
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(IconsPath.backBtnIcon),
          ),
        ),
        //title에도 기본적으로 padding이 있는것 같다.
        //그러므로 titleSpacing으로 간격을 제거해준다.
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xffefefef)),
          child: const TextField(
            //none을 하지 않으면 line이 생긴다.
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '검색',
                contentPadding: EdgeInsets.only(left: 15, top: 7, bottom: 7),
                //padding을 주는 만큼 간격이 넓어진다.
                isDense: true),
          ),
        ),

        //appbar처럼 height가 지정되어있는것을 넣어줘야 된다.
        bottom: _tabMenu(),
      ),
      body: _body(),
    );
  }
}

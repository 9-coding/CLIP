import 'package:flutter/material.dart';



Widget CommentBox(){
  return Container(
    width: 326,
    height: 95,
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: const Color(0xFFA4D1B1),
      borderRadius: BorderRadius.circular(15),
    ),
    child: const Text(
      '설명 문구를 입력하세요',
      textAlign: TextAlign.center, // 설명 문구 가운데 정렬
      style: TextStyle(
        fontFamily: 'Istok Web',
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}

Widget UploadBox(_getImage, _image){
  return GestureDetector(
    onTap: _getImage,
    child: Container(
      width: 326,
      height: 312,
      margin: const EdgeInsets.only(top: 30), // 설명문구 네모칸 아래에 30만큼의 여백 추가
      decoration: BoxDecoration(
        color: Colors.white, // 흰색 배경
        borderRadius: BorderRadius.circular(15), // 네 모서리 라운드 처리
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '음식을 다 먹고 빈 그릇을 찍어\n업로드해주세요.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w400, // Regular
              color: Colors.black, // 텍스트 색상 변경
            ),
          ),
          const SizedBox(height: 20),
          _image == null
              ? Container(
            width: 242,
            height: 199,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                size: 40,
                color: Color(0xFF888888),
              ),
            ),
          )
              : Image.file(_image!),
        ],
      ),
    ),
  );
}

Widget SubmitButton() {
  return SizedBox(
    width: 326,
    height: 68,
    child: ElevatedButton(
      onPressed: () {
        // 제출하기 버튼 누를 때 수행할 동작 추가
      },
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFFFAE474), // 버튼 배경색
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // 버튼을 라운드 처리
        ),
      ),
      child: const Text(
        '제출하기',
        style: TextStyle(
          fontFamily: 'Work Sans', // 글자체
          fontSize: 26, // 글자 크기
          fontWeight: FontWeight.w500, // Medium 처리
        ),
      ),
    ),
  );
}
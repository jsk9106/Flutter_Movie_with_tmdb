# flutter_movie_tmdb

The Movie Database 에서 API를 받아와 만든 프로젝트이다.
인기영화 리스트를 불러와 화면에 출력한다.
출력된 리스트를 클릭하면 상세보기 페이지로 들어간다.
GetxController를 사용하여 view단과 데이터를 불러오는 단을 분리했다.
스크롤을 다 내리면 새로운 정보를 불러오는 인피니티 스크롤을 사용하였다.
getWidget 패키지의 GFRating 위젯을 사용하여 별모양의 평점을 만들었다.
Firebase와 연동하여 리뷰를 시스템을 만들었다.
Google 로그인이 가능하며 로그인 후 리뷰작성이 가능하다.
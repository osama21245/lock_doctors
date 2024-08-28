class HomeCategories {
  String image;
  String name;

  HomeCategories({required this.image, required this.name});
}

List<HomeCategories> homeCategories = [
  HomeCategories(
      image: "assets/image/add_session.png", name: "Add specific session"),
  HomeCategories(
      image: "assets/image/search_about_student.png",
      name: "Search about student"),
  HomeCategories(
      image: "assets/image/courses and levels.png", name: "Courses And Levels"),
  HomeCategories(image: "assets/image/sessions.png", name: "Sessions  "),
];

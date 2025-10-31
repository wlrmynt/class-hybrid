class Course {
  final String title;
  final String instructor;
  final String thumbnail;
  final double progress;

  Course({
    required this.title,
    required this.instructor,
    required this.thumbnail,
    this.progress = 0.0,
  });
}

final mockCourses = [
  Course(
    title: "Dasar-dasar Pemrograman",
    instructor: "Dosen A",
    thumbnail:
        "https://images.unsplash.com/photo-1581091012184-5c1e6a07f12b?w=600",
    progress: 0.5,
  ),
  Course(
    title: "Jaringan Komputer",
    instructor: "Dosen B",
    thumbnail:
        "https://images.unsplash.com/photo-1519389950473-47ba0277781c?w=600",
    progress: 0.2,
  ),
  Course(
    title: "Pengantar Kecerdasan Buatan",
    instructor: "Dosen C",
    thumbnail:
        "https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=600",
    progress: 0.0,
  ),
];

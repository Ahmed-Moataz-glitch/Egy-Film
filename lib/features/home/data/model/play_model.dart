// ignore_for_file: public_member_api_docs, sort_constructors_first
class PlayModel {
  final int id;
  final String title;
  final String url;
  final String thumbnail;
  final String duration;
  final String releaseDate;
  final String category;

  PlayModel({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnail,
    required this.duration,
    required this.releaseDate,
    this.category = 'كوميديا',
  });
}

List<PlayModel> plays = [
  PlayModel(
    id: 1,
    title: "الدور الرابع شقة 9",
    url: "http://10.0.2.2/plays/aldawr alraabie shaqat tisea/aldawr alraabie shaqat tisea.mp4",
    thumbnail: "https://image.tmdb.org/t/p/original/4jmZKrEtbA3MPqjNr7pT5haUPpX.jpg",
    duration: "3:12:50",
    releaseDate: "1986",
  ),
  PlayModel(
    id: 2,
    title: "العيال كبرت",
    url: "http://10.0.2.2/plays/aleial kbret/aleial kbret.mp4",
    thumbnail: "https://i.ytimg.com/vi/n-fnn0hpBsU/maxresdefault.jpg",
    duration: "3:55:40",
    releaseDate: "1979",
  ),
  PlayModel(
    id: 301,
    title: "المتزوجون 1",
    url: "http://10.0.2.2/plays/almutazawijun/almutazawijun1.ASF",
    thumbnail: "https://i.ytimg.com/vi/F4iLIT6Rqo8/maxresdefault.jpg",
    duration: "1:04:04",
    releaseDate: "1978",
  ),
  PlayModel(
    id: 302,
    title: "المتزوجون 2",
    url: "http://10.0.2.2/plays/almutazawijun/almutazawijun2.ASF",
    thumbnail: "https://i.ytimg.com/vi/F4iLIT6Rqo8/maxresdefault.jpg",
    duration: "1:05:58",
    releaseDate: "1978",
  ),
  PlayModel(
    id: 303,
    title: "المتزوجون 3",
    url: "http://10.0.2.2/plays/almutazawijun/almutazawijun3.ASF",
    thumbnail: "https://i.ytimg.com/vi/F4iLIT6Rqo8/maxresdefault.jpg",
    duration: "1:03:59",
    releaseDate: "1978",
  ),
  PlayModel(
    id: 401,
    title: "مدرسة المشاغبين 1",
    url: "http://10.0.2.2/plays/madrasat almushaghibin/madrasat almushaghibin1.wmv",
    thumbnail: "https://i.ytimg.com/vi/jBAIQ-KuXyQ/maxresdefault.jpg",
    duration: "1:57:26",
    releaseDate: "1971 ",
  ),
  PlayModel(
    id: 402,
    title: "مدرسة المشاغبين 2",
    url: "http://10.0.2.2/plays/madrasat almushaghibin/madrasat almushaghibin2.wmv",
    thumbnail: "https://i.ytimg.com/vi/jBAIQ-KuXyQ/maxresdefault.jpg",
    duration: "00:57:47",
    releaseDate: "1971 ",
  ),
  PlayModel(
    id: 5,
    title: "سك على بناتك",
    url: "http://10.0.2.2/plays/sak ealaa banatik/sak ealaa banatik.mp4",
    thumbnail: "https://i.ytimg.com/vi/a2O_v8XD2Zs/maxresdefault.jpg",
    duration: "3:44:07",
    releaseDate: "1980",
  ),
  PlayModel(
    id: 601,
    title: "شاهد ما شفش حاجة 1",
    url: "http://10.0.2.2/plays/shahid ma shafash hajatan/shahid ma shafash hajatan1.ASF",
    thumbnail: "https://i.ytimg.com/vi/QBsgi9pSUj8/maxresdefault.jpg",
    duration: "1:03:23",
    releaseDate: "1976",
  ),
  PlayModel(
    id: 602,
    title: "شاهد ما شفش حاجة 2",
    url: "http://10.0.2.2/plays/shahid ma shafash hajatan/shahid ma shafash hajatan2.ASF",
    thumbnail: "https://i.ytimg.com/vi/QBsgi9pSUj8/maxresdefault.jpg",
    duration: "1:03:24",
    releaseDate: "1976",
  ),
  PlayModel(
    id: 603,
    title: "شاهد ما شفش حاجة 3",
    url: "http://10.0.2.2/plays/shahid ma shafash hajatan/shahid ma shafash hajatan3.ASF",
    thumbnail: "https://i.ytimg.com/vi/QBsgi9pSUj8/maxresdefault.jpg",
    duration: "00:31:14",
    releaseDate: "1976",
  ),
  PlayModel(
    id: 7,
    title: "تخاريف",
    url: "http://10.0.2.2/plays/takharif/takharif.rmvb",
    thumbnail: "https://i.ytimg.com/vi/_bKV-RYxY3c/maxresdefault.jpg",
    duration: "3:13:50",
    releaseDate: "1988",
  ),
  PlayModel(
    id: 801,
    title: "وجهة نظر 1",
    url: "http://10.0.2.2/plays/wijhat nazar/wijhat nazar1.mp4",
    thumbnail: "https://m.media-amazon.com/images/M/MV5BZTI1MGFjNjctNWQ5My00ZWVlLThhMTctNjE4OWVhYjEzNTNjXkEyXkFqcGc@._V1_.jpg",
    duration: "1:55:33",
    releaseDate: "1989",
  ),
  PlayModel(
    id: 802,
    title: "وجهة نظر 2",
    url: "http://10.0.2.2/plays/wijhat nazar/wijhat nazar2.ASF",
    thumbnail: "https://m.media-amazon.com/images/M/MV5BZTI1MGFjNjctNWQ5My00ZWVlLThhMTctNjE4OWVhYjEzNTNjXkEyXkFqcGc@._V1_.jpg",
    duration: "00:46:09",
    releaseDate: "1989",
  ),
  PlayModel(
    id: 803,
    title: "وجهة نظر 3",
    url: "http://10.0.2.2/plays/wijhat nazar/wijhat nazar3.ASF",
    thumbnail: "https://m.media-amazon.com/images/M/MV5BZTI1MGFjNjctNWQ5My00ZWVlLThhMTctNjE4OWVhYjEzNTNjXkEyXkFqcGc@._V1_.jpg",
    duration: "00:46:49",
    releaseDate: "1989",
  ),
];


import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:unit_test/utils/fetch_album.dart';

import 'fetch_album_test.mocks.dart';

@GenerateMocks([http.Client]) //MockClient => MockNameofClasse
void main() {
  group("Fetch album test", () {
    late MockClient mockClient;
    setUp(() {
      //init beofre test
      mockClient = MockClient();
    });
    //dispose after test
    tearDown(() {});
    test("called get method on client once", () {
      when(
        mockClient.get(
          Uri.parse("https://jsonplaceholder.typicode.com/albums/1"),
        ),
      ).thenAnswer((_) async {
        return http.Response('{"userId":1,"id":2,"title":"mock"}', 200);
      });
      fetchAlbum(mockClient);
      verify(
        mockClient.get(
          Uri.parse("https://jsonplaceholder.typicode.com/albums/1"),
        ),
      ).called(1);
    });
    test("description", () async {
      when(
        mockClient.get(
          Uri.parse("https://jsonplaceholder.typicode.com/albums/1"),
        ),
      ).thenAnswer((_) async {
        return http.Response('{"userId":1,"id":2,"title":"mock"}', 200);
      });
      //Returns a matcher that matches objects with type [T].=>isA<T>
      expect(
        await fetchAlbum(mockClient),
        isA<Album>()
            .having((album) => album.id, "id", 2)
            .having((album) => album.userId, "userId", 1)
            .having((album) => album.title, "title", "mock"),
      );
    });
    test("Throw excpetion if the http call comletes with an error", () async {
      when(
        mockClient.get(
          Uri.parse("https://jsonplaceholder.typicode.com/albums/1"),
        ),
      ).thenAnswer((_) async {
        return http.Response('{"errMsg":"Page not found"}}', 404);
      });
      //throwsException Matcher => with the exception 404
      expect(fetchAlbum(mockClient), throwsException);
    });
  });
}

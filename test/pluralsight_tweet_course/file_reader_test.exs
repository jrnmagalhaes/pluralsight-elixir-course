defmodule FileReaderTest do
  use ExUnit.Case
  import Mock

  test "passing a file should return a string" do
    str = PluralsightTweetCourse.FileReader.get_strings_to_tweet(Path.join("#{:code.priv_dir(:pluralsight_tweet_course)}", "sample.txt"))

    assert str != nil
  end

  test "will not return a string longer than 140 characters" do
    str = PluralsightTweetCourse.FileReader.get_strings_to_tweet(Path.join("#{:code.priv_dir(:pluralsight_tweet_course)}", "test/too_long.txt"))
    
    assert str == "short line."
  end

  test "An empty string should return an empty string" do
    str = PluralsightTweetCourse.FileReader.pick_string("")

    assert str == "";
  end

  test "The string should be trimmed" do
    with_mock File, [read!: fn(_) -> " ABC " end] do
      str = PluralsightTweetCourse.FileReader.get_strings_to_tweet("some random file.txt")

      assert str == "ABC"
    end
  end
end
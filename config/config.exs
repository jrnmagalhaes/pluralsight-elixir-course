use Mix.Config

config :pluralsight_tweet_course, PluralsightTweetCourse.Scheduler,
  debug_logging: false,
  jobs: [
    # Every minute
    {"* * * * *", fn -> IO.puts PluralsightTweetCourse.FileReader.get_strings_to_tweet("lib/pluralsight_tweet_course/sample.txt") end}
  ]
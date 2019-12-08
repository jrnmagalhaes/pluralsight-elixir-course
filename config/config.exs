use Mix.Config

config :pluralsight_tweet_course, PluralsightTweetCourse.Scheduler,
  debug_logging: false,
  jobs: [
    # Every minute
    {"* * * * *", fn -> PluralsightTweetCourse.Tweet.send_random("lib/pluralsight_tweet_course/sample.txt") end}
  ]
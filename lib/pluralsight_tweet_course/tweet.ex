defmodule PluralsightTweetCourse.Tweet do
    def send(string) do
        ExTwitter.configure(:process, [
            consumer_key: System.get_env("TWITTER_CONSUMER_KEY"),
            consumer_secret: System.get_env("TWITTER_CONSUMER_SECRET"),
            access_token: System.get_env("TWITTER_ACCESS_TOKEN"),
            access_token_secret: System.get_env("TWITTER_ACCESS_SECRET")
        ])

        ExTwitter.update(string)
    end

    def send_random(file) do
        PluralsightTweetCourse.FileReader.get_strings_to_tweet(file)
        |> send
    end
end
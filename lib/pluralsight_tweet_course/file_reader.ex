defmodule PluralsightTweetCourse.FileReader do
    def get_strings_to_tweet(path) do
        File.read!(path)
        # the pipe operator |> passes the result of an expression as the first parameter of another expression.
        |> pick_string
    end

    def pick_string(str) do
        str
        |> String.split("\n") # Find the lines
        |> Enum.map(&String.trim/1) # Removes spaces in the end and in the beginning
        |> Enum.filter(&String.length(&1) <= 140) # Selects the lines that are have less than 140 caracters (The maximux on a tweet)
        |> Enum.random()
    end
end
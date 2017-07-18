defmodule LottoNumbers.Game do

  alias LottoNumbers.Game

  defstruct [:name, :file, :min_number, :max_number, :num_balls, :extra, :total_games]

  def get(:set_for_life) do
    %Game{
      name: "Set For Life",
      file: "SetForLife",
      num_balls: 8,
      extra: nil,
      min_number: 1,
      max_number: 37,
    }
  end

  def get(:oz_lotto) do
    %Game{
      name: "Oz Lotto",
      file: "OzLotto",
      num_balls: 7,
      extra: nil,
      min_number: 1,
      max_number: 45,
    }
  end

  def get(:powerball) do
    %Game{
      name: "Powerball",
      file: "Powerball",
      num_balls: 6,
      extra: %{
        num_extra: 1,
        min_number: 1,
        max_number: 20,
      },
      min_number: 1,
      max_number: 40,
    }
  end

  def get(:weekend_xlotto) do
    %Game{
      name: "Weekend XLotto",
      file: "SaturdayXLotto",
      num_balls: 6,
      extra: nil,
      min_number: 1,
      max_number: 45,
    }
  end

  def get(:weekday_xlotto) do
    %Game{
      name: "Weekday XLotto",
      file: "MondayWednesdayXLotto",
      num_balls: 6,
      extra: nil,
      min_number: 1,
      max_number: 45,
    }
  end

  def get(:the_pools) do
    %Game{
      name: "The Pools",
      file: "ThePools",
      num_balls: 6,
      extra: nil,
      min_number: 1,
      max_number: 38,
    }
  end

  def get(_), do: {:error, "Game does not exist"}
end

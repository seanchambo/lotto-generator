defmodule LottoNumbers.Inferer do
  def infer_results(game, results) do
    slice_results(game, results)
     |> count_occurences
     |> generate_percentages(game.total_games)
  end

  defp slice_results(game, results) do
    Enum.flat_map(results, fn game_result -> Enum.slice(game_result, 2, game.num_balls) end)
  end

  def count_occurences(results) do
    results
      |> Enum.reduce(%{}, fn x, acc -> Map.update(acc, x, 1, &(&1 + 1)) end)
  end

  def generate_percentages(occurences, total_games) do
    occurences
      |> Enum.reduce(occurences, fn {key, _value}, acc -> Map.update(acc, key, 0, &(&1 / total_games)) end)
  end
end

defmodule LottoNumbers do
  @lotto_types ~w(
    set_for_life
    weekend_xlotto
    oz_lotto
    powerball
    the_pools
    weekday_xlotto
  )a

  def generate_for_game(key, num_games) when key in @lotto_types do
    Enum.map(1..num_games, fn _ -> generate_for_game(key) end)
  end

  def generate_for_game(key) when key in @lotto_types do
    :rand.seed(:exsplus)

    {game, numbers} = key
     |> get
     |> download
     |> changeset
     |> infer
     |> generate

     numbers
  end

  def generate_for_game(_), do: {:error, "Lotto type does not exist"}

  defp get(key), do: LottoNumbers.Game.get(key)

  defp download(game = %LottoNumbers.Game{file: file}) do
    {game, LottoNumbers.Downloader.get_results(file)}
  end

  defp infer({game, body}) do
    {game, LottoNumbers.Inferer.infer_results(game, body)}
  end

  defp changeset({game, {:ok, %ExCsv.Table{body: body}}}) do
    {%LottoNumbers.Game{game | total_games: length(body)}, body}
  end

  defp generate({game, inferences}) do
    {game, LottoNumbers.Generator.generate(game, inferences)}
  end
end

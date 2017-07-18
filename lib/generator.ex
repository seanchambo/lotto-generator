defmodule LottoNumbers.Generator do
  def generate(game, inferences) do
    {balls, _} = Enum.map_reduce(1..game.num_balls, [], fn(_, current_balls) ->
      ball = generate_ball(inferences, current_balls)
      {ball, current_balls ++ [ball]}
    end)
    balls
  end

  defp generate_ball(inferences, current_balls) do
    inferences
      |> Map.to_list
      |> Enum.take_random(1)
      |> validate_ball(inferences, current_balls)
  end

  defp validate_ball([{ball, prob} | _], inferences, current_balls) do
    case prob >= :rand.uniform() and not ball in current_balls  do
      true -> ball
      _ -> generate_ball(inferences, current_balls)
    end
  end
end

defmodule LottoNumbers.Downloader do
  @base_url "https://thelott.com/DownloadFile.ashx?product="

  def get_results(lotto_type) do
    lotto_type
      |> download
      |> parse
  end

  defp download(lotto_type) do
    @base_url <> lotto_type
      |> Tesla.get
  end

  defp parse(response) do
    response.body
      |> ExCsv.parse(headings: true)
  end
end

defmodule Explorer.Market.History.Source.Price.CoinGecko do
  @moduledoc """
  Adapter for fetching current market from CoinGecko.
  """

  alias Explorer.ExchangeRates.Source
  alias Explorer.ExchangeRates.Source.CoinGecko, as: ExchangeRatesSourceCoinGecko
  alias Explorer.Market.History.Source.Price, as: SourcePrice
  alias Explorer.Market.History.Source.Price.CryptoCompare

  @behaviour SourcePrice

  @impl SourcePrice
  def fetch_price_history(previous_days, secondary_coin? \\ false) do
    url = ExchangeRatesSourceCoinGecko.history_url(previous_days, secondary_coin?)

    case Source.http_request(url, ExchangeRatesSourceCoinGecko.headers()) do
      {:ok, data} ->
        result =
          data
          |> format_data(secondary_coin?)

        {:ok, result}

      _ ->
        :error
    end
  end

  @spec format_data(term(), boolean()) :: SourcePrice.record() | nil
  defp format_data(nil, _), do: nil

  defp format_data(data, secondary_coin?) do
    prices = data["prices"]

    for [date, price] <- prices do
      date = Decimal.to_integer(Decimal.round(Decimal.from_float(date / 1000)))

      %{
        closing_price: Decimal.new(to_string(price)),
        date: CryptoCompare.date(date),
        opening_price: Decimal.new(to_string(price)),
        secondary_coin: secondary_coin?
      }
    end
  end
end

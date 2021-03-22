defmodule Stordly.IdGenerator do
  @moduledoc """
  A mostly unique ID generator based off of Puid.
  It generates puids with 40-bits of entropy from alphanumeric (url-safe) characters.
  """

  alias Stordly.AlphanumPuid

  @spec generate_id :: bitstring
  def generate_id do
    AlphanumPuid.generate()
  end
end

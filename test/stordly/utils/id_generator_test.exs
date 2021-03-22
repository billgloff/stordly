defmodule Stordly.IdGeneratorTest do
  use Stordly.DataCase

  alias Stordly.IdGenerator

  describe "Stordly.IdGenerator" do
    test "generate_id/0 returns all links" do
      unique_id = IdGenerator.generate_id()
      assert Regex.match?(~r/^[A-Za-z0-9]{7}$/, unique_id) == true
    end
  end
end

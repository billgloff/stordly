defmodule Stordly.AlphanumPuid do
  @moduledoc false
  use(Puid, bits: 40, charset: :alphanum)
end

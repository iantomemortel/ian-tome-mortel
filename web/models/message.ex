defmodule Rumbl.Message do
  use Rumbl.Web, :model

  schema "messages" do
    field :user, :string
    field :body, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user, :body])
    |> validate_required([:user, :body])
  end
end

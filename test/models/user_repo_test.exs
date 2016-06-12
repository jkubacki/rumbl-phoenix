defmodule Rumbl.UserRepoTest do
  use Rumbl.ModelCase
  alias Rumbl.User

  @valid_attrs %{name: "A user", username: "gogi"}

  test "converts unique_constraint on username to error" do
    insert_user(username: "kuba")
    attrs = Map.put(@valid_attrs, :username, "kuba")
    changeset = User.changeset(%User{}, attrs)

    assert {:error, changeset} = Repo.insert(changeset)
    assert {:username, "has already been taken"} in changeset.errors
  end
end

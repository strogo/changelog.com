defmodule Changelog.Policies.AdminTest do
  use Changelog.PolicyCase

  alias Changelog.Policies

  test "only admins, editors, and hosts can index" do
    refute Policies.Admin.index(@guest)
    refute Policies.Admin.index(@user)
    assert Policies.Admin.index(@admin)
    assert Policies.Admin.index(@editor)
    assert Policies.Admin.index(@host)
  end

  test "only admins can purge" do
    refute Policies.Admin.purge(@editor)
    refute Policies.Admin.purge(@host)
    assert Policies.Admin.purge(@admin)
  end
end

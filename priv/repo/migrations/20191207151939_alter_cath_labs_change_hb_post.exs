defmodule Angio.Repo.Migrations.AlterCathLabsChangeHbPost do
  use Ecto.Migration

  def change do
  alter table(:cath_labs) do
    modify(:cath_ckmb_pre_val, :string)
  end
  end
end

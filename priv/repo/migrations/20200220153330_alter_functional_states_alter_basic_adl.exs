defmodule Angio.Repo.Migrations.AlterFunctionalStatesAlterBasicAdl do
  use Ecto.Migration

  def change do
    alter table(:functional_states) do
      remove(:funs_basic_adl)
      add(:funs_basic_adl, :string, size: 50)
    end
  end
end

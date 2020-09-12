defmodule Angio.Repo.Migrations.AlterPciProceduresAddInfoCoronaryId do
  use Ecto.Migration

  def change do
  alter table(:pci_procedures) do
    add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
  end
end
end

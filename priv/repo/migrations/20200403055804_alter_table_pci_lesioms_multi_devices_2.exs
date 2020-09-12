defmodule Angio.Repo.Migrations.AlterTablePciLesiomsMultiDevices2 do
  use Ecto.Migration

  def change do
    alter table(:pci_lesions) do
      #remove(:"coarc_notes,", :string)
      remove(:pci_les_devices_used, :string)
      add(:pci_les_devices_used, {:array, :string})

     end
  end
end

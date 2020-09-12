defmodule Angio.Repo.Migrations.AlterTablePciLesiomsMultiDevices do
  use Ecto.Migration

  def change do
   alter table(:pci_lesions) do
    #remove(:"coarc_notes,", :string)
    remove(:pci_les_devices_used)
    add(:pci_les_devices_used, {:array, :string})

   end
  end
end

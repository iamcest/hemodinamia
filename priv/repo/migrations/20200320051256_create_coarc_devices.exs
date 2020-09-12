defmodule Angio.Repo.Migrations.CreateCoarcDevices do
  use Ecto.Migration

  def change do
    create table(:coarc_devices) do
      add(:coarc_device_id, :string)
      add(:coarc_device_type, :string)
      add(:coarc_balloon_purpose, :string)
      add(:coarc_balloon_max_pres, :string)
      add(:coarc_balloon_outcome, :string)
      add(:coarc_stent_outcome, :string)
      add(:coarc_stent_diam_min_assesed_yn, :boolean, default: false, null: false)
      add(:coarc_stent_diam_min_post, :string)
      add(:coarc_device_counter, :string)
      add(:coarc_device_notes, :text)
      add(:coarc_id, references(:coarc_procedures, on_delete: :delete_all))
      timestamps()
    end
  end
end

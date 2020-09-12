defmodule Angio.Repo.Migrations.CreateCathClinicals do
  use Ecto.Migration

  def change do
    create table(:cath_clinicals) do
      add(:nyha_class_prior_2wk_cath_yn, :boolean)
      add(:cath_cl_arrest_hypothermia_tm, :time)
      add(:cath_cl_arrest_hypothermia_yn, :boolean)
      add(:iabp_start_tm, :time)
      add(:cardio_shock_last_24hours_yn, :boolean)
      add(:lv_dysfunction_yn, :boolean)
      add(:cabg_most_recent_dt, :date)
      add(:mech_lv_support_other_yn, :boolean)
      add(:intubated_before_cath_yn, :boolean)
      add(:cath_cl_arrest_pre_wit_yn, :boolean)
      add(:symptom_onset_tm_estim, :boolean)
      add(:cad_presentation_type, :string, size: 50)
      add(:iabp_support_req_yn, :boolean)
      add(:nyha_prior_2wk_category, :string, size: 50)
      add(:ventilator_support_yn, :boolean)
      add(:angina_class_within_2wk_yn, :boolean)
      add(:cath_cl_arrest_loc, :string, size: 50)
      add(:symptom_onset_tm, :time)
      add(:sedation_type, :string, size: 50)
      add(:mech_lv_support_other_tm, :time)
      add(:symptom_onset_tm_na, :boolean)
      add(:chf_prior_2wk_yn, :boolean)
      add(:anesthitist_at_start_yn, :boolean)
      add(:anesthitist_called_yn, :boolean)
      add(:arrest_cardiac_24h_yn, :boolean)
      add(:bag_mask_ventilation_yn, :boolean)
      add(:glasgow_coma_scale, :string)
      add(:patient_id, :bigint)
      add(:info_coronary_id, references(:info_coronaries, on_delete: :delete_all))
      timestamps()
    end
  end
end

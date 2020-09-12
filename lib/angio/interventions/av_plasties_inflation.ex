defmodule Angio.Interventions.Av_plasties_inflation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "av_plasties_inflations" do
    field :avp_bal_outcome, :string
    field :avpi_av_reg_degree_post, :string
    field :avpi_balloon_technique, :string
    field :avpi_db_bal_2_id, :string
    field :avpi_inflation_counter, :string
    field :avpi_max_inflation_pres, :string
    field :avpi_notes, :string
    field :avpi_peak_sys_gradient_post, :string
    field :avpi_sb_bal_1_id, :string
    field :avpi_stabilization_yn, :boolean, default: false
    field :av_plasty_id, :integer

    timestamps()
  end

  @doc false
  def changeset(av_plasties_inflation, attrs) do
    av_plasties_inflation
    |> cast(attrs, [:avpi_inflation_counter, :avpi_balloon_technique, :avpi_sb_bal_1_id, :avpi_db_bal_2_id, :avpi_stabilization_yn, :avpi_max_inflation_pres, :avp_bal_outcome, :avpi_peak_sys_gradient_post, :avpi_av_reg_degree_post, :avpi_notes])
    |> validate_required([])

    #|> validate_required([:avpi_inflation_counter, :avpi_balloon_technique, :avpi_sb_bal_1_id, :avpi_db_bal_2_id, :avpi_stabilization_yn, :avpi_max_inflation_pres, :avp_bal_outcome, :avpi_peak_sys_gradient_post, :avpi_av_reg_degree_post, :avpi_notes])
  end
end

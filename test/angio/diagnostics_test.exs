defmodule Angio.DiagnosticsTest do
  use Angio.DataCase

  alias Angio.Diagnostics

  describe "electrocardiograms" do
    alias Angio.Diagnostics.Electrocardiogram

    @valid_attrs %{" ": "some  ", ecg_dt: ~D[2010-04-17], proch_pci_prior_yn: true}
    @update_attrs %{" ": "some updated  ", ecg_dt: ~D[2011-05-18], proch_pci_prior_yn: false}
    @invalid_attrs %{" ": nil, ecg_dt: nil, proch_pci_prior_yn: nil}

    def electrocardiogram_fixture(attrs \\ %{}) do
      {:ok, electrocardiogram} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Diagnostics.create_electrocardiogram()

      electrocardiogram
    end

    test "list_electrocardiograms/0 returns all electrocardiograms" do
      electrocardiogram = electrocardiogram_fixture()
      assert Diagnostics.list_electrocardiograms() == [electrocardiogram]
    end

    test "get_electrocardiogram!/1 returns the electrocardiogram with given id" do
      electrocardiogram = electrocardiogram_fixture()
      assert Diagnostics.get_electrocardiogram!(electrocardiogram.id) == electrocardiogram
    end

    test "create_electrocardiogram/1 with valid data creates a electrocardiogram" do
      assert {:ok, %Electrocardiogram{} = electrocardiogram} = Diagnostics.create_electrocardiogram(@valid_attrs)
      assert electrocardiogram.  == "some  "
      assert electrocardiogram.ecg_dt == ~D[2010-04-17]
      assert electrocardiogram.proch_pci_prior_yn == true
    end

    test "create_electrocardiogram/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Diagnostics.create_electrocardiogram(@invalid_attrs)
    end

    test "update_electrocardiogram/2 with valid data updates the electrocardiogram" do
      electrocardiogram = electrocardiogram_fixture()
      assert {:ok, %Electrocardiogram{} = electrocardiogram} = Diagnostics.update_electrocardiogram(electrocardiogram, @update_attrs)
      assert electrocardiogram.  == "some updated  "
      assert electrocardiogram.ecg_dt == ~D[2011-05-18]
      assert electrocardiogram.proch_pci_prior_yn == false
    end

    test "update_electrocardiogram/2 with invalid data returns error changeset" do
      electrocardiogram = electrocardiogram_fixture()
      assert {:error, %Ecto.Changeset{}} = Diagnostics.update_electrocardiogram(electrocardiogram, @invalid_attrs)
      assert electrocardiogram == Diagnostics.get_electrocardiogram!(electrocardiogram.id)
    end

    test "delete_electrocardiogram/1 deletes the electrocardiogram" do
      electrocardiogram = electrocardiogram_fixture()
      assert {:ok, %Electrocardiogram{}} = Diagnostics.delete_electrocardiogram(electrocardiogram)
      assert_raise Ecto.NoResultsError, fn -> Diagnostics.get_electrocardiogram!(electrocardiogram.id) end
    end

    test "change_electrocardiogram/1 returns a electrocardiogram changeset" do
      electrocardiogram = electrocardiogram_fixture()
      assert %Ecto.Changeset{} = Diagnostics.change_electrocardiogram(electrocardiogram)
    end
  end

  describe "electrocardiograms" do
    alias Angio.Diagnostics.Electrocardiogram

    @valid_attrs %{ecg_av_conduction: "some ecg_av_conduction", ecg_dt: ~D[2010-04-17], ecg_epsilon_wave_yn: true, ecg_first_tm: ~T[14:00:00], ecg_heart_rate: "some ecg_heart_rate", ecg_infarct_pattern_location: "some ecg_infarct_pattern_location", ecg_infarct_pattern_yn: true, ecg_inverted_t_waves_yn: true, ecg_lbbb: "some ecg_lbbb", ecg_lv_hypertrophy: "some ecg_lv_hypertrophy", ecg_normal_yn: true, ecg_notes: "some ecg_notes", ecg_p_duration_val: "some ecg_p_duration_val", ecg_pathological_q_yn: true, ecg_pr_interval_val: "some ecg_pr_interval_val", ecg_qrs_duration_val: "some ecg_qrs_duration_val", ecg_qtc_long_yn: true, ecg_rbbb_yn: true, ecg_rhythm: "some ecg_rhythm", ecg_rv_hypertrophy_yn: true, ecg_st_depression_yn: true, ecg_st_elevation_yn: true, ecg_st_with_symptoms: "some ecg_st_with_symptoms", ecg_t_with_symptoms: "some ecg_t_with_symptoms", ecg_tm: ~T[14:00:00], ecg_with_symptoms_yn: true}
    @update_attrs %{ecg_av_conduction: "some updated ecg_av_conduction", ecg_dt: ~D[2011-05-18], ecg_epsilon_wave_yn: false, ecg_first_tm: ~T[15:01:01], ecg_heart_rate: "some updated ecg_heart_rate", ecg_infarct_pattern_location: "some updated ecg_infarct_pattern_location", ecg_infarct_pattern_yn: false, ecg_inverted_t_waves_yn: false, ecg_lbbb: "some updated ecg_lbbb", ecg_lv_hypertrophy: "some updated ecg_lv_hypertrophy", ecg_normal_yn: false, ecg_notes: "some updated ecg_notes", ecg_p_duration_val: "some updated ecg_p_duration_val", ecg_pathological_q_yn: false, ecg_pr_interval_val: "some updated ecg_pr_interval_val", ecg_qrs_duration_val: "some updated ecg_qrs_duration_val", ecg_qtc_long_yn: false, ecg_rbbb_yn: false, ecg_rhythm: "some updated ecg_rhythm", ecg_rv_hypertrophy_yn: false, ecg_st_depression_yn: false, ecg_st_elevation_yn: false, ecg_st_with_symptoms: "some updated ecg_st_with_symptoms", ecg_t_with_symptoms: "some updated ecg_t_with_symptoms", ecg_tm: ~T[15:01:01], ecg_with_symptoms_yn: false}
    @invalid_attrs %{ecg_av_conduction: nil, ecg_dt: nil, ecg_epsilon_wave_yn: nil, ecg_first_tm: nil, ecg_heart_rate: nil, ecg_infarct_pattern_location: nil, ecg_infarct_pattern_yn: nil, ecg_inverted_t_waves_yn: nil, ecg_lbbb: nil, ecg_lv_hypertrophy: nil, ecg_normal_yn: nil, ecg_notes: nil, ecg_p_duration_val: nil, ecg_pathological_q_yn: nil, ecg_pr_interval_val: nil, ecg_qrs_duration_val: nil, ecg_qtc_long_yn: nil, ecg_rbbb_yn: nil, ecg_rhythm: nil, ecg_rv_hypertrophy_yn: nil, ecg_st_depression_yn: nil, ecg_st_elevation_yn: nil, ecg_st_with_symptoms: nil, ecg_t_with_symptoms: nil, ecg_tm: nil, ecg_with_symptoms_yn: nil}

    def electrocardiogram_fixture(attrs \\ %{}) do
      {:ok, electrocardiogram} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Diagnostics.create_electrocardiogram()

      electrocardiogram
    end

    test "list_electrocardiograms/0 returns all electrocardiograms" do
      electrocardiogram = electrocardiogram_fixture()
      assert Diagnostics.list_electrocardiograms() == [electrocardiogram]
    end

    test "get_electrocardiogram!/1 returns the electrocardiogram with given id" do
      electrocardiogram = electrocardiogram_fixture()
      assert Diagnostics.get_electrocardiogram!(electrocardiogram.id) == electrocardiogram
    end

    test "create_electrocardiogram/1 with valid data creates a electrocardiogram" do
      assert {:ok, %Electrocardiogram{} = electrocardiogram} = Diagnostics.create_electrocardiogram(@valid_attrs)
      assert electrocardiogram.ecg_av_conduction == "some ecg_av_conduction"
      assert electrocardiogram.ecg_dt == ~D[2010-04-17]
      assert electrocardiogram.ecg_epsilon_wave_yn == true
      assert electrocardiogram.ecg_first_tm == ~T[14:00:00]
      assert electrocardiogram.ecg_heart_rate == "some ecg_heart_rate"
      assert electrocardiogram.ecg_infarct_pattern_location == "some ecg_infarct_pattern_location"
      assert electrocardiogram.ecg_infarct_pattern_yn == true
      assert electrocardiogram.ecg_inverted_t_waves_yn == true
      assert electrocardiogram.ecg_lbbb == "some ecg_lbbb"
      assert electrocardiogram.ecg_lv_hypertrophy == "some ecg_lv_hypertrophy"
      assert electrocardiogram.ecg_normal_yn == true
      assert electrocardiogram.ecg_notes == "some ecg_notes"
      assert electrocardiogram.ecg_p_duration_val == "some ecg_p_duration_val"
      assert electrocardiogram.ecg_pathological_q_yn == true
      assert electrocardiogram.ecg_pr_interval_val == "some ecg_pr_interval_val"
      assert electrocardiogram.ecg_qrs_duration_val == "some ecg_qrs_duration_val"
      assert electrocardiogram.ecg_qtc_long_yn == true
      assert electrocardiogram.ecg_rbbb_yn == true
      assert electrocardiogram.ecg_rhythm == "some ecg_rhythm"
      assert electrocardiogram.ecg_rv_hypertrophy_yn == true
      assert electrocardiogram.ecg_st_depression_yn == true
      assert electrocardiogram.ecg_st_elevation_yn == true
      assert electrocardiogram.ecg_st_with_symptoms == "some ecg_st_with_symptoms"
      assert electrocardiogram.ecg_t_with_symptoms == "some ecg_t_with_symptoms"
      assert electrocardiogram.ecg_tm == ~T[14:00:00]
      assert electrocardiogram.ecg_with_symptoms_yn == true
    end

    test "create_electrocardiogram/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Diagnostics.create_electrocardiogram(@invalid_attrs)
    end

    test "update_electrocardiogram/2 with valid data updates the electrocardiogram" do
      electrocardiogram = electrocardiogram_fixture()
      assert {:ok, %Electrocardiogram{} = electrocardiogram} = Diagnostics.update_electrocardiogram(electrocardiogram, @update_attrs)
      assert electrocardiogram.ecg_av_conduction == "some updated ecg_av_conduction"
      assert electrocardiogram.ecg_dt == ~D[2011-05-18]
      assert electrocardiogram.ecg_epsilon_wave_yn == false
      assert electrocardiogram.ecg_first_tm == ~T[15:01:01]
      assert electrocardiogram.ecg_heart_rate == "some updated ecg_heart_rate"
      assert electrocardiogram.ecg_infarct_pattern_location == "some updated ecg_infarct_pattern_location"
      assert electrocardiogram.ecg_infarct_pattern_yn == false
      assert electrocardiogram.ecg_inverted_t_waves_yn == false
      assert electrocardiogram.ecg_lbbb == "some updated ecg_lbbb"
      assert electrocardiogram.ecg_lv_hypertrophy == "some updated ecg_lv_hypertrophy"
      assert electrocardiogram.ecg_normal_yn == false
      assert electrocardiogram.ecg_notes == "some updated ecg_notes"
      assert electrocardiogram.ecg_p_duration_val == "some updated ecg_p_duration_val"
      assert electrocardiogram.ecg_pathological_q_yn == false
      assert electrocardiogram.ecg_pr_interval_val == "some updated ecg_pr_interval_val"
      assert electrocardiogram.ecg_qrs_duration_val == "some updated ecg_qrs_duration_val"
      assert electrocardiogram.ecg_qtc_long_yn == false
      assert electrocardiogram.ecg_rbbb_yn == false
      assert electrocardiogram.ecg_rhythm == "some updated ecg_rhythm"
      assert electrocardiogram.ecg_rv_hypertrophy_yn == false
      assert electrocardiogram.ecg_st_depression_yn == false
      assert electrocardiogram.ecg_st_elevation_yn == false
      assert electrocardiogram.ecg_st_with_symptoms == "some updated ecg_st_with_symptoms"
      assert electrocardiogram.ecg_t_with_symptoms == "some updated ecg_t_with_symptoms"
      assert electrocardiogram.ecg_tm == ~T[15:01:01]
      assert electrocardiogram.ecg_with_symptoms_yn == false
    end

    test "update_electrocardiogram/2 with invalid data returns error changeset" do
      electrocardiogram = electrocardiogram_fixture()
      assert {:error, %Ecto.Changeset{}} = Diagnostics.update_electrocardiogram(electrocardiogram, @invalid_attrs)
      assert electrocardiogram == Diagnostics.get_electrocardiogram!(electrocardiogram.id)
    end

    test "delete_electrocardiogram/1 deletes the electrocardiogram" do
      electrocardiogram = electrocardiogram_fixture()
      assert {:ok, %Electrocardiogram{}} = Diagnostics.delete_electrocardiogram(electrocardiogram)
      assert_raise Ecto.NoResultsError, fn -> Diagnostics.get_electrocardiogram!(electrocardiogram.id) end
    end

    test "change_electrocardiogram/1 returns a electrocardiogram changeset" do
      electrocardiogram = electrocardiogram_fixture()
      assert %Ecto.Changeset{} = Diagnostics.change_electrocardiogram(electrocardiogram)
    end
  end
end

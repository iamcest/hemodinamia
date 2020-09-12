defmodule Angio.InterventionsTest do
  use Angio.DataCase

  alias Angio.Interventions

  describe "asd_closures" do
    alias Angio.Interventions.Asd_closure

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def asd_closure_fixture(attrs \\ %{}) do
      {:ok, asd_closure} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Interventions.create_asd_closure()

      asd_closure
    end

    test "list_asd_closures/0 returns all asd_closures" do
      asd_closure = asd_closure_fixture()
      assert Interventions.list_asd_closures() == [asd_closure]
    end

    test "get_asd_closure!/1 returns the asd_closure with given id" do
      asd_closure = asd_closure_fixture()
      assert Interventions.get_asd_closure!(asd_closure.id) == asd_closure
    end

    test "create_asd_closure/1 with valid data creates a asd_closure" do
      assert {:ok, %Asd_closure{} = asd_closure} = Interventions.create_asd_closure(@valid_attrs)
    end

    test "create_asd_closure/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Interventions.create_asd_closure(@invalid_attrs)
    end

    test "update_asd_closure/2 with valid data updates the asd_closure" do
      asd_closure = asd_closure_fixture()
      assert {:ok, %Asd_closure{} = asd_closure} = Interventions.update_asd_closure(asd_closure, @update_attrs)
    end

    test "update_asd_closure/2 with invalid data returns error changeset" do
      asd_closure = asd_closure_fixture()
      assert {:error, %Ecto.Changeset{}} = Interventions.update_asd_closure(asd_closure, @invalid_attrs)
      assert asd_closure == Interventions.get_asd_closure!(asd_closure.id)
    end

    test "delete_asd_closure/1 deletes the asd_closure" do
      asd_closure = asd_closure_fixture()
      assert {:ok, %Asd_closure{}} = Interventions.delete_asd_closure(asd_closure)
      assert_raise Ecto.NoResultsError, fn -> Interventions.get_asd_closure!(asd_closure.id) end
    end

    test "change_asd_closure/1 returns a asd_closure changeset" do
      asd_closure = asd_closure_fixture()
      assert %Ecto.Changeset{} = Interventions.change_asd_closure(asd_closure)
    end
  end

  describe "asd_closures" do
    alias Angio.Interventions.Asd_closure

    @valid_attrs %{"": "some ", asdcl_aortic_rim_length: "some asdcl_aortic_rim_length", asdcl_asd_size: "some asdcl_asd_size", asdcl_atria_septal_aneurysm_yn: "some asdcl_atria_septal_aneurysm_yn", asdcl_bal_sizing_perfomed_yn: true, asdcl_defect_counter_assoc: "some asdcl_defect_counter_assoc", asdcl_defect_not_treated: "some asdcl_defect_not_treated", asdcl_device_used_outcome: "some asdcl_device_used_outcome", asdcl_device_utilized_id: "some asdcl_device_utilized_id", asdcl_device_utilized_name: "some asdcl_device_utilized_name", asdcl_ivc_rim_length: "some asdcl_ivc_rim_length", asdcl_multi_fenestrated_yn: true, asdcl_notes: "some asdcl_notes", asdcl_operator_fname: "some asdcl_operator_fname", asdcl_operator_lname: "some asdcl_operator_lname", asdcl_operator_mname: "some asdcl_operator_mname", asdcl_operator_npi: "some asdcl_operator_npi", asdcl_primary_indication: "some asdcl_primary_indication", asdcl_residual_shunt_size: "some asdcl_residual_shunt_size", asdcl_rim_meas_performed_yn: true, "asdcl_stop_flow,": "some asdcl_stop_flow,", asdcl_stop_flow_performed_yn: true, asdcl_stretch_diam_perform_yn: true, asdcl_stretched_diam_size: "some asdcl_stretched_diam_size", asdcl_total_septal_length: "some asdcl_total_septal_length", asdcl_treat_attempted_yn: true}
    @update_attrs %{"": "some updated ", asdcl_aortic_rim_length: "some updated asdcl_aortic_rim_length", asdcl_asd_size: "some updated asdcl_asd_size", asdcl_atria_septal_aneurysm_yn: "some updated asdcl_atria_septal_aneurysm_yn", asdcl_bal_sizing_perfomed_yn: false, asdcl_defect_counter_assoc: "some updated asdcl_defect_counter_assoc", asdcl_defect_not_treated: "some updated asdcl_defect_not_treated", asdcl_device_used_outcome: "some updated asdcl_device_used_outcome", asdcl_device_utilized_id: "some updated asdcl_device_utilized_id", asdcl_device_utilized_name: "some updated asdcl_device_utilized_name", asdcl_ivc_rim_length: "some updated asdcl_ivc_rim_length", asdcl_multi_fenestrated_yn: false, asdcl_notes: "some updated asdcl_notes", asdcl_operator_fname: "some updated asdcl_operator_fname", asdcl_operator_lname: "some updated asdcl_operator_lname", asdcl_operator_mname: "some updated asdcl_operator_mname", asdcl_operator_npi: "some updated asdcl_operator_npi", asdcl_primary_indication: "some updated asdcl_primary_indication", asdcl_residual_shunt_size: "some updated asdcl_residual_shunt_size", asdcl_rim_meas_performed_yn: false, "asdcl_stop_flow,": "some updated asdcl_stop_flow,", asdcl_stop_flow_performed_yn: false, asdcl_stretch_diam_perform_yn: false, asdcl_stretched_diam_size: "some updated asdcl_stretched_diam_size", asdcl_total_septal_length: "some updated asdcl_total_septal_length", asdcl_treat_attempted_yn: false}
    @invalid_attrs %{"": nil, asdcl_aortic_rim_length: nil, asdcl_asd_size: nil, asdcl_atria_septal_aneurysm_yn: nil, asdcl_bal_sizing_perfomed_yn: nil, asdcl_defect_counter_assoc: nil, asdcl_defect_not_treated: nil, asdcl_device_used_outcome: nil, asdcl_device_utilized_id: nil, asdcl_device_utilized_name: nil, asdcl_ivc_rim_length: nil, asdcl_multi_fenestrated_yn: nil, asdcl_notes: nil, asdcl_operator_fname: nil, asdcl_operator_lname: nil, asdcl_operator_mname: nil, asdcl_operator_npi: nil, asdcl_primary_indication: nil, asdcl_residual_shunt_size: nil, asdcl_rim_meas_performed_yn: nil, "asdcl_stop_flow,": nil, asdcl_stop_flow_performed_yn: nil, asdcl_stretch_diam_perform_yn: nil, asdcl_stretched_diam_size: nil, asdcl_total_septal_length: nil, asdcl_treat_attempted_yn: nil}

    def asd_closure_fixture(attrs \\ %{}) do
      {:ok, asd_closure} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Interventions.create_asd_closure()

      asd_closure
    end

    test "list_asd_closures/0 returns all asd_closures" do
      asd_closure = asd_closure_fixture()
      assert Interventions.list_asd_closures() == [asd_closure]
    end

    test "get_asd_closure!/1 returns the asd_closure with given id" do
      asd_closure = asd_closure_fixture()
      assert Interventions.get_asd_closure!(asd_closure.id) == asd_closure
    end

    test "create_asd_closure/1 with valid data creates a asd_closure" do
      assert {:ok, %Asd_closure{} = asd_closure} = Interventions.create_asd_closure(@valid_attrs)
      assert asd_closure. == "some "
      assert asd_closure.asdcl_aortic_rim_length == "some asdcl_aortic_rim_length"
      assert asd_closure.asdcl_asd_size == "some asdcl_asd_size"
      assert asd_closure.asdcl_atria_septal_aneurysm_yn == "some asdcl_atria_septal_aneurysm_yn"
      assert asd_closure.asdcl_bal_sizing_perfomed_yn == true
      assert asd_closure.asdcl_defect_counter_assoc == "some asdcl_defect_counter_assoc"
      assert asd_closure.asdcl_defect_not_treated == "some asdcl_defect_not_treated"
      assert asd_closure.asdcl_device_used_outcome == "some asdcl_device_used_outcome"
      assert asd_closure.asdcl_device_utilized_id == "some asdcl_device_utilized_id"
      assert asd_closure.asdcl_device_utilized_name == "some asdcl_device_utilized_name"
      assert asd_closure.asdcl_ivc_rim_length == "some asdcl_ivc_rim_length"
      assert asd_closure.asdcl_multi_fenestrated_yn == true
      assert asd_closure.asdcl_notes == "some asdcl_notes"
      assert asd_closure.asdcl_operator_fname == "some asdcl_operator_fname"
      assert asd_closure.asdcl_operator_lname == "some asdcl_operator_lname"
      assert asd_closure.asdcl_operator_mname == "some asdcl_operator_mname"
      assert asd_closure.asdcl_operator_npi == "some asdcl_operator_npi"
      assert asd_closure.asdcl_primary_indication == "some asdcl_primary_indication"
      assert asd_closure.asdcl_residual_shunt_size == "some asdcl_residual_shunt_size"
      assert asd_closure.asdcl_rim_meas_performed_yn == true
      assert asd_closure.asdcl_stop_flow, == "some asdcl_stop_flow,"
      assert asd_closure.asdcl_stop_flow_performed_yn == true
      assert asd_closure.asdcl_stretch_diam_perform_yn == true
      assert asd_closure.asdcl_stretched_diam_size == "some asdcl_stretched_diam_size"
      assert asd_closure.asdcl_total_septal_length == "some asdcl_total_septal_length"
      assert asd_closure.asdcl_treat_attempted_yn == true
    end

    test "create_asd_closure/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Interventions.create_asd_closure(@invalid_attrs)
    end

    test "update_asd_closure/2 with valid data updates the asd_closure" do
      asd_closure = asd_closure_fixture()
      assert {:ok, %Asd_closure{} = asd_closure} = Interventions.update_asd_closure(asd_closure, @update_attrs)
      assert asd_closure. == "some updated "
      assert asd_closure.asdcl_aortic_rim_length == "some updated asdcl_aortic_rim_length"
      assert asd_closure.asdcl_asd_size == "some updated asdcl_asd_size"
      assert asd_closure.asdcl_atria_septal_aneurysm_yn == "some updated asdcl_atria_septal_aneurysm_yn"
      assert asd_closure.asdcl_bal_sizing_perfomed_yn == false
      assert asd_closure.asdcl_defect_counter_assoc == "some updated asdcl_defect_counter_assoc"
      assert asd_closure.asdcl_defect_not_treated == "some updated asdcl_defect_not_treated"
      assert asd_closure.asdcl_device_used_outcome == "some updated asdcl_device_used_outcome"
      assert asd_closure.asdcl_device_utilized_id == "some updated asdcl_device_utilized_id"
      assert asd_closure.asdcl_device_utilized_name == "some updated asdcl_device_utilized_name"
      assert asd_closure.asdcl_ivc_rim_length == "some updated asdcl_ivc_rim_length"
      assert asd_closure.asdcl_multi_fenestrated_yn == false
      assert asd_closure.asdcl_notes == "some updated asdcl_notes"
      assert asd_closure.asdcl_operator_fname == "some updated asdcl_operator_fname"
      assert asd_closure.asdcl_operator_lname == "some updated asdcl_operator_lname"
      assert asd_closure.asdcl_operator_mname == "some updated asdcl_operator_mname"
      assert asd_closure.asdcl_operator_npi == "some updated asdcl_operator_npi"
      assert asd_closure.asdcl_primary_indication == "some updated asdcl_primary_indication"
      assert asd_closure.asdcl_residual_shunt_size == "some updated asdcl_residual_shunt_size"
      assert asd_closure.asdcl_rim_meas_performed_yn == false
      assert asd_closure.asdcl_stop_flow, == "some updated asdcl_stop_flow,"
      assert asd_closure.asdcl_stop_flow_performed_yn == false
      assert asd_closure.asdcl_stretch_diam_perform_yn == false
      assert asd_closure.asdcl_stretched_diam_size == "some updated asdcl_stretched_diam_size"
      assert asd_closure.asdcl_total_septal_length == "some updated asdcl_total_septal_length"
      assert asd_closure.asdcl_treat_attempted_yn == false
    end

    test "update_asd_closure/2 with invalid data returns error changeset" do
      asd_closure = asd_closure_fixture()
      assert {:error, %Ecto.Changeset{}} = Interventions.update_asd_closure(asd_closure, @invalid_attrs)
      assert asd_closure == Interventions.get_asd_closure!(asd_closure.id)
    end

    test "delete_asd_closure/1 deletes the asd_closure" do
      asd_closure = asd_closure_fixture()
      assert {:ok, %Asd_closure{}} = Interventions.delete_asd_closure(asd_closure)
      assert_raise Ecto.NoResultsError, fn -> Interventions.get_asd_closure!(asd_closure.id) end
    end

    test "change_asd_closure/1 returns a asd_closure changeset" do
      asd_closure = asd_closure_fixture()
      assert %Ecto.Changeset{} = Interventions.change_asd_closure(asd_closure)
    end
  end

  describe "coarc_procedures" do
    alias Angio.Interventions.Coarc_procedure

    @valid_attrs %{"": "some ", coarc_ao_obstruction_post_sys_gradient: "some coarc_ao_obstruction_post_sys_gradient", coarc_ao_obstruction_pre_sys_gradient: "some coarc_ao_obstruction_pre_sys_gradient", coarc_aortic_obstruction_yn: true, coarc_arch_treated_yn: true, coarc_asdcl_operator_fname: "some coarc_asdcl_operator_fname", coarc_asdcl_operator_mname: "some coarc_asdcl_operator_mname", coarc_asdcl_operator_npi: "some coarc_asdcl_operator_npi", coarc_dt: ~D[2010-04-17], coarc_min_diam_post_proc: "some coarc_min_diam_post_proc", coarc_min_diam_pre_proc: "some coarc_min_diam_pre_proc", coarc_nature: "some coarc_nature", coarc_nature_post_prior_treatment: "some coarc_nature_post_prior_treatment", "coarc_notes,": "some coarc_notes,", coarc_operator_lname: "some coarc_operator_lname", coarc_peak_sys_gradient_post: "some coarc_peak_sys_gradient_post", coarc_peak_sys_gradient_pre: "some coarc_peak_sys_gradient_pre", coarc_primary_indication: "some coarc_primary_indication", coarc_tm: ~T[14:00:00]}
    @update_attrs %{"": "some updated ", coarc_ao_obstruction_post_sys_gradient: "some updated coarc_ao_obstruction_post_sys_gradient", coarc_ao_obstruction_pre_sys_gradient: "some updated coarc_ao_obstruction_pre_sys_gradient", coarc_aortic_obstruction_yn: false, coarc_arch_treated_yn: false, coarc_asdcl_operator_fname: "some updated coarc_asdcl_operator_fname", coarc_asdcl_operator_mname: "some updated coarc_asdcl_operator_mname", coarc_asdcl_operator_npi: "some updated coarc_asdcl_operator_npi", coarc_dt: ~D[2011-05-18], coarc_min_diam_post_proc: "some updated coarc_min_diam_post_proc", coarc_min_diam_pre_proc: "some updated coarc_min_diam_pre_proc", coarc_nature: "some updated coarc_nature", coarc_nature_post_prior_treatment: "some updated coarc_nature_post_prior_treatment", "coarc_notes,": "some updated coarc_notes,", coarc_operator_lname: "some updated coarc_operator_lname", coarc_peak_sys_gradient_post: "some updated coarc_peak_sys_gradient_post", coarc_peak_sys_gradient_pre: "some updated coarc_peak_sys_gradient_pre", coarc_primary_indication: "some updated coarc_primary_indication", coarc_tm: ~T[15:01:01]}
    @invalid_attrs %{"": nil, coarc_ao_obstruction_post_sys_gradient: nil, coarc_ao_obstruction_pre_sys_gradient: nil, coarc_aortic_obstruction_yn: nil, coarc_arch_treated_yn: nil, coarc_asdcl_operator_fname: nil, coarc_asdcl_operator_mname: nil, coarc_asdcl_operator_npi: nil, coarc_dt: nil, coarc_min_diam_post_proc: nil, coarc_min_diam_pre_proc: nil, coarc_nature: nil, coarc_nature_post_prior_treatment: nil, "coarc_notes,": nil, coarc_operator_lname: nil, coarc_peak_sys_gradient_post: nil, coarc_peak_sys_gradient_pre: nil, coarc_primary_indication: nil, coarc_tm: nil}

    def coarc_procedure_fixture(attrs \\ %{}) do
      {:ok, coarc_procedure} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Interventions.create_coarc_procedure()

      coarc_procedure
    end

    test "list_coarc_procedures/0 returns all coarc_procedures" do
      coarc_procedure = coarc_procedure_fixture()
      assert Interventions.list_coarc_procedures() == [coarc_procedure]
    end

    test "get_coarc_procedure!/1 returns the coarc_procedure with given id" do
      coarc_procedure = coarc_procedure_fixture()
      assert Interventions.get_coarc_procedure!(coarc_procedure.id) == coarc_procedure
    end

    test "create_coarc_procedure/1 with valid data creates a coarc_procedure" do
      assert {:ok, %Coarc_procedure{} = coarc_procedure} = Interventions.create_coarc_procedure(@valid_attrs)
      assert coarc_procedure. == "some "
      assert coarc_procedure.coarc_ao_obstruction_post_sys_gradient == "some coarc_ao_obstruction_post_sys_gradient"
      assert coarc_procedure.coarc_ao_obstruction_pre_sys_gradient == "some coarc_ao_obstruction_pre_sys_gradient"
      assert coarc_procedure.coarc_aortic_obstruction_yn == true
      assert coarc_procedure.coarc_arch_treated_yn == true
      assert coarc_procedure.coarc_asdcl_operator_fname == "some coarc_asdcl_operator_fname"
      assert coarc_procedure.coarc_asdcl_operator_mname == "some coarc_asdcl_operator_mname"
      assert coarc_procedure.coarc_asdcl_operator_npi == "some coarc_asdcl_operator_npi"
      assert coarc_procedure.coarc_dt == ~D[2010-04-17]
      assert coarc_procedure.coarc_min_diam_post_proc == "some coarc_min_diam_post_proc"
      assert coarc_procedure.coarc_min_diam_pre_proc == "some coarc_min_diam_pre_proc"
      assert coarc_procedure.coarc_nature == "some coarc_nature"
      assert coarc_procedure.coarc_nature_post_prior_treatment == "some coarc_nature_post_prior_treatment"
      assert coarc_procedure.coarc_notes, == "some coarc_notes,"
      assert coarc_procedure.coarc_operator_lname == "some coarc_operator_lname"
      assert coarc_procedure.coarc_peak_sys_gradient_post == "some coarc_peak_sys_gradient_post"
      assert coarc_procedure.coarc_peak_sys_gradient_pre == "some coarc_peak_sys_gradient_pre"
      assert coarc_procedure.coarc_primary_indication == "some coarc_primary_indication"
      assert coarc_procedure.coarc_tm == ~T[14:00:00]
    end

    test "create_coarc_procedure/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Interventions.create_coarc_procedure(@invalid_attrs)
    end

    test "update_coarc_procedure/2 with valid data updates the coarc_procedure" do
      coarc_procedure = coarc_procedure_fixture()
      assert {:ok, %Coarc_procedure{} = coarc_procedure} = Interventions.update_coarc_procedure(coarc_procedure, @update_attrs)
      assert coarc_procedure. == "some updated "
      assert coarc_procedure.coarc_ao_obstruction_post_sys_gradient == "some updated coarc_ao_obstruction_post_sys_gradient"
      assert coarc_procedure.coarc_ao_obstruction_pre_sys_gradient == "some updated coarc_ao_obstruction_pre_sys_gradient"
      assert coarc_procedure.coarc_aortic_obstruction_yn == false
      assert coarc_procedure.coarc_arch_treated_yn == false
      assert coarc_procedure.coarc_asdcl_operator_fname == "some updated coarc_asdcl_operator_fname"
      assert coarc_procedure.coarc_asdcl_operator_mname == "some updated coarc_asdcl_operator_mname"
      assert coarc_procedure.coarc_asdcl_operator_npi == "some updated coarc_asdcl_operator_npi"
      assert coarc_procedure.coarc_dt == ~D[2011-05-18]
      assert coarc_procedure.coarc_min_diam_post_proc == "some updated coarc_min_diam_post_proc"
      assert coarc_procedure.coarc_min_diam_pre_proc == "some updated coarc_min_diam_pre_proc"
      assert coarc_procedure.coarc_nature == "some updated coarc_nature"
      assert coarc_procedure.coarc_nature_post_prior_treatment == "some updated coarc_nature_post_prior_treatment"
      assert coarc_procedure.coarc_notes, == "some updated coarc_notes,"
      assert coarc_procedure.coarc_operator_lname == "some updated coarc_operator_lname"
      assert coarc_procedure.coarc_peak_sys_gradient_post == "some updated coarc_peak_sys_gradient_post"
      assert coarc_procedure.coarc_peak_sys_gradient_pre == "some updated coarc_peak_sys_gradient_pre"
      assert coarc_procedure.coarc_primary_indication == "some updated coarc_primary_indication"
      assert coarc_procedure.coarc_tm == ~T[15:01:01]
    end

    test "update_coarc_procedure/2 with invalid data returns error changeset" do
      coarc_procedure = coarc_procedure_fixture()
      assert {:error, %Ecto.Changeset{}} = Interventions.update_coarc_procedure(coarc_procedure, @invalid_attrs)
      assert coarc_procedure == Interventions.get_coarc_procedure!(coarc_procedure.id)
    end

    test "delete_coarc_procedure/1 deletes the coarc_procedure" do
      coarc_procedure = coarc_procedure_fixture()
      assert {:ok, %Coarc_procedure{}} = Interventions.delete_coarc_procedure(coarc_procedure)
      assert_raise Ecto.NoResultsError, fn -> Interventions.get_coarc_procedure!(coarc_procedure.id) end
    end

    test "change_coarc_procedure/1 returns a coarc_procedure changeset" do
      coarc_procedure = coarc_procedure_fixture()
      assert %Ecto.Changeset{} = Interventions.change_coarc_procedure(coarc_procedure)
    end
  end

  describe "coarc_devices" do
    alias Angio.Interventions.Coarc_device

    @valid_attrs %{coarc_balloon_max_pres: "some coarc_balloon_max_pres", coarc_balloon_outcome: "some coarc_balloon_outcome", coarc_balloon_purpose: "some coarc_balloon_purpose", coarc_device_counter: "some coarc_device_counter", coarc_device_id: "some coarc_device_id", coarc_device_notes: "some coarc_device_notes", coarc_device_type: "some coarc_device_type", coarc_stent_diam_min_assesed_yn: true, coarc_stent_diam_min_post: "some coarc_stent_diam_min_post", coarc_stent_outcome: "some coarc_stent_outcome"}
    @update_attrs %{coarc_balloon_max_pres: "some updated coarc_balloon_max_pres", coarc_balloon_outcome: "some updated coarc_balloon_outcome", coarc_balloon_purpose: "some updated coarc_balloon_purpose", coarc_device_counter: "some updated coarc_device_counter", coarc_device_id: "some updated coarc_device_id", coarc_device_notes: "some updated coarc_device_notes", coarc_device_type: "some updated coarc_device_type", coarc_stent_diam_min_assesed_yn: false, coarc_stent_diam_min_post: "some updated coarc_stent_diam_min_post", coarc_stent_outcome: "some updated coarc_stent_outcome"}
    @invalid_attrs %{coarc_balloon_max_pres: nil, coarc_balloon_outcome: nil, coarc_balloon_purpose: nil, coarc_device_counter: nil, coarc_device_id: nil, coarc_device_notes: nil, coarc_device_type: nil, coarc_stent_diam_min_assesed_yn: nil, coarc_stent_diam_min_post: nil, coarc_stent_outcome: nil}

    def coarc_device_fixture(attrs \\ %{}) do
      {:ok, coarc_device} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Interventions.create_coarc_device()

      coarc_device
    end

    test "list_coarc_devices/0 returns all coarc_devices" do
      coarc_device = coarc_device_fixture()
      assert Interventions.list_coarc_devices() == [coarc_device]
    end

    test "get_coarc_device!/1 returns the coarc_device with given id" do
      coarc_device = coarc_device_fixture()
      assert Interventions.get_coarc_device!(coarc_device.id) == coarc_device
    end

    test "create_coarc_device/1 with valid data creates a coarc_device" do
      assert {:ok, %Coarc_device{} = coarc_device} = Interventions.create_coarc_device(@valid_attrs)
      assert coarc_device.coarc_balloon_max_pres == "some coarc_balloon_max_pres"
      assert coarc_device.coarc_balloon_outcome == "some coarc_balloon_outcome"
      assert coarc_device.coarc_balloon_purpose == "some coarc_balloon_purpose"
      assert coarc_device.coarc_device_counter == "some coarc_device_counter"
      assert coarc_device.coarc_device_id == "some coarc_device_id"
      assert coarc_device.coarc_device_notes == "some coarc_device_notes"
      assert coarc_device.coarc_device_type == "some coarc_device_type"
      assert coarc_device.coarc_stent_diam_min_assesed_yn == true
      assert coarc_device.coarc_stent_diam_min_post == "some coarc_stent_diam_min_post"
      assert coarc_device.coarc_stent_outcome == "some coarc_stent_outcome"
    end

    test "create_coarc_device/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Interventions.create_coarc_device(@invalid_attrs)
    end

    test "update_coarc_device/2 with valid data updates the coarc_device" do
      coarc_device = coarc_device_fixture()
      assert {:ok, %Coarc_device{} = coarc_device} = Interventions.update_coarc_device(coarc_device, @update_attrs)
      assert coarc_device.coarc_balloon_max_pres == "some updated coarc_balloon_max_pres"
      assert coarc_device.coarc_balloon_outcome == "some updated coarc_balloon_outcome"
      assert coarc_device.coarc_balloon_purpose == "some updated coarc_balloon_purpose"
      assert coarc_device.coarc_device_counter == "some updated coarc_device_counter"
      assert coarc_device.coarc_device_id == "some updated coarc_device_id"
      assert coarc_device.coarc_device_notes == "some updated coarc_device_notes"
      assert coarc_device.coarc_device_type == "some updated coarc_device_type"
      assert coarc_device.coarc_stent_diam_min_assesed_yn == false
      assert coarc_device.coarc_stent_diam_min_post == "some updated coarc_stent_diam_min_post"
      assert coarc_device.coarc_stent_outcome == "some updated coarc_stent_outcome"
    end

    test "update_coarc_device/2 with invalid data returns error changeset" do
      coarc_device = coarc_device_fixture()
      assert {:error, %Ecto.Changeset{}} = Interventions.update_coarc_device(coarc_device, @invalid_attrs)
      assert coarc_device == Interventions.get_coarc_device!(coarc_device.id)
    end

    test "delete_coarc_device/1 deletes the coarc_device" do
      coarc_device = coarc_device_fixture()
      assert {:ok, %Coarc_device{}} = Interventions.delete_coarc_device(coarc_device)
      assert_raise Ecto.NoResultsError, fn -> Interventions.get_coarc_device!(coarc_device.id) end
    end

    test "change_coarc_device/1 returns a coarc_device changeset" do
      coarc_device = coarc_device_fixture()
      assert %Ecto.Changeset{} = Interventions.change_coarc_device(coarc_device)
    end
  end

  describe "av_plasties" do
    alias Angio.Interventions.Av_plasty

    @valid_attrs %{avp_av_ann_diam_us: "some avp_av_ann_diam_us", avp_av_morphology: "some avp_av_morphology", avp_av_reg_degree_pre: "some avp_av_reg_degree_pre", avp_dt: ~D[2010-04-17], avp_notes: "some avp_notes", avp_operator_fname: "some avp_operator_fname", avp_operator_lname: "some avp_operator_lname", avp_operator_mname: "some avp_operator_mname", avp_operator_npi: "some avp_operator_npi", avp_peak_sys_gradient_pre: "some avp_peak_sys_gradient_pre", avp_primary_indication: "some avp_primary_indication", avp_tm: ~T[14:00:00]}
    @update_attrs %{avp_av_ann_diam_us: "some updated avp_av_ann_diam_us", avp_av_morphology: "some updated avp_av_morphology", avp_av_reg_degree_pre: "some updated avp_av_reg_degree_pre", avp_dt: ~D[2011-05-18], avp_notes: "some updated avp_notes", avp_operator_fname: "some updated avp_operator_fname", avp_operator_lname: "some updated avp_operator_lname", avp_operator_mname: "some updated avp_operator_mname", avp_operator_npi: "some updated avp_operator_npi", avp_peak_sys_gradient_pre: "some updated avp_peak_sys_gradient_pre", avp_primary_indication: "some updated avp_primary_indication", avp_tm: ~T[15:01:01]}
    @invalid_attrs %{avp_av_ann_diam_us: nil, avp_av_morphology: nil, avp_av_reg_degree_pre: nil, avp_dt: nil, avp_notes: nil, avp_operator_fname: nil, avp_operator_lname: nil, avp_operator_mname: nil, avp_operator_npi: nil, avp_peak_sys_gradient_pre: nil, avp_primary_indication: nil, avp_tm: nil}

    def av_plasty_fixture(attrs \\ %{}) do
      {:ok, av_plasty} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Interventions.create_av_plasty()

      av_plasty
    end

    test "list_av_plasties/0 returns all av_plasties" do
      av_plasty = av_plasty_fixture()
      assert Interventions.list_av_plasties() == [av_plasty]
    end

    test "get_av_plasty!/1 returns the av_plasty with given id" do
      av_plasty = av_plasty_fixture()
      assert Interventions.get_av_plasty!(av_plasty.id) == av_plasty
    end

    test "create_av_plasty/1 with valid data creates a av_plasty" do
      assert {:ok, %Av_plasty{} = av_plasty} = Interventions.create_av_plasty(@valid_attrs)
      assert av_plasty.avp_av_ann_diam_us == "some avp_av_ann_diam_us"
      assert av_plasty.avp_av_morphology == "some avp_av_morphology"
      assert av_plasty.avp_av_reg_degree_pre == "some avp_av_reg_degree_pre"
      assert av_plasty.avp_dt == ~D[2010-04-17]
      assert av_plasty.avp_notes == "some avp_notes"
      assert av_plasty.avp_operator_fname == "some avp_operator_fname"
      assert av_plasty.avp_operator_lname == "some avp_operator_lname"
      assert av_plasty.avp_operator_mname == "some avp_operator_mname"
      assert av_plasty.avp_operator_npi == "some avp_operator_npi"
      assert av_plasty.avp_peak_sys_gradient_pre == "some avp_peak_sys_gradient_pre"
      assert av_plasty.avp_primary_indication == "some avp_primary_indication"
      assert av_plasty.avp_tm == ~T[14:00:00]
    end

    test "create_av_plasty/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Interventions.create_av_plasty(@invalid_attrs)
    end

    test "update_av_plasty/2 with valid data updates the av_plasty" do
      av_plasty = av_plasty_fixture()
      assert {:ok, %Av_plasty{} = av_plasty} = Interventions.update_av_plasty(av_plasty, @update_attrs)
      assert av_plasty.avp_av_ann_diam_us == "some updated avp_av_ann_diam_us"
      assert av_plasty.avp_av_morphology == "some updated avp_av_morphology"
      assert av_plasty.avp_av_reg_degree_pre == "some updated avp_av_reg_degree_pre"
      assert av_plasty.avp_dt == ~D[2011-05-18]
      assert av_plasty.avp_notes == "some updated avp_notes"
      assert av_plasty.avp_operator_fname == "some updated avp_operator_fname"
      assert av_plasty.avp_operator_lname == "some updated avp_operator_lname"
      assert av_plasty.avp_operator_mname == "some updated avp_operator_mname"
      assert av_plasty.avp_operator_npi == "some updated avp_operator_npi"
      assert av_plasty.avp_peak_sys_gradient_pre == "some updated avp_peak_sys_gradient_pre"
      assert av_plasty.avp_primary_indication == "some updated avp_primary_indication"
      assert av_plasty.avp_tm == ~T[15:01:01]
    end

    test "update_av_plasty/2 with invalid data returns error changeset" do
      av_plasty = av_plasty_fixture()
      assert {:error, %Ecto.Changeset{}} = Interventions.update_av_plasty(av_plasty, @invalid_attrs)
      assert av_plasty == Interventions.get_av_plasty!(av_plasty.id)
    end

    test "delete_av_plasty/1 deletes the av_plasty" do
      av_plasty = av_plasty_fixture()
      assert {:ok, %Av_plasty{}} = Interventions.delete_av_plasty(av_plasty)
      assert_raise Ecto.NoResultsError, fn -> Interventions.get_av_plasty!(av_plasty.id) end
    end

    test "change_av_plasty/1 returns a av_plasty changeset" do
      av_plasty = av_plasty_fixture()
      assert %Ecto.Changeset{} = Interventions.change_av_plasty(av_plasty)
    end
  end

  describe "av_plasties_inflations" do
    alias Angio.Interventions.Av_plasties_inflation

    @valid_attrs %{avp_bal_outcome: "some avp_bal_outcome", avpi_av_reg_degree_post: "some avpi_av_reg_degree_post", avpi_balloon_technique: "some avpi_balloon_technique", avpi_db_bal_2_id: "some avpi_db_bal_2_id", avpi_inflation_counter: "some avpi_inflation_counter", avpi_max_inflation_pres: "some avpi_max_inflation_pres", avpi_notes: "some avpi_notes", avpi_peak_sys_gradient_post: "some avpi_peak_sys_gradient_post", avpi_sb_bal_1_id: "some avpi_sb_bal_1_id", avpi_stabilization_yn: true}
    @update_attrs %{avp_bal_outcome: "some updated avp_bal_outcome", avpi_av_reg_degree_post: "some updated avpi_av_reg_degree_post", avpi_balloon_technique: "some updated avpi_balloon_technique", avpi_db_bal_2_id: "some updated avpi_db_bal_2_id", avpi_inflation_counter: "some updated avpi_inflation_counter", avpi_max_inflation_pres: "some updated avpi_max_inflation_pres", avpi_notes: "some updated avpi_notes", avpi_peak_sys_gradient_post: "some updated avpi_peak_sys_gradient_post", avpi_sb_bal_1_id: "some updated avpi_sb_bal_1_id", avpi_stabilization_yn: false}
    @invalid_attrs %{avp_bal_outcome: nil, avpi_av_reg_degree_post: nil, avpi_balloon_technique: nil, avpi_db_bal_2_id: nil, avpi_inflation_counter: nil, avpi_max_inflation_pres: nil, avpi_notes: nil, avpi_peak_sys_gradient_post: nil, avpi_sb_bal_1_id: nil, avpi_stabilization_yn: nil}

    def av_plasties_inflation_fixture(attrs \\ %{}) do
      {:ok, av_plasties_inflation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Interventions.create_av_plasties_inflation()

      av_plasties_inflation
    end

    test "list_av_plasties_inflations/0 returns all av_plasties_inflations" do
      av_plasties_inflation = av_plasties_inflation_fixture()
      assert Interventions.list_av_plasties_inflations() == [av_plasties_inflation]
    end

    test "get_av_plasties_inflation!/1 returns the av_plasties_inflation with given id" do
      av_plasties_inflation = av_plasties_inflation_fixture()
      assert Interventions.get_av_plasties_inflation!(av_plasties_inflation.id) == av_plasties_inflation
    end

    test "create_av_plasties_inflation/1 with valid data creates a av_plasties_inflation" do
      assert {:ok, %Av_plasties_inflation{} = av_plasties_inflation} = Interventions.create_av_plasties_inflation(@valid_attrs)
      assert av_plasties_inflation.avp_bal_outcome == "some avp_bal_outcome"
      assert av_plasties_inflation.avpi_av_reg_degree_post == "some avpi_av_reg_degree_post"
      assert av_plasties_inflation.avpi_balloon_technique == "some avpi_balloon_technique"
      assert av_plasties_inflation.avpi_db_bal_2_id == "some avpi_db_bal_2_id"
      assert av_plasties_inflation.avpi_inflation_counter == "some avpi_inflation_counter"
      assert av_plasties_inflation.avpi_max_inflation_pres == "some avpi_max_inflation_pres"
      assert av_plasties_inflation.avpi_notes == "some avpi_notes"
      assert av_plasties_inflation.avpi_peak_sys_gradient_post == "some avpi_peak_sys_gradient_post"
      assert av_plasties_inflation.avpi_sb_bal_1_id == "some avpi_sb_bal_1_id"
      assert av_plasties_inflation.avpi_stabilization_yn == true
    end

    test "create_av_plasties_inflation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Interventions.create_av_plasties_inflation(@invalid_attrs)
    end

    test "update_av_plasties_inflation/2 with valid data updates the av_plasties_inflation" do
      av_plasties_inflation = av_plasties_inflation_fixture()
      assert {:ok, %Av_plasties_inflation{} = av_plasties_inflation} = Interventions.update_av_plasties_inflation(av_plasties_inflation, @update_attrs)
      assert av_plasties_inflation.avp_bal_outcome == "some updated avp_bal_outcome"
      assert av_plasties_inflation.avpi_av_reg_degree_post == "some updated avpi_av_reg_degree_post"
      assert av_plasties_inflation.avpi_balloon_technique == "some updated avpi_balloon_technique"
      assert av_plasties_inflation.avpi_db_bal_2_id == "some updated avpi_db_bal_2_id"
      assert av_plasties_inflation.avpi_inflation_counter == "some updated avpi_inflation_counter"
      assert av_plasties_inflation.avpi_max_inflation_pres == "some updated avpi_max_inflation_pres"
      assert av_plasties_inflation.avpi_notes == "some updated avpi_notes"
      assert av_plasties_inflation.avpi_peak_sys_gradient_post == "some updated avpi_peak_sys_gradient_post"
      assert av_plasties_inflation.avpi_sb_bal_1_id == "some updated avpi_sb_bal_1_id"
      assert av_plasties_inflation.avpi_stabilization_yn == false
    end

    test "update_av_plasties_inflation/2 with invalid data returns error changeset" do
      av_plasties_inflation = av_plasties_inflation_fixture()
      assert {:error, %Ecto.Changeset{}} = Interventions.update_av_plasties_inflation(av_plasties_inflation, @invalid_attrs)
      assert av_plasties_inflation == Interventions.get_av_plasties_inflation!(av_plasties_inflation.id)
    end

    test "delete_av_plasties_inflation/1 deletes the av_plasties_inflation" do
      av_plasties_inflation = av_plasties_inflation_fixture()
      assert {:ok, %Av_plasties_inflation{}} = Interventions.delete_av_plasties_inflation(av_plasties_inflation)
      assert_raise Ecto.NoResultsError, fn -> Interventions.get_av_plasties_inflation!(av_plasties_inflation.id) end
    end

    test "change_av_plasties_inflation/1 returns a av_plasties_inflation changeset" do
      av_plasties_inflation = av_plasties_inflation_fixture()
      assert %Ecto.Changeset{} = Interventions.change_av_plasties_inflation(av_plasties_inflation)
    end
  end

  describe "pci_procedures" do
    alias Angio.Interventions.Pci_procedure

    @valid_attrs %{pci_proc_multivessel_result: "some pci_proc_multivessel_result", pci_proc_surg_consult: "some pci_proc_surg_consult", pci_proc_50pct_lad_yn: true, pci_proc_lab_num: "some pci_proc_lab_num", pci_proc_operator_fname: "some pci_proc_operator_fname", pci_proc_lab_arrive_dt: ~D[2010-04-17], pci_proc_success_yn: true, pci_proc_les_treated_num: "some pci_proc_les_treated_num", pci_proc_indication: "some pci_proc_indication", pci_proc_primary_transfer_yn: true, pci_proc_ballons_used_num: "some pci_proc_ballons_used_num", pci_proc_entry: "some pci_proc_entry", pci_proc_les_attempt_num: "some pci_proc_les_attempt_num", pci_proc_50pct_lcx_yn: true, pci_proc_machine_id: "some pci_proc_machine_id", pci_proc_operator_lname: "some pci_proc_operator_lname", pci_proc_status_acs: "some pci_proc_status_acs", pci_proc_device_first_activ_dt: ~D[2010-04-17], pci_proc_stemi_onset_tm: ~T[14:00:00], pci_proc_dev_first_activ_tm: ~T[14:00:00], pci_proc_stemi_onset_dt: ~D[2010-04-17], pci_proc_lv_ef_pre_na: true, pci_proc_fluoro_tm: "some pci_proc_fluoro_tm", pci_proc_status_stemi: "some pci_proc_status_stemi", pci_proc_50pct_graft_yn: true, pci_proc_lab_arrive_tm: ~T[14:00:00], pci_proc_closure_device: "some pci_proc_closure_device", pci_proc_stents_used_num: "some pci_proc_stents_used_num", pci_proc_multivessel_yn: true, pci_proc_surg_consult_yn: true, pci_proc_operator_npi: "some pci_proc_operator_npi", pci_proc_lv_ef_pre_val: "some pci_proc_lv_ef_pre_val", pci_proc_fluoro_dose: "some pci_proc_fluoro_dose", pci_proc_lab_out_tm: ~T[14:00:00], pci_proc_device_deployed_yn: true, pci_proc_50pct_lm_yn: true, pci_proc_contrast_volume: "some pci_proc_contrast_volume", pci_proc_stents_implanted_num: "some pci_proc_stents_implanted_num", pci_proc_status: "some pci_proc_status", pci_proc_operator_mname: "some pci_proc_operator_mname", pci_proc_50pct_rca_yn: true, pci_proc_notes: "some pci_proc_notes", pci_proc_syndax_score: "some pci_proc_syndax_score"}
    @update_attrs %{pci_proc_multivessel_result: "some updated pci_proc_multivessel_result", pci_proc_surg_consult: "some updated pci_proc_surg_consult", pci_proc_50pct_lad_yn: false, pci_proc_lab_num: "some updated pci_proc_lab_num", pci_proc_operator_fname: "some updated pci_proc_operator_fname", pci_proc_lab_arrive_dt: ~D[2011-05-18], pci_proc_success_yn: false, pci_proc_les_treated_num: "some updated pci_proc_les_treated_num", pci_proc_indication: "some updated pci_proc_indication", pci_proc_primary_transfer_yn: false, pci_proc_ballons_used_num: "some updated pci_proc_ballons_used_num", pci_proc_entry: "some updated pci_proc_entry", pci_proc_les_attempt_num: "some updated pci_proc_les_attempt_num", pci_proc_50pct_lcx_yn: false, pci_proc_machine_id: "some updated pci_proc_machine_id", pci_proc_operator_lname: "some updated pci_proc_operator_lname", pci_proc_status_acs: "some updated pci_proc_status_acs", pci_proc_device_first_activ_dt: ~D[2011-05-18], pci_proc_stemi_onset_tm: ~T[15:01:01], pci_proc_dev_first_activ_tm: ~T[15:01:01], pci_proc_stemi_onset_dt: ~D[2011-05-18], pci_proc_lv_ef_pre_na: false, pci_proc_fluoro_tm: "some updated pci_proc_fluoro_tm", pci_proc_status_stemi: "some updated pci_proc_status_stemi", pci_proc_50pct_graft_yn: false, pci_proc_lab_arrive_tm: ~T[15:01:01], pci_proc_closure_device: "some updated pci_proc_closure_device", pci_proc_stents_used_num: "some updated pci_proc_stents_used_num", pci_proc_multivessel_yn: false, pci_proc_surg_consult_yn: false, pci_proc_operator_npi: "some updated pci_proc_operator_npi", pci_proc_lv_ef_pre_val: "some updated pci_proc_lv_ef_pre_val", pci_proc_fluoro_dose: "some updated pci_proc_fluoro_dose", pci_proc_lab_out_tm: ~T[15:01:01], pci_proc_device_deployed_yn: false, pci_proc_50pct_lm_yn: false, pci_proc_contrast_volume: "some updated pci_proc_contrast_volume", pci_proc_stents_implanted_num: "some updated pci_proc_stents_implanted_num", pci_proc_status: "some updated pci_proc_status", pci_proc_operator_mname: "some updated pci_proc_operator_mname", pci_proc_50pct_rca_yn: false, pci_proc_notes: "some updated pci_proc_notes", pci_proc_syndax_score: "some updated pci_proc_syndax_score"}
    @invalid_attrs %{pci_proc_multivessel_result: nil, pci_proc_surg_consult: nil, pci_proc_50pct_lad_yn: nil, pci_proc_lab_num: nil, pci_proc_operator_fname: nil, pci_proc_lab_arrive_dt: nil, pci_proc_success_yn: nil, pci_proc_les_treated_num: nil, pci_proc_indication: nil, pci_proc_primary_transfer_yn: nil, pci_proc_ballons_used_num: nil, pci_proc_entry: nil, pci_proc_les_attempt_num: nil, pci_proc_50pct_lcx_yn: nil, pci_proc_machine_id: nil, pci_proc_operator_lname: nil, pci_proc_status_acs: nil, pci_proc_device_first_activ_dt: nil, pci_proc_stemi_onset_tm: nil, pci_proc_dev_first_activ_tm: nil, pci_proc_stemi_onset_dt: nil, pci_proc_lv_ef_pre_na: nil, pci_proc_fluoro_tm: nil, pci_proc_status_stemi: nil, pci_proc_50pct_graft_yn: nil, pci_proc_lab_arrive_tm: nil, pci_proc_closure_device: nil, pci_proc_stents_used_num: nil, pci_proc_multivessel_yn: nil, pci_proc_surg_consult_yn: nil, pci_proc_operator_npi: nil, pci_proc_lv_ef_pre_val: nil, pci_proc_fluoro_dose: nil, pci_proc_lab_out_tm: nil, pci_proc_device_deployed_yn: nil, pci_proc_50pct_lm_yn: nil, pci_proc_contrast_volume: nil, pci_proc_stents_implanted_num: nil, pci_proc_status: nil, pci_proc_operator_mname: nil, pci_proc_50pct_rca_yn: nil, pci_proc_notes: nil, pci_proc_syndax_score: nil}

    def pci_procedure_fixture(attrs \\ %{}) do
      {:ok, pci_procedure} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Interventions.create_pci_procedure()

      pci_procedure
    end

    test "list_pci_procedures/0 returns all pci_procedures" do
      pci_procedure = pci_procedure_fixture()
      assert Interventions.list_pci_procedures() == [pci_procedure]
    end

    test "get_pci_procedure!/1 returns the pci_procedure with given id" do
      pci_procedure = pci_procedure_fixture()
      assert Interventions.get_pci_procedure!(pci_procedure.id) == pci_procedure
    end

    test "create_pci_procedure/1 with valid data creates a pci_procedure" do
      assert {:ok, %Pci_procedure{} = pci_procedure} = Interventions.create_pci_procedure(@valid_attrs)
      assert pci_procedure.pci_proc_syndax_score == "some pci_proc_syndax_score"
      assert pci_procedure.pci_proc_notes == "some pci_proc_notes"
      assert pci_procedure.pci_proc_50pct_rca_yn == true
      assert pci_procedure.pci_proc_operator_mname == "some pci_proc_operator_mname"
      assert pci_procedure.pci_proc_status == "some pci_proc_status"
      assert pci_procedure.pci_proc_stents_implanted_num == "some pci_proc_stents_implanted_num"
      assert pci_procedure.pci_proc_contrast_volume == "some pci_proc_contrast_volume"
      assert pci_procedure.pci_proc_50pct_lm_yn == true
      assert pci_procedure.pci_proc_device_deployed_yn == true
      assert pci_procedure.pci_proc_lab_out_tm == ~T[14:00:00]
      assert pci_procedure.pci_proc_fluoro_dose == "some pci_proc_fluoro_dose"
      assert pci_procedure.pci_proc_lv_ef_pre_val == "some pci_proc_lv_ef_pre_val"
      assert pci_procedure.pci_proc_operator_npi == "some pci_proc_operator_npi"
      assert pci_procedure.pci_proc_surg_consult_yn == true
      assert pci_procedure.pci_proc_multivessel_yn == true
      assert pci_procedure.pci_proc_stents_used_num == "some pci_proc_stents_used_num"
      assert pci_procedure.pci_proc_closure_device == "some pci_proc_closure_device"
      assert pci_procedure.pci_proc_lab_arrive_tm == ~T[14:00:00]
      assert pci_procedure.pci_proc_50pct_graft_yn == true
      assert pci_procedure.pci_proc_status_stemi == "some pci_proc_status_stemi"
      assert pci_procedure.pci_proc_fluoro_tm == "some pci_proc_fluoro_tm"
      assert pci_procedure.pci_proc_lv_ef_pre_na == true
      assert pci_procedure.pci_proc_stemi_onset_dt == ~D[2010-04-17]
      assert pci_procedure.pci_proc_dev_first_activ_tm == ~T[14:00:00]
      assert pci_procedure.pci_proc_stemi_onset_tm == ~T[14:00:00]
      assert pci_procedure.pci_proc_device_first_activ_dt == ~D[2010-04-17]
      assert pci_procedure.pci_proc_status_acs == "some pci_proc_status_acs"
      assert pci_procedure.pci_proc_operator_lname == "some pci_proc_operator_lname"
      assert pci_procedure.pci_proc_machine_id == "some pci_proc_machine_id"
      assert pci_procedure.pci_proc_50pct_lcx_yn == true
      assert pci_procedure.pci_proc_les_attempt_num == "some pci_proc_les_attempt_num"
      assert pci_procedure.pci_proc_entry == "some pci_proc_entry"
      assert pci_procedure.pci_proc_ballons_used_num == "some pci_proc_ballons_used_num"
      assert pci_procedure.pci_proc_primary_transfer_yn == true
      assert pci_procedure.pci_proc_indication == "some pci_proc_indication"
      assert pci_procedure.pci_proc_les_treated_num == "some pci_proc_les_treated_num"
      assert pci_procedure.pci_proc_success_yn == true
      assert pci_procedure.pci_proc_lab_arrive_dt == ~D[2010-04-17]
      assert pci_procedure.pci_proc_operator_fname == "some pci_proc_operator_fname"
      assert pci_procedure.pci_proc_lab_num == "some pci_proc_lab_num"
      assert pci_procedure.pci_proc_50pct_lad_yn == true
      assert pci_procedure.pci_proc_surg_consult == "some pci_proc_surg_consult"
      assert pci_procedure.pci_proc_multivessel_result == "some pci_proc_multivessel_result"
    end

    test "create_pci_procedure/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Interventions.create_pci_procedure(@invalid_attrs)
    end

    test "update_pci_procedure/2 with valid data updates the pci_procedure" do
      pci_procedure = pci_procedure_fixture()
      assert {:ok, %Pci_procedure{} = pci_procedure} = Interventions.update_pci_procedure(pci_procedure, @update_attrs)
      assert pci_procedure.pci_proc_syndax_score == "some updated pci_proc_syndax_score"
      assert pci_procedure.pci_proc_notes == "some updated pci_proc_notes"
      assert pci_procedure.pci_proc_50pct_rca_yn == false
      assert pci_procedure.pci_proc_operator_mname == "some updated pci_proc_operator_mname"
      assert pci_procedure.pci_proc_status == "some updated pci_proc_status"
      assert pci_procedure.pci_proc_stents_implanted_num == "some updated pci_proc_stents_implanted_num"
      assert pci_procedure.pci_proc_contrast_volume == "some updated pci_proc_contrast_volume"
      assert pci_procedure.pci_proc_50pct_lm_yn == false
      assert pci_procedure.pci_proc_device_deployed_yn == false
      assert pci_procedure.pci_proc_lab_out_tm == ~T[15:01:01]
      assert pci_procedure.pci_proc_fluoro_dose == "some updated pci_proc_fluoro_dose"
      assert pci_procedure.pci_proc_lv_ef_pre_val == "some updated pci_proc_lv_ef_pre_val"
      assert pci_procedure.pci_proc_operator_npi == "some updated pci_proc_operator_npi"
      assert pci_procedure.pci_proc_surg_consult_yn == false
      assert pci_procedure.pci_proc_multivessel_yn == false
      assert pci_procedure.pci_proc_stents_used_num == "some updated pci_proc_stents_used_num"
      assert pci_procedure.pci_proc_closure_device == "some updated pci_proc_closure_device"
      assert pci_procedure.pci_proc_lab_arrive_tm == ~T[15:01:01]
      assert pci_procedure.pci_proc_50pct_graft_yn == false
      assert pci_procedure.pci_proc_status_stemi == "some updated pci_proc_status_stemi"
      assert pci_procedure.pci_proc_fluoro_tm == "some updated pci_proc_fluoro_tm"
      assert pci_procedure.pci_proc_lv_ef_pre_na == false
      assert pci_procedure.pci_proc_stemi_onset_dt == ~D[2011-05-18]
      assert pci_procedure.pci_proc_dev_first_activ_tm == ~T[15:01:01]
      assert pci_procedure.pci_proc_stemi_onset_tm == ~T[15:01:01]
      assert pci_procedure.pci_proc_device_first_activ_dt == ~D[2011-05-18]
      assert pci_procedure.pci_proc_status_acs == "some updated pci_proc_status_acs"
      assert pci_procedure.pci_proc_operator_lname == "some updated pci_proc_operator_lname"
      assert pci_procedure.pci_proc_machine_id == "some updated pci_proc_machine_id"
      assert pci_procedure.pci_proc_50pct_lcx_yn == false
      assert pci_procedure.pci_proc_les_attempt_num == "some updated pci_proc_les_attempt_num"
      assert pci_procedure.pci_proc_entry == "some updated pci_proc_entry"
      assert pci_procedure.pci_proc_ballons_used_num == "some updated pci_proc_ballons_used_num"
      assert pci_procedure.pci_proc_primary_transfer_yn == false
      assert pci_procedure.pci_proc_indication == "some updated pci_proc_indication"
      assert pci_procedure.pci_proc_les_treated_num == "some updated pci_proc_les_treated_num"
      assert pci_procedure.pci_proc_success_yn == false
      assert pci_procedure.pci_proc_lab_arrive_dt == ~D[2011-05-18]
      assert pci_procedure.pci_proc_operator_fname == "some updated pci_proc_operator_fname"
      assert pci_procedure.pci_proc_lab_num == "some updated pci_proc_lab_num"
      assert pci_procedure.pci_proc_50pct_lad_yn == false
      assert pci_procedure.pci_proc_surg_consult == "some updated pci_proc_surg_consult"
      assert pci_procedure.pci_proc_multivessel_result == "some updated pci_proc_multivessel_result"
    end

    test "update_pci_procedure/2 with invalid data returns error changeset" do
      pci_procedure = pci_procedure_fixture()
      assert {:error, %Ecto.Changeset{}} = Interventions.update_pci_procedure(pci_procedure, @invalid_attrs)
      assert pci_procedure == Interventions.get_pci_procedure!(pci_procedure.id)
    end

    test "delete_pci_procedure/1 deletes the pci_procedure" do
      pci_procedure = pci_procedure_fixture()
      assert {:ok, %Pci_procedure{}} = Interventions.delete_pci_procedure(pci_procedure)
      assert_raise Ecto.NoResultsError, fn -> Interventions.get_pci_procedure!(pci_procedure.id) end
    end

    test "change_pci_procedure/1 returns a pci_procedure changeset" do
      pci_procedure = pci_procedure_fixture()
      assert %Ecto.Changeset{} = Interventions.change_pci_procedure(pci_procedure)
    end
  end

  describe "pci_lesions" do
    alias Angio.Interventions.Pci_lesion

    @valid_attrs %{pci_les_prior_stent_for_isr_yn: true, pci_les_timi_flow_post: "some pci_les_timi_flow_post", pci_les_stent_1_len: "some pci_les_stent_1_len", pci_les_graft_segments_sts: "some pci_les_graft_segments_sts", pci_les_balloon_pres_post: "some pci_les_balloon_pres_post", pci_les_in_native_yn: true, pci_les_gw_cossed_yn: true, pci_les_stent_3_code: "some pci_les_stent_3_code", pci_lesev_dissection_type: "some pci_lesev_dissection_type", pci_les_notes: "some pci_les_notes", pci_les_in_graft_yn: true, pci_les_embolic_protect_type: "some pci_les_embolic_protect_type", pci_les_status_stent_thrombus: "some pci_les_status_stent_thrombus", pci_les_status_isr_stent_type: "some pci_les_status_isr_stent_type", pci_les_graft_segment_pos: "some pci_les_graft_segment_pos", pci_les_rest_no_prior_stent_yn: true, pci_lesev_acute_clossure_yn: true, pci_les_status: "some pci_les_status", pci_les_devices_used: "some pci_les_devices_used", pci_les_status_isr_duration: "some pci_les_status_isr_duration", pci_les_stent_type: "some pci_les_stent_type", pci_les_balloon_type_pre: "some pci_les_balloon_type_pre", pci_les_status_isr_yn: true, pci_les_branch_occlusion_yn: true, pci_les_stent_3_diam: "some pci_les_stent_3_diam", pci_les_stent_1_code: "some pci_les_stent_1_code", pci_les_de_novo_yn: true, pci_les_counter: "some pci_les_counter", pci_les_graft_segments_cdisc: "some pci_les_graft_segments_cdisc", pci_lesev_perforation_class: "some pci_lesev_perforation_class", pci_les_device_counter: "some pci_les_device_counter", pci_les_calcium_yn: true, pci_les_prior_treat_timeframe: "some pci_les_prior_treat_timeframe", pci_lesev_perforation_treat: "some pci_lesev_perforation_treat", pci_les_graft_segments_ncdr: "some pci_les_graft_segments_ncdr", pci_les_balloon_type_post: "some pci_les_balloon_type_post", pci_les_stent_3_len: "some pci_les_stent_3_len", pci_les_stent_4_len: "some pci_les_stent_4_len", pci_les_guide_types: "some pci_les_guide_types", pci_les_length: "some pci_les_length", pci_les_prior_stent_type: "some pci_les_prior_stent_type", pci_les_no_reflow_yn: true, pci_les_complexity: "some pci_les_complexity", pci_les_sten_pct_post: "some pci_les_sten_pct_post", pci_les_stented_yn: true, pci_les_graft_conduit_type: "some pci_les_graft_conduit_type", pci_les_aha_type: "some pci_les_aha_type", pci_les_event_yn: true, pci_les_stent_2_len: "some pci_les_stent_2_len", pci_les_culprit_yn: true, ...}
    @update_attrs %{pci_les_prior_stent_for_isr_yn: false, pci_les_timi_flow_post: "some updated pci_les_timi_flow_post", pci_les_stent_1_len: "some updated pci_les_stent_1_len", pci_les_graft_segments_sts: "some updated pci_les_graft_segments_sts", pci_les_balloon_pres_post: "some updated pci_les_balloon_pres_post", pci_les_in_native_yn: false, pci_les_gw_cossed_yn: false, pci_les_stent_3_code: "some updated pci_les_stent_3_code", pci_lesev_dissection_type: "some updated pci_lesev_dissection_type", pci_les_notes: "some updated pci_les_notes", pci_les_in_graft_yn: false, pci_les_embolic_protect_type: "some updated pci_les_embolic_protect_type", pci_les_status_stent_thrombus: "some updated pci_les_status_stent_thrombus", pci_les_status_isr_stent_type: "some updated pci_les_status_isr_stent_type", pci_les_graft_segment_pos: "some updated pci_les_graft_segment_pos", pci_les_rest_no_prior_stent_yn: false, pci_lesev_acute_clossure_yn: false, pci_les_status: "some updated pci_les_status", pci_les_devices_used: "some updated pci_les_devices_used", pci_les_status_isr_duration: "some updated pci_les_status_isr_duration", pci_les_stent_type: "some updated pci_les_stent_type", pci_les_balloon_type_pre: "some updated pci_les_balloon_type_pre", pci_les_status_isr_yn: false, pci_les_branch_occlusion_yn: false, pci_les_stent_3_diam: "some updated pci_les_stent_3_diam", pci_les_stent_1_code: "some updated pci_les_stent_1_code", pci_les_de_novo_yn: false, pci_les_counter: "some updated pci_les_counter", pci_les_graft_segments_cdisc: "some updated pci_les_graft_segments_cdisc", pci_lesev_perforation_class: "some updated pci_lesev_perforation_class", pci_les_device_counter: "some updated pci_les_device_counter", pci_les_calcium_yn: false, pci_les_prior_treat_timeframe: "some updated pci_les_prior_treat_timeframe", pci_lesev_perforation_treat: "some updated pci_lesev_perforation_treat", pci_les_graft_segments_ncdr: "some updated pci_les_graft_segments_ncdr", pci_les_balloon_type_post: "some updated pci_les_balloon_type_post", pci_les_stent_3_len: "some updated pci_les_stent_3_len", pci_les_stent_4_len: "some updated pci_les_stent_4_len", pci_les_guide_types: "some updated pci_les_guide_types", pci_les_length: "some updated pci_les_length", pci_les_prior_stent_type: "some updated pci_les_prior_stent_type", pci_les_no_reflow_yn: false, pci_les_complexity: "some updated pci_les_complexity", pci_les_sten_pct_post: "some updated pci_les_sten_pct_post", pci_les_stented_yn: false, pci_les_graft_conduit_type: "some updated pci_les_graft_conduit_type", pci_les_aha_type: "some updated pci_les_aha_type", pci_les_event_yn: false, pci_les_stent_2_len: "some updated pci_les_stent_2_len", pci_les_culprit_yn: false, ...}
    @invalid_attrs %{pci_les_prior_stent_for_isr_yn: nil, pci_les_timi_flow_post: nil, pci_les_stent_1_len: nil, pci_les_graft_segments_sts: nil, pci_les_balloon_pres_post: nil, pci_les_in_native_yn: nil, pci_les_gw_cossed_yn: nil, pci_les_stent_3_code: nil, pci_lesev_dissection_type: nil, pci_les_notes: nil, pci_les_in_graft_yn: nil, pci_les_embolic_protect_type: nil, pci_les_status_stent_thrombus: nil, pci_les_status_isr_stent_type: nil, pci_les_graft_segment_pos: nil, pci_les_rest_no_prior_stent_yn: nil, pci_lesev_acute_clossure_yn: nil, pci_les_status: nil, pci_les_devices_used: nil, pci_les_status_isr_duration: nil, pci_les_stent_type: nil, pci_les_balloon_type_pre: nil, pci_les_status_isr_yn: nil, pci_les_branch_occlusion_yn: nil, pci_les_stent_3_diam: nil, pci_les_stent_1_code: nil, pci_les_de_novo_yn: nil, pci_les_counter: nil, pci_les_graft_segments_cdisc: nil, pci_lesev_perforation_class: nil, pci_les_device_counter: nil, pci_les_calcium_yn: nil, pci_les_prior_treat_timeframe: nil, pci_lesev_perforation_treat: nil, pci_les_graft_segments_ncdr: nil, pci_les_balloon_type_post: nil, pci_les_stent_3_len: nil, pci_les_stent_4_len: nil, pci_les_guide_types: nil, pci_les_length: nil, pci_les_prior_stent_type: nil, pci_les_no_reflow_yn: nil, pci_les_complexity: nil, pci_les_sten_pct_post: nil, pci_les_stented_yn: nil, pci_les_graft_conduit_type: nil, pci_les_aha_type: nil, pci_les_event_yn: nil, pci_les_stent_2_len: nil, pci_les_culprit_yn: nil, ...}

    def pci_lesion_fixture(attrs \\ %{}) do
      {:ok, pci_lesion} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Interventions.create_pci_lesion()

      pci_lesion
    end

    test "list_pci_lesions/0 returns all pci_lesions" do
      pci_lesion = pci_lesion_fixture()
      assert Interventions.list_pci_lesions() == [pci_lesion]
    end

    test "get_pci_lesion!/1 returns the pci_lesion with given id" do
      pci_lesion = pci_lesion_fixture()
      assert Interventions.get_pci_lesion!(pci_lesion.id) == pci_lesion
    end

    test "create_pci_lesion/1 with valid data creates a pci_lesion" do
      assert {:ok, %Pci_lesion{} = pci_lesion} = Interventions.create_pci_lesion(@valid_attrs)
      assert pci_lesion.pci_les_bifurcation_yn == true
      assert pci_lesion.pci_les_stent_2_code == "some pci_les_stent_2_code"
      assert pci_lesion.pci_les_stent_2_diam == "some pci_les_stent_2_diam"
      assert pci_lesion.pci_les_involved_seg_sts == []
      assert pci_lesion.pci_les_involved_seg_cdisc == []
      assert pci_lesion.pci_les_guide_size == "some pci_les_guide_size"
      assert pci_lesion.pci_les_success_yn == true
      assert pci_lesion.pci_lesev_re_interven_yn == true
      assert pci_lesion.pci_les_prior_treat_stent_yn == true
      assert pci_lesion.pci_lesev_hosp_stent_thrombosis_category == "some pci_lesev_hosp_stent_thrombosis_category"
      assert pci_lesion.pci_les_no_reflow_type == "some pci_les_no_reflow_type"
      assert pci_lesion.pci_les_after_graft_type == "some pci_les_after_graft_type"
      assert pci_lesion.pci_les_balloon_size_pre == "some pci_les_balloon_size_pre"
      assert pci_lesion.pci_les_graft_prox_site == "some pci_les_graft_prox_site"
      assert pci_lesion.pci_les_prior_stent_thromb_yn == true
      assert pci_lesion.pci_les_stent_length_total == "some pci_les_stent_length_total"
      assert pci_lesion.pci_les_balloon_size_post == "some pci_les_balloon_size_post"
      assert pci_lesion.pci_les_stent_1_diam == "some pci_les_stent_1_diam"
      assert pci_lesion.pci_les_prior_treated_yn == true
      assert pci_lesion.pci_les_bifurc_sb_treat_yn == true
      assert pci_lesion.pci_les_direct_stenting_yn == true
      assert pci_lesion.pci_les_timi_flow_pre == "some pci_les_timi_flow_pre"
      assert pci_lesion.pci_les_no_reflow_treat == "some pci_les_no_reflow_treat"
      assert pci_lesion.pci_les_main_technique == "some pci_les_main_technique"
      assert pci_lesion.pci_les_cto_yn == true
      assert pci_lesion.pci_les_stent_4_diam == "some pci_les_stent_4_diam"
      assert pci_lesion.pci_les_sten_pct_pre == "some pci_les_sten_pct_pre"
      assert pci_lesion.pci_les_stent_4_code == "some pci_les_stent_4_code"
      assert pci_lesion.pci_lesev_dissection_yn == true
      assert pci_lesion.pci_les_status_isr_class == "some pci_les_status_isr_class"
      assert pci_lesion.pci_lesev_acute_clossure_treat == "some pci_lesev_acute_clossure_treat"
      assert pci_lesion.pci_les_des_type == "some pci_les_des_type"
      assert pci_lesion.pci_lesev_perforation_yn == true
      assert pci_lesion.pci_les_involved_seg_ncdr == []
      assert pci_lesion.pci_les_culprit_yn == true
      assert pci_lesion.pci_les_stent_2_len == "some pci_les_stent_2_len"
      assert pci_lesion.pci_les_event_yn == true
      assert pci_lesion.pci_les_aha_type == "some pci_les_aha_type"
      assert pci_lesion.pci_les_graft_conduit_type == "some pci_les_graft_conduit_type"
      assert pci_lesion.pci_les_stented_yn == true
      assert pci_lesion.pci_les_sten_pct_post == "some pci_les_sten_pct_post"
      assert pci_lesion.pci_les_complexity == "some pci_les_complexity"
      assert pci_lesion.pci_les_no_reflow_yn == true
      assert pci_lesion.pci_les_prior_stent_type == "some pci_les_prior_stent_type"
      assert pci_lesion.pci_les_length == "some pci_les_length"
      assert pci_lesion.pci_les_guide_types == "some pci_les_guide_types"
      assert pci_lesion.pci_les_stent_4_len == "some pci_les_stent_4_len"
      assert pci_lesion.pci_les_stent_3_len == "some pci_les_stent_3_len"
      assert pci_lesion.pci_les_balloon_type_post == "some pci_les_balloon_type_post"
      assert pci_lesion.pci_les_graft_segments_ncdr == "some pci_les_graft_segments_ncdr"
      assert pci_lesion.pci_lesev_perforation_treat == "some pci_lesev_perforation_treat"
      assert pci_lesion.pci_les_prior_treat_timeframe == "some pci_les_prior_treat_timeframe"
      assert pci_lesion.pci_les_calcium_yn == true
      assert pci_lesion.pci_les_device_counter == "some pci_les_device_counter"
      assert pci_lesion.pci_lesev_perforation_class == "some pci_lesev_perforation_class"
      assert pci_lesion.pci_les_graft_segments_cdisc == "some pci_les_graft_segments_cdisc"
      assert pci_lesion.pci_les_counter == "some pci_les_counter"
      assert pci_lesion.pci_les_de_novo_yn == true
      assert pci_lesion.pci_les_stent_1_code == "some pci_les_stent_1_code"
      assert pci_lesion.pci_les_stent_3_diam == "some pci_les_stent_3_diam"
      assert pci_lesion.pci_les_branch_occlusion_yn == true
      assert pci_lesion.pci_les_status_isr_yn == true
      assert pci_lesion.pci_les_balloon_type_pre == "some pci_les_balloon_type_pre"
      assert pci_lesion.pci_les_stent_type == "some pci_les_stent_type"
      assert pci_lesion.pci_les_status_isr_duration == "some pci_les_status_isr_duration"
      assert pci_lesion.pci_les_devices_used == "some pci_les_devices_used"
      assert pci_lesion.pci_les_status == "some pci_les_status"
      assert pci_lesion.pci_lesev_acute_clossure_yn == true
      assert pci_lesion.pci_les_rest_no_prior_stent_yn == true
      assert pci_lesion.pci_les_graft_segment_pos == "some pci_les_graft_segment_pos"
      assert pci_lesion.pci_les_status_isr_stent_type == "some pci_les_status_isr_stent_type"
      assert pci_lesion.pci_les_status_stent_thrombus == "some pci_les_status_stent_thrombus"
      assert pci_lesion.pci_les_embolic_protect_type == "some pci_les_embolic_protect_type"
      assert pci_lesion.pci_les_in_graft_yn == true
      assert pci_lesion.pci_les_notes == "some pci_les_notes"
      assert pci_lesion.pci_lesev_dissection_type == "some pci_lesev_dissection_type"
      assert pci_lesion.pci_les_stent_3_code == "some pci_les_stent_3_code"
      assert pci_lesion.pci_les_gw_cossed_yn == true
      assert pci_lesion.pci_les_in_native_yn == true
      assert pci_lesion.pci_les_balloon_pres_post == "some pci_les_balloon_pres_post"
      assert pci_lesion.pci_les_graft_segments_sts == "some pci_les_graft_segments_sts"
      assert pci_lesion.pci_les_stent_1_len == "some pci_les_stent_1_len"
      assert pci_lesion.pci_les_timi_flow_post == "some pci_les_timi_flow_post"
      assert pci_lesion.pci_les_prior_stent_for_isr_yn == true
    end

    test "create_pci_lesion/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Interventions.create_pci_lesion(@invalid_attrs)
    end

    test "update_pci_lesion/2 with valid data updates the pci_lesion" do
      pci_lesion = pci_lesion_fixture()
      assert {:ok, %Pci_lesion{} = pci_lesion} = Interventions.update_pci_lesion(pci_lesion, @update_attrs)
      assert pci_lesion.pci_les_bifurcation_yn == false
      assert pci_lesion.pci_les_stent_2_code == "some updated pci_les_stent_2_code"
      assert pci_lesion.pci_les_stent_2_diam == "some updated pci_les_stent_2_diam"
      assert pci_lesion.pci_les_involved_seg_sts == []
      assert pci_lesion.pci_les_involved_seg_cdisc == []
      assert pci_lesion.pci_les_guide_size == "some updated pci_les_guide_size"
      assert pci_lesion.pci_les_success_yn == false
      assert pci_lesion.pci_lesev_re_interven_yn == false
      assert pci_lesion.pci_les_prior_treat_stent_yn == false
      assert pci_lesion.pci_lesev_hosp_stent_thrombosis_category == "some updated pci_lesev_hosp_stent_thrombosis_category"
      assert pci_lesion.pci_les_no_reflow_type == "some updated pci_les_no_reflow_type"
      assert pci_lesion.pci_les_after_graft_type == "some updated pci_les_after_graft_type"
      assert pci_lesion.pci_les_balloon_size_pre == "some updated pci_les_balloon_size_pre"
      assert pci_lesion.pci_les_graft_prox_site == "some updated pci_les_graft_prox_site"
      assert pci_lesion.pci_les_prior_stent_thromb_yn == false
      assert pci_lesion.pci_les_stent_length_total == "some updated pci_les_stent_length_total"
      assert pci_lesion.pci_les_balloon_size_post == "some updated pci_les_balloon_size_post"
      assert pci_lesion.pci_les_stent_1_diam == "some updated pci_les_stent_1_diam"
      assert pci_lesion.pci_les_prior_treated_yn == false
      assert pci_lesion.pci_les_bifurc_sb_treat_yn == false
      assert pci_lesion.pci_les_direct_stenting_yn == false
      assert pci_lesion.pci_les_timi_flow_pre == "some updated pci_les_timi_flow_pre"
      assert pci_lesion.pci_les_no_reflow_treat == "some updated pci_les_no_reflow_treat"
      assert pci_lesion.pci_les_main_technique == "some updated pci_les_main_technique"
      assert pci_lesion.pci_les_cto_yn == false
      assert pci_lesion.pci_les_stent_4_diam == "some updated pci_les_stent_4_diam"
      assert pci_lesion.pci_les_sten_pct_pre == "some updated pci_les_sten_pct_pre"
      assert pci_lesion.pci_les_stent_4_code == "some updated pci_les_stent_4_code"
      assert pci_lesion.pci_lesev_dissection_yn == false
      assert pci_lesion.pci_les_status_isr_class == "some updated pci_les_status_isr_class"
      assert pci_lesion.pci_lesev_acute_clossure_treat == "some updated pci_lesev_acute_clossure_treat"
      assert pci_lesion.pci_les_des_type == "some updated pci_les_des_type"
      assert pci_lesion.pci_lesev_perforation_yn == false
      assert pci_lesion.pci_les_involved_seg_ncdr == []
      assert pci_lesion.pci_les_culprit_yn == false
      assert pci_lesion.pci_les_stent_2_len == "some updated pci_les_stent_2_len"
      assert pci_lesion.pci_les_event_yn == false
      assert pci_lesion.pci_les_aha_type == "some updated pci_les_aha_type"
      assert pci_lesion.pci_les_graft_conduit_type == "some updated pci_les_graft_conduit_type"
      assert pci_lesion.pci_les_stented_yn == false
      assert pci_lesion.pci_les_sten_pct_post == "some updated pci_les_sten_pct_post"
      assert pci_lesion.pci_les_complexity == "some updated pci_les_complexity"
      assert pci_lesion.pci_les_no_reflow_yn == false
      assert pci_lesion.pci_les_prior_stent_type == "some updated pci_les_prior_stent_type"
      assert pci_lesion.pci_les_length == "some updated pci_les_length"
      assert pci_lesion.pci_les_guide_types == "some updated pci_les_guide_types"
      assert pci_lesion.pci_les_stent_4_len == "some updated pci_les_stent_4_len"
      assert pci_lesion.pci_les_stent_3_len == "some updated pci_les_stent_3_len"
      assert pci_lesion.pci_les_balloon_type_post == "some updated pci_les_balloon_type_post"
      assert pci_lesion.pci_les_graft_segments_ncdr == "some updated pci_les_graft_segments_ncdr"
      assert pci_lesion.pci_lesev_perforation_treat == "some updated pci_lesev_perforation_treat"
      assert pci_lesion.pci_les_prior_treat_timeframe == "some updated pci_les_prior_treat_timeframe"
      assert pci_lesion.pci_les_calcium_yn == false
      assert pci_lesion.pci_les_device_counter == "some updated pci_les_device_counter"
      assert pci_lesion.pci_lesev_perforation_class == "some updated pci_lesev_perforation_class"
      assert pci_lesion.pci_les_graft_segments_cdisc == "some updated pci_les_graft_segments_cdisc"
      assert pci_lesion.pci_les_counter == "some updated pci_les_counter"
      assert pci_lesion.pci_les_de_novo_yn == false
      assert pci_lesion.pci_les_stent_1_code == "some updated pci_les_stent_1_code"
      assert pci_lesion.pci_les_stent_3_diam == "some updated pci_les_stent_3_diam"
      assert pci_lesion.pci_les_branch_occlusion_yn == false
      assert pci_lesion.pci_les_status_isr_yn == false
      assert pci_lesion.pci_les_balloon_type_pre == "some updated pci_les_balloon_type_pre"
      assert pci_lesion.pci_les_stent_type == "some updated pci_les_stent_type"
      assert pci_lesion.pci_les_status_isr_duration == "some updated pci_les_status_isr_duration"
      assert pci_lesion.pci_les_devices_used == "some updated pci_les_devices_used"
      assert pci_lesion.pci_les_status == "some updated pci_les_status"
      assert pci_lesion.pci_lesev_acute_clossure_yn == false
      assert pci_lesion.pci_les_rest_no_prior_stent_yn == false
      assert pci_lesion.pci_les_graft_segment_pos == "some updated pci_les_graft_segment_pos"
      assert pci_lesion.pci_les_status_isr_stent_type == "some updated pci_les_status_isr_stent_type"
      assert pci_lesion.pci_les_status_stent_thrombus == "some updated pci_les_status_stent_thrombus"
      assert pci_lesion.pci_les_embolic_protect_type == "some updated pci_les_embolic_protect_type"
      assert pci_lesion.pci_les_in_graft_yn == false
      assert pci_lesion.pci_les_notes == "some updated pci_les_notes"
      assert pci_lesion.pci_lesev_dissection_type == "some updated pci_lesev_dissection_type"
      assert pci_lesion.pci_les_stent_3_code == "some updated pci_les_stent_3_code"
      assert pci_lesion.pci_les_gw_cossed_yn == false
      assert pci_lesion.pci_les_in_native_yn == false
      assert pci_lesion.pci_les_balloon_pres_post == "some updated pci_les_balloon_pres_post"
      assert pci_lesion.pci_les_graft_segments_sts == "some updated pci_les_graft_segments_sts"
      assert pci_lesion.pci_les_stent_1_len == "some updated pci_les_stent_1_len"
      assert pci_lesion.pci_les_timi_flow_post == "some updated pci_les_timi_flow_post"
      assert pci_lesion.pci_les_prior_stent_for_isr_yn == false
    end

    test "update_pci_lesion/2 with invalid data returns error changeset" do
      pci_lesion = pci_lesion_fixture()
      assert {:error, %Ecto.Changeset{}} = Interventions.update_pci_lesion(pci_lesion, @invalid_attrs)
      assert pci_lesion == Interventions.get_pci_lesion!(pci_lesion.id)
    end

    test "delete_pci_lesion/1 deletes the pci_lesion" do
      pci_lesion = pci_lesion_fixture()
      assert {:ok, %Pci_lesion{}} = Interventions.delete_pci_lesion(pci_lesion)
      assert_raise Ecto.NoResultsError, fn -> Interventions.get_pci_lesion!(pci_lesion.id) end
    end

    test "change_pci_lesion/1 returns a pci_lesion changeset" do
      pci_lesion = pci_lesion_fixture()
      assert %Ecto.Changeset{} = Interventions.change_pci_lesion(pci_lesion)
    end
  end
end

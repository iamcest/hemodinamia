defmodule Angio.GraphicsTest do
  use Angio.DataCase

  alias Angio.Graphics

  describe "tree_native" do
    alias Angio.Graphics.Tree_natives

    @valid_attrs %{",": "some ,", course_benign: "some course_benign", course_malignant: "some course_malignant", default_draw: "some default_draw", path: "some path", size: "some size", vessel: "some vessel", vessel_id: "some vessel_id", visible: "some visible"}
    @update_attrs %{",": "some updated ,", course_benign: "some updated course_benign", course_malignant: "some updated course_malignant", default_draw: "some updated default_draw", path: "some updated path", size: "some updated size", vessel: "some updated vessel", vessel_id: "some updated vessel_id", visible: "some updated visible"}
    @invalid_attrs %{",": nil, course_benign: nil, course_malignant: nil, default_draw: nil, path: nil, size: nil, vessel: nil, vessel_id: nil, visible: nil}

    def tree_natives_fixture(attrs \\ %{}) do
      {:ok, tree_natives} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Graphics.create_tree_natives()

      tree_natives
    end

    test "list_tree_native/0 returns all tree_native" do
      tree_natives = tree_natives_fixture()
      assert Graphics.list_tree_native() == [tree_natives]
    end

    test "get_tree_natives!/1 returns the tree_natives with given id" do
      tree_natives = tree_natives_fixture()
      assert Graphics.get_tree_natives!(tree_natives.id) == tree_natives
    end

    test "create_tree_natives/1 with valid data creates a tree_natives" do
      assert {:ok, %Tree_natives{} = tree_natives} = Graphics.create_tree_natives(@valid_attrs)
      assert tree_natives., == "some ,"
      assert tree_natives.course_benign == "some course_benign"
      assert tree_natives.course_malignant == "some course_malignant"
      assert tree_natives.default_draw == "some default_draw"
      assert tree_natives.path == "some path"
      assert tree_natives.size == "some size"
      assert tree_natives.vessel == "some vessel"
      assert tree_natives.vessel_id == "some vessel_id"
      assert tree_natives.visible == "some visible"
    end

    test "create_tree_natives/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Graphics.create_tree_natives(@invalid_attrs)
    end

    test "update_tree_natives/2 with valid data updates the tree_natives" do
      tree_natives = tree_natives_fixture()
      assert {:ok, %Tree_natives{} = tree_natives} = Graphics.update_tree_natives(tree_natives, @update_attrs)
      assert tree_natives., == "some updated ,"
      assert tree_natives.course_benign == "some updated course_benign"
      assert tree_natives.course_malignant == "some updated course_malignant"
      assert tree_natives.default_draw == "some updated default_draw"
      assert tree_natives.path == "some updated path"
      assert tree_natives.size == "some updated size"
      assert tree_natives.vessel == "some updated vessel"
      assert tree_natives.vessel_id == "some updated vessel_id"
      assert tree_natives.visible == "some updated visible"
    end

    test "update_tree_natives/2 with invalid data returns error changeset" do
      tree_natives = tree_natives_fixture()
      assert {:error, %Ecto.Changeset{}} = Graphics.update_tree_natives(tree_natives, @invalid_attrs)
      assert tree_natives == Graphics.get_tree_natives!(tree_natives.id)
    end

    test "delete_tree_natives/1 deletes the tree_natives" do
      tree_natives = tree_natives_fixture()
      assert {:ok, %Tree_natives{}} = Graphics.delete_tree_natives(tree_natives)
      assert_raise Ecto.NoResultsError, fn -> Graphics.get_tree_natives!(tree_natives.id) end
    end

    test "change_tree_natives/1 returns a tree_natives changeset" do
      tree_natives = tree_natives_fixture()
      assert %Ecto.Changeset{} = Graphics.change_tree_natives(tree_natives)
    end
  end

  describe "tree_native" do
    alias Angio.Graphics.Tree_natives

    @valid_attrs %{rca_dom_draw: "some rca_dom_draw", stent_path: "some stent_path", vessel_group_aha: "some vessel_group_aha", is_variant: "some is_variant", vessel: "some vessel", size: "some size", is_anomaly: "some is_anomaly", device_id: "some device_id", prior_treated_date: "some prior_treated_date", lesion_id: "some lesion_id", lcx_dom_draw: "some lcx_dom_draw", graft_present: "some graft_present", stent_x: "some stent_x", cor_les_prior_treated_yn: "some cor_les_prior_treated_yn", lad_type_draw: "some lad_type_draw", course_malignant: "some course_malignant", vessel_id: "some vessel_id", cor_les_thrombus_yn: "some cor_les_thrombus_yn", cor_les_prior_stent_yn: "some cor_les_prior_stent_yn", cor_les_calcium_yn: "some cor_les_calcium_yn", cor_les_pct: "some cor_les_pct", balanced_dom_draw: "some balanced_dom_draw", graft_path: "some graft_path", lesion_x: "some lesion_x", vessel_group: "some vessel_group", cor_les_stent_pct: "some cor_les_stent_pct", description_name: "some description_name", add: "some add", stent_y: "some stent_y", graft_id: "some graft_id", cor_les_stent_ptc: "some cor_les_stent_ptc", irregularities_has: "some irregularities_has", course_benign: "some course_benign", lesion_path: "some lesion_path", lesion_y: "some lesion_y", lesion_present: "some lesion_present", cor_les_segments_cdisc: "some cor_les_segments_cdisc", graft_y: "some graft_y", graft_x: "some graft_x", collateral_points: "some collateral_points", device_present: "some device_present", default_draw: "some default_draw", path: "some path", visible: "some visible", aor_les_thrombus_yn: "some aor_les_thrombus_yn", seg_def: "some seg_def"}
    @update_attrs %{rca_dom_draw: "some updated rca_dom_draw", stent_path: "some updated stent_path", vessel_group_aha: "some updated vessel_group_aha", is_variant: "some updated is_variant", vessel: "some updated vessel", size: "some updated size", is_anomaly: "some updated is_anomaly", device_id: "some updated device_id", prior_treated_date: "some updated prior_treated_date", lesion_id: "some updated lesion_id", lcx_dom_draw: "some updated lcx_dom_draw", graft_present: "some updated graft_present", stent_x: "some updated stent_x", cor_les_prior_treated_yn: "some updated cor_les_prior_treated_yn", lad_type_draw: "some updated lad_type_draw", course_malignant: "some updated course_malignant", vessel_id: "some updated vessel_id", cor_les_thrombus_yn: "some updated cor_les_thrombus_yn", cor_les_prior_stent_yn: "some updated cor_les_prior_stent_yn", cor_les_calcium_yn: "some updated cor_les_calcium_yn", cor_les_pct: "some updated cor_les_pct", balanced_dom_draw: "some updated balanced_dom_draw", graft_path: "some updated graft_path", lesion_x: "some updated lesion_x", vessel_group: "some updated vessel_group", cor_les_stent_pct: "some updated cor_les_stent_pct", description_name: "some updated description_name", add: "some updated add", stent_y: "some updated stent_y", graft_id: "some updated graft_id", cor_les_stent_ptc: "some updated cor_les_stent_ptc", irregularities_has: "some updated irregularities_has", course_benign: "some updated course_benign", lesion_path: "some updated lesion_path", lesion_y: "some updated lesion_y", lesion_present: "some updated lesion_present", cor_les_segments_cdisc: "some updated cor_les_segments_cdisc", graft_y: "some updated graft_y", graft_x: "some updated graft_x", collateral_points: "some updated collateral_points", device_present: "some updated device_present", default_draw: "some updated default_draw", path: "some updated path", visible: "some updated visible", aor_les_thrombus_yn: "some updated aor_les_thrombus_yn", seg_def: "some updated seg_def"}
    @invalid_attrs %{rca_dom_draw: nil, stent_path: nil, vessel_group_aha: nil, is_variant: nil, vessel: nil, size: nil, is_anomaly: nil, device_id: nil, prior_treated_date: nil, lesion_id: nil, lcx_dom_draw: nil, graft_present: nil, stent_x: nil, cor_les_prior_treated_yn: nil, lad_type_draw: nil, course_malignant: nil, vessel_id: nil, cor_les_thrombus_yn: nil, cor_les_prior_stent_yn: nil, cor_les_calcium_yn: nil, cor_les_pct: nil, balanced_dom_draw: nil, graft_path: nil, lesion_x: nil, vessel_group: nil, cor_les_stent_pct: nil, description_name: nil, add: nil, stent_y: nil, graft_id: nil, cor_les_stent_ptc: nil, irregularities_has: nil, course_benign: nil, lesion_path: nil, lesion_y: nil, lesion_present: nil, cor_les_segments_cdisc: nil, graft_y: nil, graft_x: nil, collateral_points: nil, device_present: nil, default_draw: nil, path: nil, visible: nil, aor_les_thrombus_yn: nil, seg_def: nil}

    def tree_natives_fixture(attrs \\ %{}) do
      {:ok, tree_natives} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Graphics.create_tree_natives()

      tree_natives
    end

    test "list_tree_native/0 returns all tree_native" do
      tree_natives = tree_natives_fixture()
      assert Graphics.list_tree_native() == [tree_natives]
    end

    test "get_tree_natives!/1 returns the tree_natives with given id" do
      tree_natives = tree_natives_fixture()
      assert Graphics.get_tree_natives!(tree_natives.id) == tree_natives
    end

    test "create_tree_natives/1 with valid data creates a tree_natives" do
      assert {:ok, %Tree_natives{} = tree_natives} = Graphics.create_tree_natives(@valid_attrs)
      assert tree_natives.seg_def == "some seg_def"
      assert tree_natives.aor_les_thrombus_yn == "some aor_les_thrombus_yn"
      assert tree_natives.visible == "some visible"
      assert tree_natives.path == "some path"
      assert tree_natives.default_draw == "some default_draw"
      assert tree_natives.device_present == "some device_present"
      assert tree_natives.collateral_points == "some collateral_points"
      assert tree_natives.graft_x == "some graft_x"
      assert tree_natives.graft_y == "some graft_y"
      assert tree_natives.cor_les_segments_cdisc == "some cor_les_segments_cdisc"
      assert tree_natives.lesion_present == "some lesion_present"
      assert tree_natives.lesion_y == "some lesion_y"
      assert tree_natives.lesion_path == "some lesion_path"
      assert tree_natives.course_benign == "some course_benign"
      assert tree_natives.irregularities_has == "some irregularities_has"
      assert tree_natives.cor_les_stent_ptc == "some cor_les_stent_ptc"
      assert tree_natives.graft_id == "some graft_id"
      assert tree_natives.stent_y == "some stent_y"
      assert tree_natives.add == "some add"
      assert tree_natives.description_name == "some description_name"
      assert tree_natives.cor_les_stent_pct == "some cor_les_stent_pct"
      assert tree_natives.vessel_group == "some vessel_group"
      assert tree_natives.lesion_x == "some lesion_x"
      assert tree_natives.graft_path == "some graft_path"
      assert tree_natives.balanced_dom_draw == "some balanced_dom_draw"
      assert tree_natives.cor_les_pct == "some cor_les_pct"
      assert tree_natives.cor_les_calcium_yn == "some cor_les_calcium_yn"
      assert tree_natives.cor_les_prior_stent_yn == "some cor_les_prior_stent_yn"
      assert tree_natives.cor_les_thrombus_yn == "some cor_les_thrombus_yn"
      assert tree_natives.vessel_id == "some vessel_id"
      assert tree_natives.course_malignant == "some course_malignant"
      assert tree_natives.lad_type_draw == "some lad_type_draw"
      assert tree_natives.cor_les_prior_treated_yn == "some cor_les_prior_treated_yn"
      assert tree_natives.stent_x == "some stent_x"
      assert tree_natives.graft_present == "some graft_present"
      assert tree_natives.lcx_dom_draw == "some lcx_dom_draw"
      assert tree_natives.lesion_id == "some lesion_id"
      assert tree_natives.prior_treated_date == "some prior_treated_date"
      assert tree_natives.device_id == "some device_id"
      assert tree_natives.is_anomaly == "some is_anomaly"
      assert tree_natives.size == "some size"
      assert tree_natives.vessel == "some vessel"
      assert tree_natives.is_variant == "some is_variant"
      assert tree_natives.vessel_group_aha == "some vessel_group_aha"
      assert tree_natives.stent_path == "some stent_path"
      assert tree_natives.rca_dom_draw == "some rca_dom_draw"
    end

    test "create_tree_natives/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Graphics.create_tree_natives(@invalid_attrs)
    end

    test "update_tree_natives/2 with valid data updates the tree_natives" do
      tree_natives = tree_natives_fixture()
      assert {:ok, %Tree_natives{} = tree_natives} = Graphics.update_tree_natives(tree_natives, @update_attrs)
      assert tree_natives.seg_def == "some updated seg_def"
      assert tree_natives.aor_les_thrombus_yn == "some updated aor_les_thrombus_yn"
      assert tree_natives.visible == "some updated visible"
      assert tree_natives.path == "some updated path"
      assert tree_natives.default_draw == "some updated default_draw"
      assert tree_natives.device_present == "some updated device_present"
      assert tree_natives.collateral_points == "some updated collateral_points"
      assert tree_natives.graft_x == "some updated graft_x"
      assert tree_natives.graft_y == "some updated graft_y"
      assert tree_natives.cor_les_segments_cdisc == "some updated cor_les_segments_cdisc"
      assert tree_natives.lesion_present == "some updated lesion_present"
      assert tree_natives.lesion_y == "some updated lesion_y"
      assert tree_natives.lesion_path == "some updated lesion_path"
      assert tree_natives.course_benign == "some updated course_benign"
      assert tree_natives.irregularities_has == "some updated irregularities_has"
      assert tree_natives.cor_les_stent_ptc == "some updated cor_les_stent_ptc"
      assert tree_natives.graft_id == "some updated graft_id"
      assert tree_natives.stent_y == "some updated stent_y"
      assert tree_natives.add == "some updated add"
      assert tree_natives.description_name == "some updated description_name"
      assert tree_natives.cor_les_stent_pct == "some updated cor_les_stent_pct"
      assert tree_natives.vessel_group == "some updated vessel_group"
      assert tree_natives.lesion_x == "some updated lesion_x"
      assert tree_natives.graft_path == "some updated graft_path"
      assert tree_natives.balanced_dom_draw == "some updated balanced_dom_draw"
      assert tree_natives.cor_les_pct == "some updated cor_les_pct"
      assert tree_natives.cor_les_calcium_yn == "some updated cor_les_calcium_yn"
      assert tree_natives.cor_les_prior_stent_yn == "some updated cor_les_prior_stent_yn"
      assert tree_natives.cor_les_thrombus_yn == "some updated cor_les_thrombus_yn"
      assert tree_natives.vessel_id == "some updated vessel_id"
      assert tree_natives.course_malignant == "some updated course_malignant"
      assert tree_natives.lad_type_draw == "some updated lad_type_draw"
      assert tree_natives.cor_les_prior_treated_yn == "some updated cor_les_prior_treated_yn"
      assert tree_natives.stent_x == "some updated stent_x"
      assert tree_natives.graft_present == "some updated graft_present"
      assert tree_natives.lcx_dom_draw == "some updated lcx_dom_draw"
      assert tree_natives.lesion_id == "some updated lesion_id"
      assert tree_natives.prior_treated_date == "some updated prior_treated_date"
      assert tree_natives.device_id == "some updated device_id"
      assert tree_natives.is_anomaly == "some updated is_anomaly"
      assert tree_natives.size == "some updated size"
      assert tree_natives.vessel == "some updated vessel"
      assert tree_natives.is_variant == "some updated is_variant"
      assert tree_natives.vessel_group_aha == "some updated vessel_group_aha"
      assert tree_natives.stent_path == "some updated stent_path"
      assert tree_natives.rca_dom_draw == "some updated rca_dom_draw"
    end

    test "update_tree_natives/2 with invalid data returns error changeset" do
      tree_natives = tree_natives_fixture()
      assert {:error, %Ecto.Changeset{}} = Graphics.update_tree_natives(tree_natives, @invalid_attrs)
      assert tree_natives == Graphics.get_tree_natives!(tree_natives.id)
    end

    test "delete_tree_natives/1 deletes the tree_natives" do
      tree_natives = tree_natives_fixture()
      assert {:ok, %Tree_natives{}} = Graphics.delete_tree_natives(tree_natives)
      assert_raise Ecto.NoResultsError, fn -> Graphics.get_tree_natives!(tree_natives.id) end
    end

    test "change_tree_natives/1 returns a tree_natives changeset" do
      tree_natives = tree_natives_fixture()
      assert %Ecto.Changeset{} = Graphics.change_tree_natives(tree_natives)
    end
  end
end

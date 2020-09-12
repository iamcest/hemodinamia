defmodule Angio.Cor_mediaeTest do
  use Angio.DataCase

  alias Angio.Cor_mediae

  describe "cor_mediae" do
    alias Angio.Cor_mediae.Cor_media

    @valid_attrs %{mime_name: "some mime_name", mime_type: "some mime_type"}
    @update_attrs %{mime_name: "some updated mime_name", mime_type: "some updated mime_type"}
    @invalid_attrs %{mime_name: nil, mime_type: nil}

    def cor_media_fixture(attrs \\ %{}) do
      {:ok, cor_media} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cor_mediae.create_cor_media()

      cor_media
    end

    test "list_cor_mediae/0 returns all cor_mediae" do
      cor_media = cor_media_fixture()
      assert Cor_mediae.list_cor_mediae() == [cor_media]
    end

    test "get_cor_media!/1 returns the cor_media with given id" do
      cor_media = cor_media_fixture()
      assert Cor_mediae.get_cor_media!(cor_media.id) == cor_media
    end

    test "create_cor_media/1 with valid data creates a cor_media" do
      assert {:ok, %Cor_media{} = cor_media} = Cor_mediae.create_cor_media(@valid_attrs)
      assert cor_media.mime_name == "some mime_name"
      assert cor_media.mime_type == "some mime_type"
    end

    test "create_cor_media/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cor_mediae.create_cor_media(@invalid_attrs)
    end

    test "update_cor_media/2 with valid data updates the cor_media" do
      cor_media = cor_media_fixture()

      assert {:ok, %Cor_media{} = cor_media} =
               Cor_mediae.update_cor_media(cor_media, @update_attrs)

      assert cor_media.mime_name == "some updated mime_name"
      assert cor_media.mime_type == "some updated mime_type"
    end

    test "update_cor_media/2 with invalid data returns error changeset" do
      cor_media = cor_media_fixture()
      assert {:error, %Ecto.Changeset{}} = Cor_mediae.update_cor_media(cor_media, @invalid_attrs)
      assert cor_media == Cor_mediae.get_cor_media!(cor_media.id)
    end

    test "delete_cor_media/1 deletes the cor_media" do
      cor_media = cor_media_fixture()
      assert {:ok, %Cor_media{}} = Cor_mediae.delete_cor_media(cor_media)
      assert_raise Ecto.NoResultsError, fn -> Cor_mediae.get_cor_media!(cor_media.id) end
    end

    test "change_cor_media/1 returns a cor_media changeset" do
      cor_media = cor_media_fixture()
      assert %Ecto.Changeset{} = Cor_mediae.change_cor_media(cor_media)
    end
  end

  describe "cor_mediae" do
    alias Angio.Cor_mediae.Cor_media

    @valid_attrs %{
      desc: "some desc",
      mime_name: "some mime_name",
      mime_type: "some mime_type",
      notes: "some notes",
      patient_id: 42,
      radlex_1: "some radlex_1",
      radlex_2: "some radlex_2",
      reference: "some reference"
    }
    @update_attrs %{
      desc: "some updated desc",
      mime_name: "some updated mime_name",
      mime_type: "some updated mime_type",
      notes: "some updated notes",
      patient_id: 43,
      radlex_1: "some updated radlex_1",
      radlex_2: "some updated radlex_2",
      reference: "some updated reference"
    }
    @invalid_attrs %{
      desc: nil,
      mime_name: nil,
      mime_type: nil,
      notes: nil,
      patient_id: nil,
      radlex_1: nil,
      radlex_2: nil,
      reference: nil
    }

    def cor_media_fixture(attrs \\ %{}) do
      {:ok, cor_media} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cor_mediae.create_cor_media()

      cor_media
    end

    test "list_cor_mediae/0 returns all cor_mediae" do
      cor_media = cor_media_fixture()
      assert Cor_mediae.list_cor_mediae() == [cor_media]
    end

    test "get_cor_media!/1 returns the cor_media with given id" do
      cor_media = cor_media_fixture()
      assert Cor_mediae.get_cor_media!(cor_media.id) == cor_media
    end

    test "create_cor_media/1 with valid data creates a cor_media" do
      assert {:ok, %Cor_media{} = cor_media} = Cor_mediae.create_cor_media(@valid_attrs)
      assert cor_media.desc == "some desc"
      assert cor_media.mime_name == "some mime_name"
      assert cor_media.mime_type == "some mime_type"
      assert cor_media.notes == "some notes"
      assert cor_media.patient_id == 42
      assert cor_media.radlex_1 == "some radlex_1"
      assert cor_media.radlex_2 == "some radlex_2"
      assert cor_media.reference == "some reference"
    end

    test "create_cor_media/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cor_mediae.create_cor_media(@invalid_attrs)
    end

    test "update_cor_media/2 with valid data updates the cor_media" do
      cor_media = cor_media_fixture()

      assert {:ok, %Cor_media{} = cor_media} =
               Cor_mediae.update_cor_media(cor_media, @update_attrs)

      assert cor_media.desc == "some updated desc"
      assert cor_media.mime_name == "some updated mime_name"
      assert cor_media.mime_type == "some updated mime_type"
      assert cor_media.notes == "some updated notes"
      assert cor_media.patient_id == 43
      assert cor_media.radlex_1 == "some updated radlex_1"
      assert cor_media.radlex_2 == "some updated radlex_2"
      assert cor_media.reference == "some updated reference"
    end

    test "update_cor_media/2 with invalid data returns error changeset" do
      cor_media = cor_media_fixture()
      assert {:error, %Ecto.Changeset{}} = Cor_mediae.update_cor_media(cor_media, @invalid_attrs)
      assert cor_media == Cor_mediae.get_cor_media!(cor_media.id)
    end

    test "delete_cor_media/1 deletes the cor_media" do
      cor_media = cor_media_fixture()
      assert {:ok, %Cor_media{}} = Cor_mediae.delete_cor_media(cor_media)
      assert_raise Ecto.NoResultsError, fn -> Cor_mediae.get_cor_media!(cor_media.id) end
    end

    test "change_cor_media/1 returns a cor_media changeset" do
      cor_media = cor_media_fixture()
      assert %Ecto.Changeset{} = Cor_mediae.change_cor_media(cor_media)
    end
  end
end

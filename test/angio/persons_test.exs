defmodule Angio.PersonsTest do
  use Angio.DataCase

  alias Angio.Persons

  describe "patients" do
    alias Angio.Persons.Patient

    @valid_attrs %{
      "": "some ",
      patient_other_id: "some patient_other_id",
      patnts_birth_dt: ~D[2010-04-17],
      patnts_deceased: true,
      patnts_ethnicity_hispanic: "some patnts_ethnicity_hispanic",
      patnts_father_name: "some patnts_father_name",
      patnts_first_name: "some patnts_first_name",
      patnts_gender: "some patnts_gender",
      patnts_language_preferred: "some patnts_language_preferred",
      patnts_last_name: "some patnts_last_name",
      patnts_middle_name: "some patnts_middle_name",
      patnts_mother_name: "some patnts_mother_name",
      patnts_notes: "some patnts_notes",
      patnts_race: "some patnts_race",
      patnts_record_active: true,
      patnts_ssn: "some patnts_ssn",
      patnts_ssn_na: true,
      patnts_uuid: "some patnts_uuid"
    }
    @update_attrs %{
      "": "some updated ",
      patient_other_id: "some updated patient_other_id",
      patnts_birth_dt: ~D[2011-05-18],
      patnts_deceased: false,
      patnts_ethnicity_hispanic: "some updated patnts_ethnicity_hispanic",
      patnts_father_name: "some updated patnts_father_name",
      patnts_first_name: "some updated patnts_first_name",
      patnts_gender: "some updated patnts_gender",
      patnts_language_preferred: "some updated patnts_language_preferred",
      patnts_last_name: "some updated patnts_last_name",
      patnts_middle_name: "some updated patnts_middle_name",
      patnts_mother_name: "some updated patnts_mother_name",
      patnts_notes: "some updated patnts_notes",
      patnts_race: "some updated patnts_race",
      patnts_record_active: false,
      patnts_ssn: "some updated patnts_ssn",
      patnts_ssn_na: false,
      patnts_uuid: "some updated patnts_uuid"
    }
    @invalid_attrs %{
      "": nil,
      patient_other_id: nil,
      patnts_birth_dt: nil,
      patnts_deceased: nil,
      patnts_ethnicity_hispanic: nil,
      patnts_father_name: nil,
      patnts_first_name: nil,
      patnts_gender: nil,
      patnts_language_preferred: nil,
      patnts_last_name: nil,
      patnts_middle_name: nil,
      patnts_mother_name: nil,
      patnts_notes: nil,
      patnts_race: nil,
      patnts_record_active: nil,
      patnts_ssn: nil,
      patnts_ssn_na: nil,
      patnts_uuid: nil
    }

    def patient_fixture(attrs \\ %{}) do
      {:ok, patient} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Persons.create_patient()

      patient
    end

    test "list_patients/0 returns all patients" do
      patient = patient_fixture()
      assert Persons.list_patients() == [patient]
    end

    test "get_patient!/1 returns the patient with given id" do
      patient = patient_fixture()
      assert Persons.get_patient!(patient.id) == patient
    end

    test "create_patient/1 with valid data creates a patient" do
      assert {:ok, %Patient{} = patient} = Persons.create_patient(@valid_attrs)
      assert patient.==("some ")
      assert patient.patient_other_id == "some patient_other_id"
      assert patient.patnts_birth_dt == ~D[2010-04-17]
      assert patient.patnts_deceased == true
      assert patient.patnts_ethnicity_hispanic == "some patnts_ethnicity_hispanic"
      assert patient.patnts_father_name == "some patnts_father_name"
      assert patient.patnts_first_name == "some patnts_first_name"
      assert patient.patnts_gender == "some patnts_gender"
      assert patient.patnts_language_preferred == "some patnts_language_preferred"
      assert patient.patnts_last_name == "some patnts_last_name"
      assert patient.patnts_middle_name == "some patnts_middle_name"
      assert patient.patnts_mother_name == "some patnts_mother_name"
      assert patient.patnts_notes == "some patnts_notes"
      assert patient.patnts_race == "some patnts_race"
      assert patient.patnts_record_active == true
      assert patient.patnts_ssn == "some patnts_ssn"
      assert patient.patnts_ssn_na == true
      assert patient.patnts_uuid == "some patnts_uuid"
    end

    test "create_patient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Persons.create_patient(@invalid_attrs)
    end

    test "update_patient/2 with valid data updates the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{} = patient} = Persons.update_patient(patient, @update_attrs)
      assert patient.==("some updated ")
      assert patient.patient_other_id == "some updated patient_other_id"
      assert patient.patnts_birth_dt == ~D[2011-05-18]
      assert patient.patnts_deceased == false
      assert patient.patnts_ethnicity_hispanic == "some updated patnts_ethnicity_hispanic"
      assert patient.patnts_father_name == "some updated patnts_father_name"
      assert patient.patnts_first_name == "some updated patnts_first_name"
      assert patient.patnts_gender == "some updated patnts_gender"
      assert patient.patnts_language_preferred == "some updated patnts_language_preferred"
      assert patient.patnts_last_name == "some updated patnts_last_name"
      assert patient.patnts_middle_name == "some updated patnts_middle_name"
      assert patient.patnts_mother_name == "some updated patnts_mother_name"
      assert patient.patnts_notes == "some updated patnts_notes"
      assert patient.patnts_race == "some updated patnts_race"
      assert patient.patnts_record_active == false
      assert patient.patnts_ssn == "some updated patnts_ssn"
      assert patient.patnts_ssn_na == false
      assert patient.patnts_uuid == "some updated patnts_uuid"
    end

    test "update_patient/2 with invalid data returns error changeset" do
      patient = patient_fixture()
      assert {:error, %Ecto.Changeset{}} = Persons.update_patient(patient, @invalid_attrs)
      assert patient == Persons.get_patient!(patient.id)
    end

    test "delete_patient/1 deletes the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{}} = Persons.delete_patient(patient)
      assert_raise Ecto.NoResultsError, fn -> Persons.get_patient!(patient.id) end
    end

    test "change_patient/1 returns a patient changeset" do
      patient = patient_fixture()
      assert %Ecto.Changeset{} = Persons.change_patient(patient)
    end
  end

  describe "contacts" do
    alias Angio.Persons.Contact

    @valid_attrs %{pacntcts_address: "some pacntcts_address", pacntcts_fname: "some pacntcts_fname", pacntcts_lname: "some pacntcts_lname", pacntcts_mname: "some pacntcts_mname", pacntcts_notes: "some pacntcts_notes", pacntcts_organization: "some pacntcts_organization", pacntcts_period: "some pacntcts_period", pacntcts_period_end: ~D[2010-04-17], pacntcts_period_start: ~D[2010-04-17], pacntcts_relationship: "some pacntcts_relationship", pacntcts_ssn: "some pacntcts_ssn", pacntcts_telecom: "some pacntcts_telecom"}
    @update_attrs %{pacntcts_address: "some updated pacntcts_address", pacntcts_fname: "some updated pacntcts_fname", pacntcts_lname: "some updated pacntcts_lname", pacntcts_mname: "some updated pacntcts_mname", pacntcts_notes: "some updated pacntcts_notes", pacntcts_organization: "some updated pacntcts_organization", pacntcts_period: "some updated pacntcts_period", pacntcts_period_end: ~D[2011-05-18], pacntcts_period_start: ~D[2011-05-18], pacntcts_relationship: "some updated pacntcts_relationship", pacntcts_ssn: "some updated pacntcts_ssn", pacntcts_telecom: "some updated pacntcts_telecom"}
    @invalid_attrs %{pacntcts_address: nil, pacntcts_fname: nil, pacntcts_lname: nil, pacntcts_mname: nil, pacntcts_notes: nil, pacntcts_organization: nil, pacntcts_period: nil, pacntcts_period_end: nil, pacntcts_period_start: nil, pacntcts_relationship: nil, pacntcts_ssn: nil, pacntcts_telecom: nil}

    def contact_fixture(attrs \\ %{}) do
      {:ok, contact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Persons.create_contact()

      contact
    end

    test "list_contacts/0 returns all contacts" do
      contact = contact_fixture()
      assert Persons.list_contacts() == [contact]
    end

    test "get_contact!/1 returns the contact with given id" do
      contact = contact_fixture()
      assert Persons.get_contact!(contact.id) == contact
    end

    test "create_contact/1 with valid data creates a contact" do
      assert {:ok, %Contact{} = contact} = Persons.create_contact(@valid_attrs)
      assert contact.pacntcts_address == "some pacntcts_address"
      assert contact.pacntcts_fname == "some pacntcts_fname"
      assert contact.pacntcts_lname == "some pacntcts_lname"
      assert contact.pacntcts_mname == "some pacntcts_mname"
      assert contact.pacntcts_notes == "some pacntcts_notes"
      assert contact.pacntcts_organization == "some pacntcts_organization"
      assert contact.pacntcts_period == "some pacntcts_period"
      assert contact.pacntcts_period_end == ~D[2010-04-17]
      assert contact.pacntcts_period_start == ~D[2010-04-17]
      assert contact.pacntcts_relationship == "some pacntcts_relationship"
      assert contact.pacntcts_ssn == "some pacntcts_ssn"
      assert contact.pacntcts_telecom == "some pacntcts_telecom"
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Persons.create_contact(@invalid_attrs)
    end

    test "update_contact/2 with valid data updates the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{} = contact} = Persons.update_contact(contact, @update_attrs)
      assert contact.pacntcts_address == "some updated pacntcts_address"
      assert contact.pacntcts_fname == "some updated pacntcts_fname"
      assert contact.pacntcts_lname == "some updated pacntcts_lname"
      assert contact.pacntcts_mname == "some updated pacntcts_mname"
      assert contact.pacntcts_notes == "some updated pacntcts_notes"
      assert contact.pacntcts_organization == "some updated pacntcts_organization"
      assert contact.pacntcts_period == "some updated pacntcts_period"
      assert contact.pacntcts_period_end == ~D[2011-05-18]
      assert contact.pacntcts_period_start == ~D[2011-05-18]
      assert contact.pacntcts_relationship == "some updated pacntcts_relationship"
      assert contact.pacntcts_ssn == "some updated pacntcts_ssn"
      assert contact.pacntcts_telecom == "some updated pacntcts_telecom"
    end

    test "update_contact/2 with invalid data returns error changeset" do
      contact = contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Persons.update_contact(contact, @invalid_attrs)
      assert contact == Persons.get_contact!(contact.id)
    end

    test "delete_contact/1 deletes the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{}} = Persons.delete_contact(contact)
      assert_raise Ecto.NoResultsError, fn -> Persons.get_contact!(contact.id) end
    end

    test "change_contact/1 returns a contact changeset" do
      contact = contact_fixture()
      assert %Ecto.Changeset{} = Persons.change_contact(contact)
    end
  end
end

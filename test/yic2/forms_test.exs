defmodule Yic2.FormsTest do
  use Yic2.DataCase

  alias Yic2.Forms

  describe "forms" do
    alias Yic2.Forms.Form

    import Yic2.FormsFixtures

    @invalid_attrs %{name: nil, version: nil, comment: nil, definition: nil}

    test "list_forms/0 returns all forms" do
      form = form_fixture()
      assert Forms.list_forms() == [form]
    end

    test "get_form!/1 returns the form with given id" do
      form = form_fixture()
      assert Forms.get_form!(form.id) == form
    end

    test "create_form/1 with valid data creates a form" do
      valid_attrs = %{name: "some name", version: %{}, comment: "some comment", definition: %{}}

      assert {:ok, %Form{} = form} = Forms.create_form(valid_attrs)
      assert form.name == "some name"
      assert form.version == %{}
      assert form.comment == "some comment"
      assert form.definition == %{}
    end

    test "create_form/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forms.create_form(@invalid_attrs)
    end

    test "update_form/2 with valid data updates the form" do
      form = form_fixture()
      update_attrs = %{name: "some updated name", version: %{}, comment: "some updated comment", definition: %{}}

      assert {:ok, %Form{} = form} = Forms.update_form(form, update_attrs)
      assert form.name == "some updated name"
      assert form.version == %{}
      assert form.comment == "some updated comment"
      assert form.definition == %{}
    end

    test "update_form/2 with invalid data returns error changeset" do
      form = form_fixture()
      assert {:error, %Ecto.Changeset{}} = Forms.update_form(form, @invalid_attrs)
      assert form == Forms.get_form!(form.id)
    end

    test "delete_form/1 deletes the form" do
      form = form_fixture()
      assert {:ok, %Form{}} = Forms.delete_form(form)
      assert_raise Ecto.NoResultsError, fn -> Forms.get_form!(form.id) end
    end

    test "change_form/1 returns a form changeset" do
      form = form_fixture()
      assert %Ecto.Changeset{} = Forms.change_form(form)
    end
  end

  describe "datasources" do
    alias Yic2.Forms.Datasource

    import Yic2.FormsFixtures

    @invalid_attrs %{name: nil, version: nil, comment: nil, definition: nil, actions: nil}

    test "list_datasources/0 returns all datasources" do
      datasource = datasource_fixture()
      assert Forms.list_datasources() == [datasource]
    end

    test "get_datasource!/1 returns the datasource with given id" do
      datasource = datasource_fixture()
      assert Forms.get_datasource!(datasource.id) == datasource
    end

    test "create_datasource/1 with valid data creates a datasource" do
      valid_attrs = %{name: "some name", version: %{}, comment: "some comment", definition: %{}, actions: ["option1", "option2"]}

      assert {:ok, %Datasource{} = datasource} = Forms.create_datasource(valid_attrs)
      assert datasource.name == "some name"
      assert datasource.version == %{}
      assert datasource.comment == "some comment"
      assert datasource.definition == %{}
      assert datasource.actions == ["option1", "option2"]
    end

    test "create_datasource/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forms.create_datasource(@invalid_attrs)
    end

    test "update_datasource/2 with valid data updates the datasource" do
      datasource = datasource_fixture()
      update_attrs = %{name: "some updated name", version: %{}, comment: "some updated comment", definition: %{}, actions: ["option1"]}

      assert {:ok, %Datasource{} = datasource} = Forms.update_datasource(datasource, update_attrs)
      assert datasource.name == "some updated name"
      assert datasource.version == %{}
      assert datasource.comment == "some updated comment"
      assert datasource.definition == %{}
      assert datasource.actions == ["option1"]
    end

    test "update_datasource/2 with invalid data returns error changeset" do
      datasource = datasource_fixture()
      assert {:error, %Ecto.Changeset{}} = Forms.update_datasource(datasource, @invalid_attrs)
      assert datasource == Forms.get_datasource!(datasource.id)
    end

    test "delete_datasource/1 deletes the datasource" do
      datasource = datasource_fixture()
      assert {:ok, %Datasource{}} = Forms.delete_datasource(datasource)
      assert_raise Ecto.NoResultsError, fn -> Forms.get_datasource!(datasource.id) end
    end

    test "change_datasource/1 returns a datasource changeset" do
      datasource = datasource_fixture()
      assert %Ecto.Changeset{} = Forms.change_datasource(datasource)
    end
  end

  describe "datadefs" do
    alias Yic2.Forms.Datadef

    import Yic2.FormsFixtures

    @invalid_attrs %{name: nil, version: nil, comment: nil, definition: nil}

    test "list_datadefs/0 returns all datadefs" do
      datadef = datadef_fixture()
      assert Forms.list_datadefs() == [datadef]
    end

    test "get_datadef!/1 returns the datadef with given id" do
      datadef = datadef_fixture()
      assert Forms.get_datadef!(datadef.id) == datadef
    end

    test "create_datadef/1 with valid data creates a datadef" do
      valid_attrs = %{name: "some name", version: %{}, comment: "some comment", definition: %{}}

      assert {:ok, %Datadef{} = datadef} = Forms.create_datadef(valid_attrs)
      assert datadef.name == "some name"
      assert datadef.version == %{}
      assert datadef.comment == "some comment"
      assert datadef.definition == %{}
    end

    test "create_datadef/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forms.create_datadef(@invalid_attrs)
    end

    test "update_datadef/2 with valid data updates the datadef" do
      datadef = datadef_fixture()
      update_attrs = %{name: "some updated name", version: %{}, comment: "some updated comment", definition: %{}}

      assert {:ok, %Datadef{} = datadef} = Forms.update_datadef(datadef, update_attrs)
      assert datadef.name == "some updated name"
      assert datadef.version == %{}
      assert datadef.comment == "some updated comment"
      assert datadef.definition == %{}
    end

    test "update_datadef/2 with invalid data returns error changeset" do
      datadef = datadef_fixture()
      assert {:error, %Ecto.Changeset{}} = Forms.update_datadef(datadef, @invalid_attrs)
      assert datadef == Forms.get_datadef!(datadef.id)
    end

    test "delete_datadef/1 deletes the datadef" do
      datadef = datadef_fixture()
      assert {:ok, %Datadef{}} = Forms.delete_datadef(datadef)
      assert_raise Ecto.NoResultsError, fn -> Forms.get_datadef!(datadef.id) end
    end

    test "change_datadef/1 returns a datadef changeset" do
      datadef = datadef_fixture()
      assert %Ecto.Changeset{} = Forms.change_datadef(datadef)
    end
  end

  describe "dataelements" do
    alias Yic2.Forms.Dataelement

    import Yic2.FormsFixtures

    @invalid_attrs %{name: nil, version: nil, comment: nil, definition: nil, actions: nil}

    test "list_dataelements/0 returns all dataelements" do
      dataelement = dataelement_fixture()
      assert Forms.list_dataelements() == [dataelement]
    end

    test "get_dataelement!/1 returns the dataelement with given id" do
      dataelement = dataelement_fixture()
      assert Forms.get_dataelement!(dataelement.id) == dataelement
    end

    test "create_dataelement/1 with valid data creates a dataelement" do
      valid_attrs = %{name: "some name", version: %{}, comment: "some comment", definition: %{}, actions: ["option1", "option2"]}

      assert {:ok, %Dataelement{} = dataelement} = Forms.create_dataelement(valid_attrs)
      assert dataelement.name == "some name"
      assert dataelement.version == %{}
      assert dataelement.comment == "some comment"
      assert dataelement.definition == %{}
      assert dataelement.actions == ["option1", "option2"]
    end

    test "create_dataelement/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Forms.create_dataelement(@invalid_attrs)
    end

    test "update_dataelement/2 with valid data updates the dataelement" do
      dataelement = dataelement_fixture()
      update_attrs = %{name: "some updated name", version: %{}, comment: "some updated comment", definition: %{}, actions: ["option1"]}

      assert {:ok, %Dataelement{} = dataelement} = Forms.update_dataelement(dataelement, update_attrs)
      assert dataelement.name == "some updated name"
      assert dataelement.version == %{}
      assert dataelement.comment == "some updated comment"
      assert dataelement.definition == %{}
      assert dataelement.actions == ["option1"]
    end

    test "update_dataelement/2 with invalid data returns error changeset" do
      dataelement = dataelement_fixture()
      assert {:error, %Ecto.Changeset{}} = Forms.update_dataelement(dataelement, @invalid_attrs)
      assert dataelement == Forms.get_dataelement!(dataelement.id)
    end

    test "delete_dataelement/1 deletes the dataelement" do
      dataelement = dataelement_fixture()
      assert {:ok, %Dataelement{}} = Forms.delete_dataelement(dataelement)
      assert_raise Ecto.NoResultsError, fn -> Forms.get_dataelement!(dataelement.id) end
    end

    test "change_dataelement/1 returns a dataelement changeset" do
      dataelement = dataelement_fixture()
      assert %Ecto.Changeset{} = Forms.change_dataelement(dataelement)
    end
  end
end

defmodule Yic2.SchemaValidator do
  require Logger
  alias Yic2.Forms

  # A datadefinition is always in Map form.
  def validate_changes_against_schema( changeset, schema ) when is_map(schema) do
    # first get data and proposed changes
    %{params: params, errors: errors} = changeset
    new = validate_data params, schema
    case new do
      []    -> changeset
      [_|_] -> %{changeset | errors: new ++ errors, valid?: false}
    end
  end

  # Helper function.
  # If datadef is defined as string, it will be retrieved from database.
  def validate_changes_against_schema( changeset, schema_name ) when is_binary( schema_name ) do
    dd = Forms.get_datadef_by_name!( schema_name )
    validate_changes_against_schema( changeset, dd.definition )
  end

  def validate_data data, schema do

    root = JSV.build!(schema)
    case JSV.validate(data, root) do
      {:ok, _output} -> []
      {:error, err} -> flatten_errors( [], JSV.normalize_error(err).details )
    end
  end

  def flatten_errors( new_errors, [] ), do: new_errors

  def flatten_errors new_errors, [ error | list ] do
    new_error = flatten_error error
    flatten_errors [new_error|new_errors], list
  end

  def flatten_error error do
    msg = Enum.at( error.errors, 0 ).message
    {error.instanceLocation, {msg, []}}
  end

end
defmodule TodoApiWeb.ChangeSetView do
    use TodoApiWeb, :view

    def translate_errrors(changeset) do
        Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
    end

    def render("error.json", %{changeset: changeset}) do
        %{errors: translate_errrors(changeset)}
    end
end

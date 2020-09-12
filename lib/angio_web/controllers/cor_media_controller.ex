defmodule AngioWeb.Cor_mediaController do
  use AngioWeb, :controller

  alias Angio.Cor_mediae
  alias Angio.Cor_mediae.Cor_media
  import AngioPlug
  plug(:assign_info_coronary)
  plug(:assign_patient)

  alias Angio.Repo

  plug(:scrub_params, "cor_media" when action in [:create, :update])

  def index(conn, _params) do
    cor_mediae = Cor_mediae.list_cor_mediae(conn)
    render(conn, "index.html", cor_mediae: cor_mediae)
  end

  def new(conn, _params) do
    changeset = Cor_mediae.change_cor_media(%Cor_media{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cor_media" => cor_media_params}) do
    #######################
    changeset =
      conn.assigns[:info_coronary]
      |> Ecto.build_assoc(:cor_mediae)
      |> Cor_media.changeset(cor_media_params)

    case Repo.insert(changeset) do
      {:ok, _cor_media} ->
        conn
        |> put_flash(:info, "Media  Record created successfully.")
        |> redirect(
          to:
            Routes.pt_angio_cor_media_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end

    ####################

    ##########################
  end

  def create(conn, params) do
    msg =
      if Map.get(params, "mime_name") == nil do
        "No Image Media file selected"
      else
        "Please try again, something went wrong"
      end

    conn
    |> put_flash(:info, msg)
    |> redirect(
      to:
        Routes.pt_angio_cor_media_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    # |> redirect(to: Routes.photo_path(conn, :new))
  end

  def show(conn, %{"id" => id}) do
    cor_media = Cor_mediae.get_cor_media!(id)
    render(conn, "show.html", cor_media: cor_media)
  end

  def edit(conn, %{"id" => id}) do
    cor_media = Cor_mediae.get_cor_media!(id)
    changeset = Cor_mediae.change_cor_media(cor_media)
    render(conn, "edit.html", cor_media: cor_media, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cor_media" => cor_media_params}) do
    cor_media = Cor_mediae.get_cor_media!(id)

    case Cor_mediae.update_cor_media(cor_media, cor_media_params) do
      {:ok, _cor_media} ->
        conn
        |> put_flash(:info, "Cor media updated successfully.")
        |> redirect(
          to:
            Routes.pt_angio_cor_media_path(
              conn,
              :index,
              conn.assigns[:patient],
              conn.assigns[:info_coronary]
            )
        )

      # |> redirect(to: Routes.cor_media_path(conn, :show, cor_media))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cor_media: cor_media, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cor_media = Cor_mediae.get_cor_media!(id)
    {:ok, _cor_media} = Cor_mediae.delete_cor_media(cor_media)

    # {:ok, original_filename} =
    #   Angio.CorMedia.store({"uploads/cor_media.mime_name", cor_media})
    # :ok = Angio.CorMedia.delete({original_filename, cor_media})
    # Ecto.Changeset.change(cor_media, %{mime_name: nil})

    conn
    |> put_flash(:info, "Cor media deleted successfully.")
    |> redirect(
      to:
        Routes.pt_angio_cor_media_path(
          conn,
          :index,
          conn.assigns[:patient],
          conn.assigns[:info_coronary]
        )
    )

    #  |> redirect(to: Routes.cor_media_path(conn, :index))
  end
end

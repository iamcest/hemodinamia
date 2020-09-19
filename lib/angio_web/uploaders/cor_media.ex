defmodule Angio.CorMedia do
  use Arc.Definition
  use Arc.Ecto.Definition
  # alias Angio.Cor_mediae.Cor_media

  # To add a thumbnail version:
  @versions [:original, :thumb]

  @acl :public_read

  def validate({file, _}) do
    ~w(.jpg .jpeg .gif .png .pdf .mp4) |> Enum.member?(Path.extname(file.file_name))
  end

  # Define a thumbnail transformation:
  #orgiginal func
  #def transform(:thumb, _) do
  #  {:convert, "-thumbnail 128x128^ -gravity center -extent 128x128 -format png", :png}
  #end

  # Define a thumbnail transformation:
 def transform(:thumb, {file, _scope}) do
  if Enum.member?(~w(.jpg .jpeg .gif .png), Path.extname(file.file_name)) do
    {:convert, "-strip -thumbnail 250x250^ -format png", :png}
  else
    :noaction
  end

end

def __storage do
    Arc.Storage.Local
  end

def filename(version, {file, _scope}) do
    file_name = Path.basename(file.file_name, Path.extname(file.file_name))

    "#{version}_#{file_name}"
  end

  def filename(version, _) do
    version
  end

  # Override the storage directory:

 # def storage_dir(_version, {_file, media}) do
 #   "uploads/data/#{media.data.id}/mediae/"
 # end

  # def filename(version, _) do
  #  version
  # end

  # def filename(version, {file, scope}) do
  #  IO.puts("--------------scope")
  #  IO.inspect(scope)
  #  "#{scope.id}"
  #  # "#{scope.uuid()}_#{version}"
  # end

  #  def storage_dir(version, {file, scope}) do
  #    "uploads/patients/images/#{scope.id}"
  # end

  # def storage_dir(version, {file, scope}) do
  #    "uploads/patients/images"
  #   # Not working   "uploads/pts/images/#{scope.info_coronary_id}"
  #  end

  # Override the storage directory:
  # def storage_dir(version, {file, scope}) do
  # Angio.get_env(:photo_gallery, :upload_dir)
  # end

  # def storage_dir(_, {_, cor_mediae}) do
  #   "uploads/info_coronary/#{cor_mediae.info_coronary_id}/images/#{cor_mediae.uuid}"
  #  # #"uploads/rentals/#{image.rental_id}/images/#{image.id}/#{version}"
  # end

  # Specify custom headers for s3 objects
  # Available options are [:cache_control, :content_disposition,
  #    :content_encoding, :content_length, :content_type,
  #    :expect, :expires, :storage_class, :website_redirect_location]
  #
  # def s3_object_headers(version, {file, scope}) do
  #   [content_type: Plug.MIME.path(file.file_name)]
  # end
end

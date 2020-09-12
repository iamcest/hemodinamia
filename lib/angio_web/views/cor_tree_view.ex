defmodule AngioWeb.Cor_treeView do
  use AngioWeb, :view

  def render("scripts.show.html", assigns) do
    entry_path = Routes.static_path(assigns.conn, "/js/draw_coronary.js")
    # raw("<script src=\"#{entry_path}\"></script>")
    raw("<script>
    var tag = document.createElement(\"script\");
    tag.src = \"#{entry_path}\" ;
    document.getElementsByTagName(\"head\")[0].appendChild(tag);
    </script>")
  end

  # def render("scripts.index.html", _assigns) do
  #  ~E(<script src="index-file.js"></script>)
  # end
end

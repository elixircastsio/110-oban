defmodule TeacherWeb.PageController do
  use TeacherWeb, :controller

  alias Teacher.Workers.ProcessorWorker

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, _params) do
    length = Enum.random(4_000..8_000)

    %{length: length}
    |> ProcessorWorker.new()
    |> Oban.insert()

    conn
    |> put_flash(:info, "Work completed")
    |> render("done.html")
  end
end

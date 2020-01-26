defmodule Teacher.Workers.ProcessorWorker do
  use Oban.Worker, queue: :hard_worker

  def perform(%{"length" => length}, job) do
    IO.puts("Starting work...")
    Teacher.Processor.process(length)
    IO.inspect(job)
    IO.puts("Finished work")
  end

end

# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    start_time = Process.clock_gettime Process::CLOCK_MONOTONIC
    status, headers, body = @app.call env
    end_time = Process.clock_gettime Process::CLOCK_MONOTONIC
    milliseconds = (end_time - start_time) * 1000

    body << "Execution time in ms: #{milliseconds.round(3)}"
    [status, headers, body]
  end
end

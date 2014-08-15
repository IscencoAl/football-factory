namespace :server do

  desc 'server stop'
  task :stop do
    pid_file = 'tmp/pids/server.pid'

    if File.file?(pid_file)
      print "Shutting down rails server"
      pid = File.read(pid_file).to_i
      Process.kill "INT", pid
    end

    File.file?(pid_file) && File.delete(pid_file)
  end

  desc 'server start'
  task :start do
    print "Starting rails server on port 4400"
    system "rails s -p 4400"
  end

end
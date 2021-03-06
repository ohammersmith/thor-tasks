class Git < Thor
  desc "stockpile [REPO]", "Create a clone of [REPO], in a central location."
  def stockpile(remote)
    puts "Stockpiling repository #{remote}..."
    stockpile = File.join(ENV['HOME'], "git-stockpile")
    uri = URI(remote)
    local = File.join(stockpile, uri.host, uri.path).chomp(".git")
    FileUtils.mkdir_p(File.dirname(local))
    cmd = "git clone #{remote} #{local}"
    puts(cmd)
    system(cmd)
  end
end



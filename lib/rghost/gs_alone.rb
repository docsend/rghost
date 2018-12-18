class RGhost::GSAlone #:nodoc:
  
  def initialize(params,debug=false)
    @params=params.dup
    @params[0]=" "
    @debug=debug
  end
  
  def run
    cmd=@params.join(" ")
    #puts File.exists?(RGhost::Config::GS[:path].to_s)
    unless File.exists?(RGhost::Config::GS[:path].to_s)
      RGhost::Config.config_platform
    end

    full_command = "#{RGhost::Config::GS[:path]}#{cmd}"
    timeout = RGhost::Config::GS[:timeout].to_i
    if timeout > 0
      full_command = "timeout #{timeout}s #{full_command}"
    end
    r=system(full_command)
    
    puts full_command if @debug
    #puts r
    r
  end
  

  
end


# -*- coding: utf-8 -*-
require 'rake/clean'

HOME = ENV["HOME"]
PWD = File.dirname(__FILE__)
OS = `uname`

def symlink_ file, dest
  symlink file, dest if not File.exist?(dest)
end

def same_name_symlinks root, files
  files.each do |file|
    symlink_ File.join(root, file), File.join(HOME, "." + file)
  end
end

cleans = [
          ".vim",
          ".zshrc",
          ".tigrc",
          ".tmux.conf",
          ".gitconfig",
          ".gitignore.global",
          ".gemrc",
         ]

CLEAN.concat(cleans.map{|c| File.join(HOME,c)})

task :default => :setup
task :setup => [
              "vim:link",
              "git:link",
              "tig:link",
              "tmux:link",
              "zsh:link",
              "peco:link",
              "etc:link"]

namespace :vim do
  desc "Create symbolic link to HOME"
  task :link do
    
    # If .vim is already exist, backup it
    if File.exist?(File.join(HOME, ".vim")) && !File.symlink?(File.join(HOME, ".vim")) 
      mv File.join(HOME, ".vim"), File.join(HOME, ".vim.org")
    end
    
    symlink_ File.join(PWD, "vim"), File.join(HOME,".vim")
  end
end

namespace :zsh do
  desc "Create symbolic link to HOME/.zshrc"
  task :link do

    # If `.zshrc` is already exist, backup it
    if File.exist?(File.join(HOME, ".zshrc")) && !File.symlink?(File.join(HOME, ".zshrc"))
      mv File.join(HOME, ".zshrc"), File.join(HOME, ".zshrc.org")
    end

    symlink_ File.join(PWD, "zsh/zshrc"), File.join(HOME, ".zshrc")      
  end
end

namespace :git do
  desc "Create symbolic link to HOME"
  task :link do    
    same_name_symlinks File.join(PWD, "git"), ["gitconfig", "gitignore.global"]
  end
end

namespace :tmux do  
  desc "Create symblic link to HOME"
  task :link do
    same_name_symlinks File.join(PWD, "tmux"), ["tmux.conf"]
  end
end

namespace :peco do
  desc "Create symbolic link"
  task :link do
    sh "mkdir -p $HOME/.config/peco/" 
    symlink_ File.join(PWD, "peco/config.json"), File.join(HOME, ".config/peco/config.json")
  end
end

namespace :etc do
  task :link do
    etcs  =  Dir.glob("etc" +  "/*").map{|path| File.basename(path)}
    same_name_symlinks File.join(PWD, "etc"), etcs
  end
end

namespace :tig do
  task :link do
    tigs  =  Dir.glob("tig" +  "/*").map{|path| File.basename(path)}
    same_name_symlinks File.join(PWD, "tig"), tigs
  end
end
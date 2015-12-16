require 'formula'

class GitHooks < Formula
  homepage 'https://github.com/simonpercivall/git-hooks'
  version '1.0'
  head 'https://github.com/simonpercivall/git-hooks.git'
  
  def install
    bin.install('git-hooks')
    man1.install('git-hooks.1')
  end
end

# encoding: utf-8
# tested with ruby 1.9.2

module Ec1 module Users module Utils
require 'ec1/lib/toolkit/standard.rb'
include Ec1::Lib::Toolkit::Standard

class SshAgent
  def initialize
    abort unless check_agent
  end
  def add(certificate)
  end
  def list_certificates
    puts "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts "~~  certificates for current ssh-agent                    ~~"
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    puts syscall_certificates_list
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n\n"
  end
  def agent_infos
    puts "SSH_AGENT_PID = #{ENV['SSH_AGENT_PID']}"
    puts "SSH_AUTH_SOCK = #{ENV['SSH_AUTH_SOCK']}"
  end
  def add_certificate(certificates=["#{ENV_HOME}/.ssh/id_rsa"])
    certificates.each do |certificate|
      certificate_added?(certificate) ? puts("certificate #{certificate} already added") : syscall_sshadd(certificate)
    end
    list_certificates
  end

  def test(test=nil)
    certificates_list_empty?
  end

  private

  ENV_HOME = ENV['HOME']
  def check_agent
    ENV['SSH_AGENT_PID'] ? true : abort("#{USAGE}no active agent detected, run:\nssh-agent bash\n\n")
  end
  def syscall_certificates_list
    `ssh-add -l`.split("\n")
  end
  def syscall_sshadd(certificate)
    system "ssh-add #{certificate}"
  end
  def certificate_added?(certificate_file)
    abort unless check_agent
    certificate_present = nil
    syscall_certificates_list.each do |certificate_line|
      strength, hash, file, protocol = certificate_line.split
      (certificate_present = true) if (file == certificate_file)
    end
    certificate_present.nil? ? false : true
  end
  def certificates_list_empty?(certificate_list=syscall_certificates_list)
    puts certificate_list.join
    #NO_IDENTITIES = 'The agent has no identities.'
    #TODO
  end
end

end end end


# Project infos >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>># {{{
# Project: Epiculture
# Author: Pierre-Mael Cretinon
# Email: projects2011@3eclipses.com
# coding style: 0.0.2
# License: GNU GPLv3
#
# Notes:
#
# License details:
# <copyright/copyleft>
# Copyright 2010-2011 (c) Pierre-Mael CRETINON <copyleft@pierremael.net>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# 
# </copyright/copyleft>
# Project infos <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<# }}}
#vim: foldmethod=marker

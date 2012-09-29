# encoding: utf-8
# tested with ruby 1.9.3

module X module Xtra module Users
  require_relative '../0x1_lib.helper.rb'

  class Sshfs
    include X::Lib::Toolkit::Standard

    def initialize
      @x_lib_path_base = X_LIB_PATH_BASE
      x__lib_load_modules([:standard])
      shares_infos()
    end

    def list_shares
      puts @shares_infos.keys.sort
    end

    def mount
      @shares_infos.each do |share, share_infos|
        puts "mounting #{share_infos[:local_path]}"
        system "sshfs #{share_infos[:source]} #{share_infos[:local_path]} #{share_infos[:options]} &"
      end
    end

    def umount
      @shares_infos.each do |share, share_infos|
        puts "umounting #{share_infos[:local_path]}"
        system "fusermount -u #{share_infos[:local_path]}"
      end
    end

    private

    ENV_HOME = ENV['HOME']

    def shares_infos
      @shares_infos={}
      read_local_defshares.each do |local_share|
        code, source, local_path, options = local_share.match(/^(\S*)\s+(\S*)\s+(\S*)\s*(.*)$/).captures
        @shares_infos[code] = {:source => source, :local_path => local_path, :options => options}
      end
    end

    def read_local_defshares
      read_defshares_raw = []
      x__dir_ls("#{ENV_HOME}/.0x1/00mu/sshfs/00shares/active").each {|share_file|
        filename = File.basename(share_file)
        inter = x__file_read(share_file)
        full_desc = "#{filename} #{inter}"
        read_defshares_raw << full_desc
      }
      return read_defshares_raw
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

# encoding: utf-8
# tested with ruby 1.9.2

module X module Users module Utils

class Templates
require '0x1/lib/toolkit/full.rb'
include X::Lib::Toolkit::Standard
  def initialize(new_file, type='ruby_pima_copyleft')
    @new_file = new_file
  end
  def create
    abort "file #{@new_file} exists already" if File.exist?(@new_file)
    ruby_template_path='/.0x1/00scripts/0x1_users/data/templates/ruby/template_ruby'
    ruby_template = open(ruby_template_path, &:read)
    ec1__file_save(ruby_template, @new_file, '700')
  end
  def launch_editor
    system("gvim #{@new_file}")
  end
  def help
    puts <<-hdhelp
    create templates.
    usage :
    X::Users::Template.new(<template_type>, [<template_options>])
    hdhelp
  end
  def catfly
    'foo'
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

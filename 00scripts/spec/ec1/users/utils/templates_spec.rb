#!/usr/bin/env ruby
# encoding: utf-8
# tested with ruby 1.9.2

module Ec1 module Users module Utils
require 'ec1/users/utils/templates.rb'
require 'minitest/spec.rb'
require 'minitest/autorun.rb'

describe Templates do

  before do
    @template = Templates.new('caat')
  end

  describe "when testing catfly" do
    it "should respond 'foo'" do
      @template.catfly.must_equal "foo"
    end
  end

  describe "when testing test_create" do
    it "should skip" do
      skip "TODO"
    end
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
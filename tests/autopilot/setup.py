#!/usr/bin/python
# -*- Mode: Python; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
#
# Ubuntu Keyboard Autopilot Test Suite
# Copyright (C) 2013 Canonical
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


from distutils.core import setup
from setuptools import find_packages

setup(
    name='ubuntu_keyboard',
    version='1.0',
    description='Ubuntu Keyboard autopilot tests and emulators.',
    url='https://launchpad.net/ubuntu-keyboard',
    license='GPLv3',
    packages=find_packages(),
    data_files=[
        ('share/applications', ['ubuntu-keyboard-tester.desktop'])
    ]
)

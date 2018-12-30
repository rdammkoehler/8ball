#!/usr/bin/env python

from setuptools import setup

VERSION = '1.0.0.0'

setup(name='8ball',
      version=VERSION,
      description='Magic 8-Ball Service',
      author='Rich Dammkoehler',
      author_email='rpd@noradltd.com',
      url='https://github.com/rdammkoehler',
      packages=['8ball'],
      install_requires=[
          'Flask'
      ],
      extras_require={
          'build': [
              'wheel',
              'twine'
          ],
          'test': []
      }
      )

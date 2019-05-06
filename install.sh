#!/bin/bash
# An auto-installer for RoR app

bundle install
rails db:create
rails db:migrate
rails db:seed
rails s
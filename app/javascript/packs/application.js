import "@hotwired/turbo-rails"
import 'bootstrap'
import '../stylesheets/application'
import 'channels'

import "controllers"

import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = false

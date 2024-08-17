// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from "@hotwired/turbo-rails";
import "bootstrap";
import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

const application = Application.start();
const context = require.context("./controllers", true, /\.js$/);
application.load(definitionsFromContext(context));

// Inicialize Bootstrap Dropdowns após o carregamento do Turbo
document.addEventListener('turbo:load', function () {
  // Reinitialize Bootstrap dropdowns
  var dropdownElements = document.querySelectorAll('.dropdown-toggle');
  dropdownElements.forEach(function (element) {
    new bootstrap.Dropdown(element);
  });
});


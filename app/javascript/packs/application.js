// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("jquery");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

$(document).ready(function () {
  $(document).on("click", ".cafeteria-navbarHeading > .container", function () {
    $(this).toggleClass("change");
    $(".cafeteria-navbarAllButtons").toggle(300);
  });

  $(document).on("click", ".menuButton", function () {
    $(".cafeteria-menu").toggle(300);
  });

  $(document).on("change", "#menu-name", function () {
    if ($(this).val() == "Others") {
      $("#new_menu_name").show(300, function () {
        $(".new-menu-name-edit").css({ display: "block" });
      });
    } else {
      $("#new_menu_name").hide(300);
    }
  });

  $(document).on("click", "#menuName", function () {
    id = $(this).attr("class");
    position = $("#" + id).position();
    $("html").animate({ scrollTop: position.top }, 500);
    if ($(window).innerWidth() < 800) {
      $(".cafeteria-menu").hide(300);
    }
  });
});

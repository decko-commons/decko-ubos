# -*- encoding : utf-8 -*-

Decko.application.routes.draw do
  rel_root = Cardio.config.relative_url_root

  mount Decko::Engine => "#{rel_root}/"
end

Rails.application.routes.draw do

  mount BcmsNews::Engine => "/bcms_news"
  mount_browsercms
end

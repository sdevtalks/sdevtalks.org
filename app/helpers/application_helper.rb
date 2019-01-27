module ApplicationHelper
  def default_meta_tags
    {
      site: "s-dev talks",
      description: "s-dev talks は、サービスづくりに関わる人々が「エンジニア」や「デザイナー」といった職種 にとらわれず、「サービス開発者」として交流するための草の根コミュニティです。",
      og: {
        site_name: "s-dev talks",
        description: "s-dev talks は、サービスづくりに関わる人々が「エンジニア」や「デザイナー」といった職種 にとらわれず、「サービス開発者」として交流するための草の根コミュニティです。",
        type: (controller_name == "top" && action_name == "index") ? "site" : "article",
        url: request.original_url,
        image: image_url("sdev_ogp@3x.jpg")
      }
    }
  end
end

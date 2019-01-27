module ApplicationHelper
  def default_meta_tags
    description = "s-dev talks は、サービスづくりに関わる人々が「エンジニア」や「デザイナー」といった職種 にとらわれず、「サービス開発者」として交流するための草の根コミュニティです。"
    url = "https://sdevtalks.org" + request.fullpath # original urlがherokuappsのためドメイン直書き
    {
      site: "s-dev talks",
      description: description,
      reverse: true,
      og: {
        title: "s-dev talks", # TODO: ペータイトルが入らない
        site_name: "s-dev talks",
        description: description,
        type: (controller_name == "top" && action_name == "index") ? "site" : "article",
        url: url,
        image: image_url("sdev_ogp@3x.jpg")
      },
      twitter: {
        card: "summary_large_image",
        title: "s-dev talks", # TODO: ページタイトルが入らない
        description: description,
        image: image_url("sdev_ogp@3x.jpg")
      }
    }
  end
end

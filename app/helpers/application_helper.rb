module ApplicationHelper
  # 各ページのタイトル設定
  def page_title(page_title = '', admin: false)
    base_title = if admin
                  'お疲れ様です(管理画面)'
                else
                  'お疲れ様です'
                end
    page_title.empty? ? base_title : "#{base_title}|#{page_title}"
  end




  def default_meta_tags
    {
      site: 'お疲れ様です',
      title: 'お疲れ様です!差し入れです',
      reverse: true,
      charset: 'utf-8',
      description: '応援したい人、疲れている人、闇堕ちしてしまった人を励ましたいという思いから作ったサービスです',
      keywords: '擬似差し入れ,励まし,応援',
      canonical: request.original_url,
      separator: '|',
      noindex: !Rails.env.production?,
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp-image.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@ZCunkuma',
        image: image_url('ogp-image.png')
      }
    }
  end
end

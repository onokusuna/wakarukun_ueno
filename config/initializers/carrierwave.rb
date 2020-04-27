CarrierWave.configure do |config|
  # config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    # アクセスキー
    aws_access_key_id:     ENV['ACCESS'],
    # シークレットキー
    aws_secret_access_key: ENV['SECRET_ACCESS'],
    # Tokyo
    region:                'ap-northeast-1',

    path_style:            true
  }

  # 公開・非公開の切り替え
  config.fog_public     = true
  # キャッシュの保存期間
  config.fog_attributes = { 'Cache-Control' => "public.max-age=#{365.day.to_i}" }

  # キャッシュをS3に保存
  # config.cache_storage = :fog

  # 環境ごとにS3のバケットを指定
  case Rails.env
    when 'production'
      config.fog_directory = 'rails-portfolio-1'
      config.asset_host = 'http://rails-portfolio-1.s3.ap-northeast-1.amazonaws.com'
    when 'development'
      config.fog_directory = 'rails-portfolio-1'
      config.asset_host = 'http://rails-portfolio-1.s3.ap-northeast-1.amazonaws.com'
  end
end

# 日本語ファイル名の設定
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
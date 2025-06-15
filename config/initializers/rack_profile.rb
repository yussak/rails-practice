# 開発環境で左上に出てくるmsをデフォルト非表示にする
if defined?(Rack::MiniProfiler)
  Rack::MiniProfiler.config.start_hidden = true
end

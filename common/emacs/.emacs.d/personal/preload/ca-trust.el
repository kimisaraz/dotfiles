;;; ca-trust.el --- TLS 接続で使う CA 証明書の設定（macOS）
;;
;;; Commentary:
;;
;; このファイルはPreludeのコアモジュールより前にロードされる。
;; パッケージのダウンロードより先に効かせるため preload に置いている。
;; macOS のデフォルトの /etc/ssl/cert.pem は更新が遅く、
;; 失効済みの CA（2026年10月の eMudhra の件など）を信頼したままになる。
;; macOS では Homebrew の ca-certificates が管理する証明書リストを使う。
;; Linux はディストリの ca-certificates で更新されるので変更しない。

;;; Code:

(when (eq system-type 'darwin)
  (let ((brew-cert "/opt/homebrew/etc/gnutls/cert.pem"))
    (when (file-exists-p brew-cert)
      (setq gnutls-trustfiles (list brew-cert)))))

(provide 'ca-trust)
;;; ca-trust.el ends here

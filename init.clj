(require '[babashka.fs :as fs])
(doseq [file (filter fs/regular-file? (fs/list-dir ".fonts"))]
  (fs/copy file
           (str (System/getProperty "user.home") "/Library/Fonts")
           {:replace-existing true}))

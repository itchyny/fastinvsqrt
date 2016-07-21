(defn fast-inv-sqrt [x]
  (let [i (Float/floatToRawIntBits x)
        y (Float/intBitsToFloat (- 0x5f3759df (bit-shift-right i 1)))]
    (* y (- 1.5 (* 0.5 x y y)))))

(doseq [line (line-seq (java.io.BufferedReader. *in*))]
  (try (println (fast-inv-sqrt (read-string line)))
      (catch java.lang.RuntimeException e ())))

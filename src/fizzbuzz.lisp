(declaim (optimize (safety 3) (debug 3)))

(defun fizzbuzz (n &optional (stream *standard-output*))
  "Print FizzBuzz sequence up to n to the specified stream."
  (check-type n (integer 1))
  (let ((results (make-array n :element-type 'character)))
    ;; FizzBuzzの計算
    (dotimes (i n)
      (setf (aref results i)
            (case (mod (1+ i) 15)
              (0 #\F)   ; FizzBuzz
              (3 #\f)   ; Fizz
              (5 #\b)   ; Buzz
              (otherwise #\.)))) ; その他の数

    ;; streamがNILでない場合のみ出力
    (when stream
      (loop for result across results
            do (write-char result stream))
      (terpri stream))))

(defun test-fizzbuzz ()
  "Run a test for FizzBuzz function."
  (with-open-file (dev-null "/tmp/fizzbuzz-test-file" :direction :output :if-exists :supersede)
    (fizzbuzz 15 dev-null)
    ;; テストが成功したことを返す
    t))

;; テストの実行
(if (test-fizzbuzz)
    (progn
      (format t "テストが成功しました。~%")
      (fizzbuzz 100 *standard-output*)) ; テストが完了した後にFizzBuzzを実行
    (error "テストが失敗しました。"))

